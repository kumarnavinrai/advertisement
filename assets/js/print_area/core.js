/*
$(function() {
	
	$('.print').click(function(event) {
		event.preventDefault();
		alert('Hi');
		var container = $(this).attr('rel');
		$('#' + container).printArea();
		return false;
	});
	
});
*/
/*
$(document).ready(function(){
	$(".print").click(function(event){
		event.preventDefault();
		var container = $(this).attr('rel');
		
		alert('Hi');
		var mode = $("input[name='mode']:checked").val();
		var close = mode == "popup" && $("input#closePop").is(":checked");
		var extraCss = $("input[name='extraCss']").val();
		var printBoth = $("#printBoth").is(":checked");

		var keepAttr = [];
		$(".chkAttr").each(function(){
			if ($(this).is(":checked") == false )
				return;

			keepAttr.push( $(this).val() );
		});

		var headElements = $("input#addElements").is(":checked") ? '<meta charset="utf-8" />,<meta http-equiv="X-UA-Compatible" content="IE=edge"/>' : '';

		var options = { mode : mode, popClose : close, extraCss : extraCss, retainAttr : keepAttr, extraHead : headElements };

		//var print = "#"+container+." + ( printBoth ? "both" : "area1" );

		$( print ).printArea( options );
		$('#' + container).printArea( options )
	});

	$("input[name='mode']").click(function(){
		if ( $(this).val() == "iframe" ) $("#closePop").attr( "checked", false );
	});
});
*/
 
$(document).ready(function() {
         /*$(".print").click(function() {
             printElem({});
         });*/
		 /*
         $(".print").click(function() {
             printElem({ printMode: 'popup' });
         });
		 */
         $("#ChangeTitle").click(function() {
             printElem({ pageTitle: 'thisWillBeTheNameInThePrintersLog.html' });
         });
		 /*
         $("#PopupandLeaveopen").click(function() {
             printElem({ leaveOpen: true, printMode: 'popup' });
         });
		 */
		 
		 $(".print").click(function() {
             printElem({ leaveOpen: true, printMode: 'popup' });
         });
         $("#stripCSS").click(function() {
             printElem({ overrideElementCSS: true });
         });
         $("#externalCSS").click(function() {
             printElem({ overrideElementCSS: ['http://assets3.github.com/stylesheets/bundle.css?180c214baeba2d8a1194e7b48ea7581cfee3e505'] });
         });
     });

 function printElem(options){
	 $('.areaToPrint').show();	
     $('.areaToPrint').printElement(options);
	 $('.areaToPrint').hide();
 }

    
  