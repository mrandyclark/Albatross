// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var Scorecard = {};

Scorecard.init = function() {
	$("input[type=checkbox][name=player]").click(function() {
    	var bol = $("input[type=checkbox][name=player]:checked").length >= 4;
    	
    	if(bol)
    	{
	    	$("input[type=checkbox][name=player]").not(":checked").checkboxradio('disable');
	    } else {
	    	$("input[type=checkbox][name=player]").not(":checked").checkboxradio('enable');
	    }
	});
};	