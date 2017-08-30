<?php

require 'httpful.phar';

/**
 * @param string $requestType
 * @param $api
 * @param $requestUrl
 * @param $user
 * @param $pass
 * @param string $authMethod
 * @return \Httpful\Response
 */
function apiRequest($requestType, $api, $requestUrl, $user, $pass, $authMethod = "basic")
{
    $uri = $api . "/" . $requestUrl;

    $query = null;
    switch (strtoupper($requestType)) {
        case 'GET':
            $query = \Httpful\Request::get($uri);
            break;
        case 'DELETE':
            $query = \Httpful\Request::delete($uri);
            break;
        case 'PUT':
            $requestBody = json_decode(file_get_contents("php://stdin"), true);
            $query = \Httpful\Request::put($uri)->body($requestBody);
            break;
        case 'POST':
            $requestBody = json_decode(file_get_contents("php://stdin"), true);
            $query = \Httpful\Request::post($uri)->body($requestBody);
            break;
        default:
            fwrite(STDERR, "Unknown request type. See help for possible types.");
            return null;
    }

    // Set authentication
    if ($user != "" && $pass != "") {
        switch ($authMethod) {
            case "digest":
                $query->digestAuth($user, $pass);
                break;
            case "basic":
                $query->basicAuth($user, $pass);
                break;

            default:
                fwrite(STDERR, "Unknown authentication type. See help for possible types.");
                return null;
        }
    }

    $query->contentType("application/json");
    return $query->send();
}

/**
 * @param \Httpful\Response $response
 */
function displayResult($response)
{
    if ($response == null)
        exit(1);

    switch ($response->code) {
        case "200":
        case "201":
        case "202":
            try {
                echo json_encode($response->body, JSON_PRETTY_PRINT);

            } catch (Exception $e) {
                echo $response->body;
            }
            break;
        default:
            try {
                fwrite(STDERR, json_encode($response->body, JSON_PRETTY_PRINT));

            } catch (Exception $e) {
                fwrite(STDERR, $response->body, JSON_PRETTY_PRINT);

            }
            exit(1);
    }

}

/**
 * @param string $name file/program name
 */
function showHelp($name)
{
    echo "\n\nUsage: php -f $name [-- options]\n\n";

    echo "  options:\n";
    echo "    -h, --help                                                   Shows this usage\n";
    echo "\n";

    echo "    Required:\n";
    echo "      -m, --method               (get|delete|put|post)           Method/Type of the Api request\n";
    echo "      -api                       string                          Main api url (Without terminating /)\n";
    echo "\n";

    echo "    Optional:\n";
    echo "      -url, --request-url        string                          Request api url (Without leading /)\n";
    echo "      -u, --user                 string                          User for auth\n";
    echo "      -p, --pass                 string                          Password for auth\n";
    echo "      -auth, --auth-method       (basic|digest)                  Method for auth (default: basic)\n";
}

/************
 * MAIN
 ***********/
$requestType = null;
$api = null;
$requestUrl = "";
$user = "";
$pass = "";
$authMethod = "basic";

$program = array_shift($argv);

if ($argc <= 1) {
    showHelp($program);
    exit(0);
}

while (isset($argv[0])) {
    $currArg = array_shift($argv);
    switch ($currArg) {
        case "-h":
        case "--help":
            showHelp($program);
            exit(0);
        case "-m":
        case "--method":
            $requestType = array_shift($argv);
            break;
        case "-api":
            $api = array_shift($argv);
            break;
        case "-url":
        case "--request-url":
            $requestUrl = array_shift($argv);
            break;
        case "-u":
        case "-user":
            $user = array_shift($argv);
            break;
        case "-p":
        case "--pass":
            $pass = array_shift($argv);
            break;
        case "-auth":
        case "--auth-method":
            $authMethod = array_shift($argv);
            break;
        default:
            fwrite(STDERR, "Unknown option '$currArg'");
            showHelp($program);
            exit(1);
    }
}

if ($api == null) {
    fwrite(STDERR, "No api specified.");
    showHelp($program);
    exit(1);
}

if ($requestType == null) {
    fwrite(STDERR, "No request method specified.");
    showHelp($program);
    exit(1);
}

$response = apiRequest($requestType, $api, $requestUrl, $user, $pass, $authMethod);
displayResult($response);
exit(0);
