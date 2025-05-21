/*
==============================================================================================================================
==================JQUERY UPDATE UTILITY CODE | Author: David (https://github.com/david-matu )=================================
==============================================================================================================================

*/
$(document).ready(function(){
	$('.btn-delete').on('click', function(ev){
  	  ev.preventDefault();
  	  var targetURL = $(this).attr('href');
  	  var fname = $(this).attr('data-filename');
  	  var entityID = $(this).attr('data-eid');
  	  var actionTaken = confirm("Are you sure you want to permanently delete\n" + fname  + "?\nClick 'Ok' to proceed with this action.");
  	  
  	  if (actionTaken == true) {
  		  $.post(targetURL, 
  	    			{
  	    		  	eid: entityID    				
  	    			  },
  	    			  function(data){
  	    		  		if(data === 'DEL_OKAY'){
  	    		  			var parentDOM = "#parent-" + entityID;
  	    		  			$(""+parentDOM).remove();
  	    		  			//alert('File Deleted on Server.');
  	    		  		} else {
  	    		  			alert('Error, could not delete! Please retry.');
  	    		  		}
  	    	  });  
  	  } else {
  	  }
	});

//For updating entities
	$('.update-entity-form').on('submit', function(ev){
		ev.preventDefault();
		
		var vals = $(this).serialize();
		
		console.log(JSON.stringify(vals));
		
		var formID = $(this).attr('id');
		
		var targetURL = $('#' + formID).attr('action');
		
		var executeOnce = $.post(targetURL, vals,
				  function(data){
			  		if(data === 'UPDATE_OKAY'){
			  			var parentDOM = "#modal-" + formID;
			  			$(""+parentDOM).modal('hide');
			  			//alert('File Deleted on Server.');
			  			location.reload(true);
			  		} else {
			  			alert('Error, could update! Please retry.');
			  		}
		  });
		
	});
});
