/* country state */

/*

$(function(){

	$('.c_country').change(function(){
		var countryId = $(this).val();
		
		
		$.ajax({
				url: SITE_URL+'resources/people/getStates/'+countryId,
				success: function(res){
					if(res){
						
						$('.c_states').html(res);
						
					}
				},
				async: false,
				dataType: 'html'
		});
		
		$.ajax({
				url: SITE_URL+'resources/people/getStatesJs/'+countryId,
				success: function(res){
					if(res){
						alert(res);
						
						var elem = $(".c_states").closest('.input');
						
						elem.children('.chzn-container').children('.chzn-drop').children('.chzn-results').html(res);
						elem.children('.chzn-container').children('.chzn-single span').html($('.c_states').val());
						alert($('.c_states').val());
						
					}
				},
				async: false,
				dataType: 'html'
		});
		
	});
});
*/

$(function(){
	$('.c_change_between_client_or_dealer').click(function(){
		$('.c_dealer').toggle();
		$('.c_client').toggle();
		
		if($('.c_client').attr('style') == 'display: none;'){
			$('.c_dealer_or_client').val('DEALER');
		}
		
		if($('.c_dealer').attr('style') == 'display: none;'){
			$('.c_dealer_or_client').val('CLIENT');
		}
		//c_dealer_or_client
	});
	
	$('.c_installment_yes_no').change(function(){
		
		if($('.c_installment_yes_no').val() == 1){
			$('.c_installments').show();
		}
		
		if($('.c_installment_yes_no').val() == 0){
			$('.c_installments').hide();
		}
	});
	
});

$(document).ready(function() {
 $('.datepicker').datepicker({dateFormat: 'dd-mm-yy'});
 

 $('.c_amount_paid_date_datepicker').datepicker({
	dateFormat: 'dd-mm-yy',
	maxDate: new Date 
	});
 
 $('.c_amount_paid_date_datepicker').attr('readonly', 'readonly');
 
 $('.datepicker').attr('readonly', 'readonly');
 
 $( "#start_date_datepicker_id" ).attr('readonly', 'readonly');
 
 $( "#end_date_datepicker_id" ).attr('readonly', 'readonly');
 
});

$(function() {
		$( "#start_date_datepicker_id" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			dateFormat: 'dd-mm-yy',
			numberOfMonths: 4,
			onClose: function( selectedDate ) {
				$( "#end_date_datepicker_id" ).datepicker( "option", "minDate", selectedDate );
			}
		});
		
		$( "#end_date_datepicker_id" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			dateFormat: 'dd-mm-yy',
			numberOfMonths: 4,
			onClose: function( selectedDate ) {
				$( "#start_date_datepicker_id" ).datepicker( "option", "maxDate", selectedDate );
				$( "#amount_due_date_id" ).datepicker( "option", "maxDate", selectedDate );
				
			}
		});
});

$(window).load(function(){
	$('.c_dealer').attr('style','display:none');
	$('.c_dealer_or_client').val('CLIENT');
	$('.c_installments').attr('style','display:none');
	
	if($('.c_installment_yes_no').val() == 1){
			$('.c_installments').show();
	}
		
	if($('.c_installment_yes_no').val() == 0){
		$('.c_installments').hide();
	}
	
	//alert('Hi');
	var elem = $(".top-link menu");
	
	//alert(elem.html());
	
	
});

$(function(){
	
	$('.c_amount_decided').live('keydown',function(event){
      
			if( !(event.keyCode == 8                                /* backspace */
				|| event.keyCode == 46                              /* delete */
				|| (event.keyCode >= 35 && event.keyCode <= 40)     /* arrow keys/home/end */
				|| (event.keyCode >= 48 && event.keyCode <= 57)     /* numbers on keyboard */
				|| (event.keyCode >= 96 && event.keyCode <= 105))   /* number on keypad */
				) {
					event.preventDefault();     /* Prevent character input */
			}
			
	});
	
	$('.c_amount_paid').live('keydown',function(event){
	
			if( !(event.keyCode == 8                                /* backspace */
				|| event.keyCode == 46                              /* delete */
				|| (event.keyCode >= 35 && event.keyCode <= 40)     /* arrow keys/home/end */
				|| (event.keyCode >= 48 && event.keyCode <= 57)     /* numbers on keyboard */
				|| (event.keyCode >= 96 && event.keyCode <= 105))   /* number on keypad */
				) {
					event.preventDefault();     /* Prevent character input */
			}
			
	});
	
	$('.c_amount_due').live('keydown',function(event){
	
			if( !(event.keyCode == 8                                /* backspace */
				|| event.keyCode == 46                              /* delete */
				|| (event.keyCode >= 35 && event.keyCode <= 40)     /* arrow keys/home/end */
				|| (event.keyCode >= 48 && event.keyCode <= 57)     /* numbers on keyboard */
				|| (event.keyCode >= 96 && event.keyCode <= 105))   /* number on keypad */
				) {
					event.preventDefault();     /* Prevent character input */
			}
			
	});
	
	$('.c_amount_clac').live('click',function(event){
		amountCalculation();
	});
	
});

	function amountCalculation(){
		
		var amountDecided = $('.c_amount_decided').val();
				
		var amountPaid = $('.c_amount_paid').val();
		
		var numberOfAmtDue = $(".c_amount_due").length;
		
		var amountDue = 0;
		
		amountDue = amountDecided - amountPaid;
		
		var counter = 1;
		
		if(amountDue != 0){ 
			$(".c_amount_due").each(function() {
				
				if($( this ).val() != '' && counter != numberOfAmtDue){		
					 amountDue = amountDue - $( this ).val();
					
				}	 
				
				if(amountDue < 0){
					$( this ).val('');
					$('.amount_due_message').show();
					return false;
				}
				
				if($( this ).val() == '' ){
					$( this ).val(amountDue);
					return false;
				}	
				
				
				
				
				if( counter == numberOfAmtDue){
					$( this ).val(amountDue);
					return false;
				}	
					
			counter++;	
			});
		}	

	}
	

$(window).load(function(){ 
	$('.c_get_tenure_installments').on('change',function(event){
		event.preventDefault();
		var eventGenerator = $(this);
		var tenureId = eventGenerator.val(); 
		getInstallmentsForTenure(tenureId);
		
	});
	
	$('.c_get_tenure_installments').each(function(){
		
		if($('.c_tenure_type').val() == RENT_TENURE_AGREEMENT && $(this).hasClass('c_temp_disabled_rent')){
			var loadInstallmentsOnload = $('.c_temp_disabled_rent').val();
		}else if($('.c_tenure_type').val() == MC_TENURE_AGREEMENT && $(this).hasClass('c_temp_disabled_mc')){
			var loadInstallmentsOnload = $('.c_temp_disabled_mc').val();
		}else{
			var loadInstallmentsOnload = $(this).val();
		}	
	
		if(loadInstallmentsOnload != 0){
			getInstallmentsForTenure(loadInstallmentsOnload);
		}
	});	
	
});	


function getInstallmentsForTenure(tenureId){
		var urlToFire = SITE_URL+'resources/tenure/getInstallmentsForTenureAgreement/'+tenureId+'/'+$('.c_tenure_type').val()+'/'+$('.c_payment_type').val();
		$.ajax({
				url: urlToFire,
				success: function(data){  
					if(data){ 
						populateDataOfinstallmentsAndPaymentsInDome(data);
					}else{ 
						$('.c_installments_details').remove();
						$('.c_total_amount').remove(); 
						$('.c_paid_amount').remove();
						$('.c_balance_amount').remove();
					}
				},
				async: false,
				dataType: 'json'
		});
		

}	

function populateDataOfinstallmentsAndPaymentsInDome(data){
	$('.c_installment_amount').html('');
	$('.c_installment_date').html('');
	var z = 1;
	var y = 1;
	var paymentPrinted = [];
	var totalAmount = 0;
	var paidamount = 0;
	var balanceAmount = 0;
	
	$.each(data.installments, function(i, item){
		
		$.each(data.payments, function(p, itemp){	
			var paymentdate = Date.parse(itemp.payment_amount_date.substring(0,10));
			var installmentdate = Date.parse(item.pay_date);
			
			if(paymentdate <= installmentdate){
				 if($.inArray( p, paymentPrinted ) == -1){ 
					 paymentPrinted.push(p);
					 if($('.c_payment_type').val()== PAYMENT_IN){
						$('.c_installment_date').append('<span class="c_payment_details"><b>Payment ('+y+') On date '+itemp.payment_amount_date+' '+'paid amount is : Rs '+itemp.payment_amount+' </b><a href="'+SITE_URL+'resources/tenure/paymentIn/'+itemp.payment_id+'">Edit</a><br/><hr></span>');
					}else 	if($('.c_payment_type').val()== PAYMENT_OUT){
						$('.c_installment_date').append('<span class="c_payment_details"><b>Payment ('+y+') On date '+itemp.payment_amount_date+' '+'paid amount is : Rs '+itemp.payment_amount+' </b><a href="'+SITE_URL+'resources/tenure/paymentOut/'+itemp.payment_id+'">Edit</a><br/><hr></span>');
					}
					y++;
				}	
			}
		});
		totalAmount = totalAmount + parseInt(data.installments[i].amount);
		$('.c_installment_date').append('<span class="c_installments_details">Installment ('+z+') On date '+data.installments[i].pay_date+' '+'pending amount is : Rs '+data.installments[i].amount+' <br/><hr></span>');
	z++;
	});
	
	$.each(data.payments, function(p, itemp){	
			paidamount = paidamount + parseInt(itemp.payment_amount);
			if($.inArray( p, paymentPrinted ) == -1){ 
				$('.c_installment_date').append('<span class="c_payment_details"><b>Payment ('+y+') On date '+itemp.payment_amount_date+' '+'paid amount is : Rs '+itemp.payment_amount+' </b><a href="'+SITE_URL+'resources/tenure/paymentIn/'+itemp.payment_id+'">Edit</a><br/><hr></span>');
				y++; 
			}
			
			/*$('.c_installment_amount').append('pending amount is : '+data[i].amount+' <br/><hr>');*/
	
		});
		
		balanceAmount = (parseInt(totalAmount)==0?paidamount:parseInt(totalAmount)) - parseInt(paidamount);
		
		totalAmount!=0?$('.c_installment_date').append('<span class="c_total_amount"><b>Total Amount : '+totalAmount+' </b><br/><hr></span>'):true;	
		
		
		if(paidamount == 0){
			/* here updating amount in this consider function */
			getPaidAmountfromAgreement(totalAmount); 
			
		}else{
			$('.c_installment_date').append('<span class="c_paid_amount"><b>Paid Amount : '+paidamount+' </b><br/><hr></span>');
			$('.c_installment_date').append('<span class="c_balance_amount"><b>Balance Amount : '+balanceAmount+'  </b><br/><hr></span>');
		}	
		
		

}

function getPaidAmountfromAgreement(totalAmount){
	
	$('.c_get_tenure_installments').val();
	var tenureId = 0;
	 
	$('.c_get_tenure_installments').each(function(){ 
		if($(this).parent().is(":visible")){ 
			tenureId = $(this).val(); 
			$.getJSON( SITE_URL+"resources/tenure/getPaidAmountfromAgreement/"+tenureId+"/"+$('.c_tenure_type').val(), function( data ) {
				
				var balanceAmount =  (parseInt(totalAmount)==0?data.amount_paid:parseInt(totalAmount)) - parseInt(data.amount_paid);
				totalAmount==0?$('.c_installment_date').append('<span class="c_total_amount"><b>Total Amount : '+data.amount_paid+' </b><br/><hr></span>'):true;
					$('.c_installment_date').append('<span class="c_paid_amount"><b>Paid Amount : '+data.amount_paid+' </b><br/><hr></span>');
					$('.c_installment_date').append('<span class="c_balance_amount"><b>Balance Amount : '+balanceAmount+'  </b><br/><hr></span>');
			});	
		}
	});
}


/* payment out */
$(window).load(function(){
	$('.c_tenure_type').trigger('change');
	$('.c_tenure_type').on('change',function(){	
		if($( ".c_tenure_type option:selected" ).val() ==  RENT_TENURE_AGREEMENT){
			$('.c_rent_agreements').show(); 
			$('.c_mc_agreements').hide();
			$('.c_mc_agreements').attr('disabled','disabled');
			$('.c_rent_agreements').removeAttr('disabled');
		}else if($( ".c_tenure_type option:selected" ).val() == MC_TENURE_AGREEMENT){
			$('.c_mc_agreements').show(); 
			$('.c_rent_agreements').hide();
			$('.c_rent_agreements').attr('disabled','disabled');	
			$('.c_mc_agreements').removeAttr('disabled');
		}
	});
});