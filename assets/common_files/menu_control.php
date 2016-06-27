<?php
class menuControl extends Public_Controller {
	
	function __construct(){
		
	}
	
	function custom_check_menu($group,$menu){ 
		// unread messages count
		$userId = $this->current_user->id;
		$groupId = $this->current_user->group_id;

		
				
	   if($group=='admin'){
	   
	   unset($menu['lang:cp:nav_addons']);
	   unset($menu['lang:cp:nav_structure']);
	   unset($menu['lang:cp:nav_content']);
	   unset($menu['lang:cp:nav_settings']);
	   unset($menu['lang:cp:nav_data']);
	   unset($menu['lang:cp:nav_users']);
			
			$menu['Masters'] = array(
	                'Client Master'           => 'resources/people/addEditPeople/0/'.CLIENT,
			        'Landlord Master'            => 'resources/people/addEditPeople/0/'.LANDLORD,
					'Dealer Master'       => 'resources/people/addEditPeople/0/'.DEALER,
	               	'MC Master' => 'resources/people/addEditPeople/0/'.MC,
					'Station Master'           => 'resources/place/addEditplace',
					'Location Master'            => 'resources/place/addEditplace/0/'.PLACE_TYPE_LOCATION,
					'Labour Master'       => 'resources/people/addEditPeople/0/'.LABOUR,
					'Painter Master'       => 'resources/people/addEditPeople/0/'.PAINTER,
				);
				
			$menu['Lists'] = array(
	                'List of Clients'           => 'resources/people/listClients/',
					'List of Landlords'           => 'resources/people/listLandlords/',
					'List of MCs'       => 'resources/people/listMCS/',
			        'List of Stations'           => 'resources/place/listStations',
			        'List of Dealers'       => 'resources/people/listDealers/',
			        'List of Locations'           => 'resources/place/listLocations',
					'List of Labourers'       => 'resources/people/listLabourers/',
					'List of Painters'       => 'resources/people/listPainters/',
					'List of Hordings'           => 'resources/tenure/listHordingInstall/',
					'List of Rent agreement with landlord'           => 'resources/tenure/listRentTenures/',
					'List of Rent agreement with MC'           => 'resources/tenure/listMCTenures/'
				);
				
				
			$menu['Process'] = array(
	                'Hording Installed'           => 'resources/tenure/addEditTenure/0/'.HORDING_INSTALL_TENURE_AGREEMENT,
			        'Rent agreement with landlord'            => 'resources/tenure/addEditTenure/0/'.RENT_TENURE_AGREEMENT,
					'Rent agreement with MC'            => 'resources/tenure/addEditTenure/0/'.MC_TENURE_AGREEMENT,
					//'Bill'           => 'resources/tenure/listClients/',
					//'Payment in'           => 'resources/tenure/listClients/',
					//'Payment out'           => 'resources/tenure/listClients/',
					//'Tenure renew'           => 'resources/tenure/listHordingInstall/',
					//'Tenure finished'           => 'resources/tenure/tenureFinished/',
					'Tenure cancel'           => 'resources/tenure/tenureCancel/',
					'Payment in'           => 'resources/tenure/paymentIn/',
					'Payment out'           => 'resources/tenure/paymentOut/',
			        //'Installments'       => 'resources/tenure/addEditPeople/0/'.PAINTER
					
				);	
			
			$menu['Reports'] = array(
	                'CITY WISE NOS. OF SITE  & DETAIL'           => 'resources/reports/listcityWiseNoOfSiteDetails/',
			        'CITY WISE LANDLORD DETAILS'           => 'resources/reports/listcityWiseLandlordDetails/',
			        'RENT DUE FOR LAND LORD WITHIN PERIOD'            => 'resources/reports/listrentDueForLandLords/',
			        'RENT DUE FROM CLIENTS WITHIN PERIOD'           => 'resources/reports/listRentDueFromClientsWithinPeriod/',
			        'FEE DUE FOR MUNC. CORP. OTHER WITH PERIOD'       => 'resources/reports/listFeeDueForMuncCorpOtherWithPeriod/',
					'LIST OF VACANT SITE WITH DETAILS & PHOTO'       => 'resources/reports/listOfVacantSites/'
					
				);		
	
			
			add_admin_menu_place('Masters', 1);
			add_admin_menu_place('Lists', 2);
			
			
						    
	    }
	   
			
	return $menu;	
	}
}
?>