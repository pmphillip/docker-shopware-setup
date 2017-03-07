<?php
namespace PmOrderExport;

 class PmOrderExport extends \Shopware\Components\Plugin
 {
 	public static function getSubscribedEvents()
    {
        return [
            'Shopware_Modules_Order_SaveOrder_ProcessDetails' => 'onOrderFinished'
        ];
    }

    public function onOrderFinished(\Enlight_Event_EventArgs $args)
    {
		foreach($args->getDetails() as $order) {
			$id = $order["id"];
			$userID = $order["userID"];
			$articlename = $order["articlename"];
			$articleID = $order["articleID"];
			$ordernumber = $order["ordernumber"];
			$quantity = $order["quantity"];
			$price = $order["price"];
			$datum = $order["datum"];
			$additionalDetails = $order["additional_details"];
			$description = $additionalDetails["description"];
			$isAvailable = $additionalDetails["isAvailable"];
			$link = $order["linkDetails"];
			$orderNumber = $args->getSubject()->sOrderNumber;

			$list = array (
			    array($id, $userID, $articlename, $articleID, $ordernumber, $quantity, $price, $datum, $description, $isAvailable, $link, $orderNumber)
			);

			$fp = fopen('files/export/orders/export.csv', 'a');
			foreach ($list as $fields) {
			    fputcsv($fp, $fields, ";", '"');
			}
			fclose($fp);
		}
    }
 }