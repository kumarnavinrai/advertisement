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
	

$xml = '<CustomerModRq>
		  <CustomerMod>
			<ListID>27</ListID>
				<Name>Kittu</Name>                                
				<CompanyName>Oxford</CompanyName> 
				<FirstName>Kittu</FirstName>       
				<MiddleName>k</MiddleName>
				<LastName>Kaler</LastName>   
				<Suffix>Mr</Suffix>                          
				<BillAddress>                                       
				  <Addr1>kohinoor enclave</Addr1> 
				  <City>jalandhar</City>   
				  <State>punjab</State> 
				  <PostalCode>144001</PostalCode>
				  <Country>india</Country>  
				</BillAddress>
				<PrintAs>KITTU K KALER</PrintAs>  
			<Phone>9876282405</Phone> 
			<Mobile>1234567899</Mobile>
			<Email>kittu.k@kaler.com</Email>                              
			<Contact>987987987</Contact>                          
			<CreditCardInfo>                                  
			  <CreditCardNumber>1221244587455487</CreditCardNumber>    
			  <ExpirationMonth>02</ExpirationMonth>      
			  <ExpirationYear>15</ExpirationYear>        
			  <NameOnCard>kittu k kaler</NameOnCard>                
			  <CreditCardAddress>kohinoor enclave</CreditCardAddress>  
			  <CreditCardPostalCode>144001</CreditCardPostalCode> 
			</CreditCardInfo>
		  </CustomerMod>
		</CustomerModRq>';
    
	
	
	

// Send the request
$resp = $Gateway->qbxml($xml);

$output = json_decode(json_encode((array)simplexml_load_string($resp)),1);

print_r($output);
exit;

//echo $xmlResp->CustomerAddRs->CustomerRet['ListID'];
//echo $xmlResp->bbb->cccc->eeee['name'];
$listid =  $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['ListID'];
$name =  $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['Name'];
$full_name =  $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['FullName'];
$company_name =  $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['CompanyName'];
$address =  $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['BillAddress']['Addr1'].' '.$output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['BillAddress']['City'].' '.$output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['BillAddress']['State'].' '.$output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['BillAddress']['PostalCode'];

$email =  $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['Email'];
$balance =  $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['Balance'];
$total_balance = $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['TotalBalance'];
$postal_code = $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['BillAddress']['PostalCode'];
$time_created = $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['TimeCreated'];
$time_modified = $output['QBXMLMsgsRs']['CustomerAddRs']['CustomerRet']['TimeModified'];


$db=mysql_connect("localhost","root","");

if (!$db) 
{
 die('Could not connect: ' . mysql_error());
}



mysql_select_db("quickbooks",$db);

$sql = "insert into customer (list_id, name, full_name, company_name, address, email, balance, total_balance, postal_code, time_created, time_modified) values(".$listid.", '".$name."', '".$full_name."', '".$company_name."', '".$address."', '".$email."', ".$balance.", ".$total_balance.", ".$postal_code.", '".$time_created."', '".$time_modified."')";
		
var_dump(mysql_query($sql));
			
			
//print_r($output);
//print($resp);
?>