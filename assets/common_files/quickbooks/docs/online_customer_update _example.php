<?php

    ini_set('include_path', ini_get('include_path') . PATH_SEPARATOR . '/Users/servers/root/quickbooks');
    error_reporting(E_ALL | E_STRICT);
    require_once '../QuickBooks.php';
    
    //unimportant password and username, just used to keep track of things
    $username = 'user';
    $password = 'pass';
    $source_type = QuickBooks_API::SOURCE_ONLINE_EDITION;
    $api_driver_dsn = null;
    $source_dsn = null;
    // Various API options
    $api_options = array();
    // Options for QBOE
    $source_options = array(
    //    connection_ticket - QuickBooks Online Edition does an HTTP POST to your callback URL to send you this
    //    application_login - Provided by the application registration page
    //    application_id - Provided by the application registration page     
    'connection_ticket' => 'TGT-47-1sRm2nXMVfm$n8hb2MZfVQ', 
    'application_login' => 'test.www.academickeys.com', 
    'application_id' => '134476472', 
    );
    // Driver options
    $driver_options = array();
    // Create the API instance
    $API = new QuickBooks_API($api_driver_dsn, $username, $source_type, $source_dsn, $api_options, $source_options, $driver_options);
    //debug mode prints out all of the qbXML used to process requests
    $API->useDebugMode(true);
    //for use with QBOE only
    $API->enableRealtime(true);
    
    /****************************
    END QUICKBOOKS CONNECTION CONFIGURATION
    ****************************/

    //UPDATING CUSTOMERS
 
 
 $clients = array(
     array(
         'Client' => array(
             'qb_name' => 'Keith Palmer Jr.', 
             'company_name' => 'My Test Company, LLC',
             'first_name' => 'Shannon',  
             'bill1' => 'test', 
             'bill2' => 'test', 
             'bill3' => 'test', 
             'bill4' => 'test', 
             'bill5' => 'test', 
             'ship1' => 'test', 
             'ship2' => 'test', 
             'ship3' => 'test', 
             'ship4' => 'test', 
             'ship5' => 'test', 
             'RelationshipManager' => 'RB', 
             'phone' => '860-634-1602', 
             'alt_phone' => '203-687-5504', 
             'contact' => 'Test Contact', 
             'alt_contact' => 'Alt Contact', 
             'fax' => '203-123-1235', 
             'last_name' => 'Palmer', 
             'middle_initial' => 'B', 
         ), 
     ), 
 );
    
    if(!empty($clients)) foreach($clients as $client) {
    
        if ($cust = $API->getCustomerByName( $client['Client']['qb_name'] )) {

        // This line shouldn't be used- if the customer doesn't exist, you can't modify them
        //if( ! $cust ) $cust = new QuickBooks_Object_Customer;
        
        $cust->setBillAddress( $client['Client']['bill1'], $client['Client']['bill2'], $client['Client']['bill3'], $client['Client']['bill4'], $client['Client']['bill5'] );
        $cust->setShipAddress( $client['Client']['ship1'], $client['Client']['ship2'], $client['Client']['ship3'], $client['Client']['ship4'], $client['Client']['ship5'] );
        $cust->setSalesRepName($client['RelationshipManager']);
        $cust->setPhone( $client['Client']['phone'] );
        $cust->setAltPhone( $client['Client']['alt_phone'] );
        $cust->setContact( $client['Client']['contact'] );
        $cust->setAltContact($client['Client']['alt_contact'] );
        $cust->setFax( $client['Client']['fax'] );
        $cust->setNotes( $client['Client']['notes'] );
        //$cust->setSalutation( $client['Client']['saluation'] ); //not working
        $cust->setCompanyName( $client['Client']['company_name'] );
        $cust->setFirstName( $client['Client']['first_name'] );
        $cust->setLastName( $client['Client']['last_name'] );
        $cust->setMiddleName( $client['Client']['middle_initial'] );

      
        if( $API->modifyCustomer( $cust ) )
            print("Customer updated in QuickBooks");
        else
            print("Could not add customer");
            
    }
}
    