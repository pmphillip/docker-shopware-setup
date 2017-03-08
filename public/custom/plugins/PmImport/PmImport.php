<?php
namespace PmImport;

use Shopware\Components\Plugin;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UninstallContext;

class PmImport extends Plugin {

    public static function getSubscribedEvents()
    {
        return [
            'Shopware_CronJob_ImportFTPDataAction' => 'ImportFTPDataAction'
        ];
    }

    public function install(InstallContext $context)
    {
    }

    public function uninstall(UninstallContext $context)
    {
        $this->removeCron();
    }

    public function removeCron()
    {
        $this->container->get('dbal_connection')->executeQuery('DELETE FROM s_crontab WHERE `name` = ?', [
            'PmImportCron'
        ]);
    }

    public function ImportFTPDataAction(\Shopware_Components_Cron_CronJob $job)
	{
	    //download csv and import the articles
        $local_file = 'files/import_cron/ImportArticleTest.shopware.csv';
        $server_file = 'ImportArticleTest.shopware.csv';
        $host = "192.168.178.26";
        $port = "8080";

        $conn_id = ftp_connect($host);
        //set the env with 'ftp_password=pw' and 'export ftp_password' in the docker machine
        $login_result = ftp_login($conn_id, "Florian", getenv("ftp_password"));
        if ($login_result) {
            echo "login success\n";
            //passive mode
            ftp_pasv($conn_id, true);
            ftp_chdir($conn_id, "home");
            ftp_chdir($conn_id, "shopware");

            if (ftp_get($conn_id, $local_file, $server_file, FTP_BINARY)) {
                echo "$local_file saved\n";
                $response = file_get_contents("http://$host:$port/backend/SwagImportExportCron/cron");

            }
            else {
                $response = "error saving file!";
            }
        }
        else {
            $response = "login failed!";
        }


        echo $response."\n";
        ftp_close($conn_id);
		return $response;
	}
}