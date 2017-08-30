# ApiCaller

PHP-Datei zum Aufrufen von Rest-APIs.
    
### Usage:

        Usage: php -f apiCaller.php [-- options]
        
          options:
            -h, --help                                                   Shows this usage
        
            Required:
              -m, --method               (get|delete|put|post)           Method/Type of the Api request
              -api                       string                          Main api url (Without terminating /)
        
            Optional:
              -url, --request-url        string                          Request api url (Without leading /)
              -u, --user                 string                          User for auth
              -p, --pass                 string                          Password for auth
              -auth, --auth-method       (basic|digest)                  Method for auth (default: basic)
              
 
Bei den Request-Typen _post_ und _put_ kann der Request-Body gesetzt werden. Übergeben wird dieser über STDIN in JSON-Notation:

    # Pipe-Operator
    call example.json | php -f apiCaller.php -- -m 'post' -api 'https://example.com/api' -url 'product' -u 'user' -p 'pasword' -auth 'basic'
    
    # or
    php -f apiCaller.php -- -m 'post' -api 'https://example.com/api' -url 'product' -u 'user' -p 'pasword' -auth 'basic' < example.json
