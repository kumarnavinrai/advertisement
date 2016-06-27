<?php
// Plain text output
header('Content-Type: text/plain');

// Error reporting
ini_set('display_errors', 1);
error_reporting(E_ALL | E_STRICT);

// Require the QuickBooks libraries
require_once '../QuickBooks.php';

$application_id = '773033855';
$application_login = 'quickbooks_try.codelee.com';
$connection_ticket = 'TGT-32-vXeCnvazejgBlfOuqbkj0A';

// Create our new gateway instance 
$Gateway = new QuickBooks_Gateway_OnlineEdition(
	$application_id,
	$application_login,
	$connection_ticket);
	

// Create a new Customer object
$Customer = new QuickBooks_QBXML_Object_Customer();

// Set some fields
$Customer->setFirstName("Sunil");
$Customer->setLastName("Kumar");
$Customer->setName("SUNIL KUMAR");
$Customer->setEmail("sunil@kumar.com");
$Customer->setCompanyName("Codelee");
$Customer->setTermsListID('2');
$Customer->setBillAddress('Jalandhar', '', '', '', '', 'PUNJAB', 'PUNJAB', '', '76244');
$Customer->setDeliveryMethod(1);
$Customer->setNotes('Test notes go here.');


$xml = '<QBXMLMsgsRq onError="stopOnError">';
$xml .= $Customer->asQBXML(QUICKBOOKS_ADD_CUSTOMER);
$xml .= '</QBXMLMsgsRq>';


// Send the request
$resp = $Gateway->qbxml($xml);

print($resp);
?>