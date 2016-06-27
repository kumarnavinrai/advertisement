<?php

/**
 * Example of connecting to QuickBooks Online edition via qbXML
 * 
 * IMPORTANT: 
 * 	IF YOU ARE BUILDING A SAAS APPLICATION (E.G. YOU ARE ALLOWING MANY OF YOUR 
 * 	CUSTOMERS TO CONNECT THEIR COMPANY FILES TO YOUR WEB APPLICATION) THEN THIS 
 * 	IS PROBABLY *NOT* THE FILE YOU SHOULD LOOKING AT. You should look at the 
 * 	Intuit Partner Platform (and thus the corresponding docs/example_ipp_*.php 
 * 	scripts) in this package.
 * 
 * 
 * 
 * @author Keith Palmer <keith@ConsoliBYTE.com>
 * 
 * @package QuickBooks
 */

header('Content-Type: text/plain');

require_once dirname(__FILE__) . '/../QuickBooks.php';

// Register in DESKTOP mode to get these. Docs: 
//	http://www.consolibyte.com/docs/index.php/QuickBooks_Online_via_qbXML#Connecting_with_the_.27Desktop.27_model_of_communication
$application_id = '773033855';
$application_login = 'quickbooks_try.codelee.com';
$connection_ticket = 'TGT-32-vXeCnvazejgBlfOuqbkj0A';

// Create our new gateway instance 
$Gateway = new QuickBooks_Gateway_OnlineEdition(
	$application_id,
	$application_login,
	$connection_ticket);

$xml = '<QBXMLMsgsRq onError="stopOnError">
			<VendorAddRq>
				<VendorAdd>
					<Name>Chunu</Name>
					<FirstName>Chunuji</FirstName>	
					<LastName>Rai</LastName>	
					<VendorAddress>
						<Addr1>Kalia Colony</Addr1>	
						<City>Jalandhar</City>	
						<State>PB</State>	
						<PostalCode>144001</PostalCode>
						<Country>India</Country>		
					</VendorAddress>
					<Email>chunu@chunu.com</Email>	
				</VendorAdd>
			</VendorAddRq>
		</QBXMLMsgsRq>';

// Send the request
$resp = $Gateway->qbxml($xml);

print($resp);