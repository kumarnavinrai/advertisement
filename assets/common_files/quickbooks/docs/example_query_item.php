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
	
$xml = '<QBXMLMsgsRq onError="stopOnError">';
$xml .= '<ItemQueryRq requestID="SXRlbVF1ZXJ5fDEyMA==" >
			<FullName>Service lead</FullName>
		</ItemQueryRq>';
$xml .= '</QBXMLMsgsRq>';
		
	
	
	

// Send the request
$resp = $Gateway->qbxml($xml);

$output = json_decode(json_encode((array)simplexml_load_string($resp)),1);

print_r($output);
exit;
?>