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
    	$list = array (
		    array("test")
		);

		$fp = fopen('files/export/orders/export.csv', 'a');
		foreach ($list as $fields) {
		    fputcsv($fp, $fields, ";", '"');
		}
		fclose($fp);

		return 'Yes its running!';
	}

    public function ftp() {
    	// Variablen definieren
		$local_file = 'test123.csv';
		$server_file = 'test.csv';

		// Verbindung aufbauen
		$conn_id = ftp_connect("localhost");

		// Login mit Benutzername und Passwort
		$login_result = ftp_login($conn_id, "PM", "pm");

		// Versuche $server_file herunterzuladen und in $local_file zu speichern
		if (ftp_get($conn_id, $local_file, $server_file, FTP_BINARY)) {
		    echo "$local_file wurde erfolgreich geschrieben\n";
		} else {
		    echo "Ein Fehler ist aufgetreten\n";
		}

		// Verbindung schließen
		ftp_close($conn_id);
    }
}