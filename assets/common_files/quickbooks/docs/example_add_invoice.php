<?php
// 
header('Content-Type: text/plain');

// error reporting
ini_set('display_errors', 1);
error_reporting(E_ALL | E_STRICT);

// QuickBooks framework classes
require_once '../QuickBooks.php';


$application_id = '773033855';
$application_login = 'quickbooks_try.codelee.com';
$connection_ticket = 'TGT-32-vXeCnvazejgBlfOuqbkj0A';

// Create our new gateway instance 
$Gateway = new QuickBooks_Gateway_OnlineEdition(
	$application_id,
	$application_login,
	$connection_ticket);
	
	

$ListID_from_QuickBooks = 26;

// Create the new invoice object
$Invoice = new QuickBooks_QBXML_Object_Invoice();

$Invoice->setCustomerName('KITTU DEEP');

//$Invoice->setCustomerListID($ListID_from_QuickBooks);

$Invoice->setRefNumber('A-123');

//set date for invoice
$Invoice->setTxnDate('2013-12-14');

// Set some other fields... 
$Invoice->setMemo('This invoice was created using the QuickBooks PHP API!');

// 3 items of type "Item Type 1" at $10.00 per item
$InvoiceLine1 = new QuickBooks_QBXML_Object_Invoice_InvoiceLine();
$InvoiceLine1->setItemName('voip 1');
//$InvoiceLine1->setRate(10.00);
$InvoiceLine1->setQuantity(13);

// 5 items of type "Item Type 2", for a total amount of $225.00 ($45.00 each)
$InvoiceLine2 = new QuickBooks_QBXML_Object_Invoice_InvoiceLine();
$InvoiceLine2->setItemName('voip 2');
//$InvoiceLine2->setAmount(225.00);
$InvoiceLine2->setQuantity(15);

// Make sure you add those invoice lines on to the invoice
$Invoice->addInvoiceLine($InvoiceLine1);
$Invoice->addInvoiceLine($InvoiceLine2);

$qbxml = $Invoice->asQBXML(QUICKBOOKS_ADD_INVOICE);
print($qbxml);

$xml = '<QBXMLMsgsRq onError="stopOnError">';
$xml .= $Invoice->asQBXML(QUICKBOOKS_ADD_INVOICE);
$xml .= '</QBXMLMsgsRq>';

// Send the request
$resp = $Gateway->qbxml($xml);

print_r($resp);
exit;

?>