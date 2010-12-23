$('document').ready(function() {

	// Subtitle fix
	
		var subtitle = $('#content > h2');
		$('#header').append(subtitle);
		$('#content > h2').remove();

	// Fix IE z-index

		var zIndexNumber = 1000;
		$('div').each(function() {
			$(this).css('zIndex', zIndexNumber);
			zIndexNumber -= 10;
		});

	// Datepicker
	
		$('.datepicker').datepicker({showAnim: 'fadeIn'});
		$('.datepicker').after('<img class="datepickericon" src="images/icons/calendar.png" alt="calendar" />');
		
	// WYSIWYG
	
		$('.wysiwyg').wysiwyg();
		
	// Custom <select>
	
		$('select').wrap('<div class="my-skinnable-select" />');
	
		$(document).ready(function() {
    		$('.my-skinnable-select').each(function(i) {
        		selectContainer = $(this);
        	    selectContainer.removeClass('my-skinnable-select');
		        selectContainer.addClass('skinned-select');
		        selectContainer.children().before('<div class="select-text">a</div>').each(function() {
            		$(this).prev().text(this.options[0].innerHTML);
          		});
        	
	        	var parentTextObj = selectContainer.children().prev();
	    	    selectContainer.children().click(function() {
		        	parentTextObj.text(this.options[this.selectedIndex].innerHTML);
				})
			});
  		});
  		
  	// Text inside textfield
	
		$('input[type="text"], input[type="password"]').each(function() {
			var value = $(this).parent().children('label').html();
			$(this).attr("placeholder", value);
		});

	// Modal mailbox
	
		jQuery.fn.fadeToggle = function(speed, easing, callback) { // Custom fade toggle function
   			return this.animate({opacity: 'toggle'}, speed, easing, callback); 
		}; 
	
		$('a[rel="modal"]').click(function() { // Click a rel="modal"
			$('.modalbox').fadeToggle(200); // Fade toggle modal mailbox
			$('#overlay').toggle(); // Show overlay over entire screen
			return false;
		});
		
		$('body').append('<div id="overlay" />'); // Add overlay to DOM
	
		$('#overlay').click(function() { // When the overlay is clicked the mailbox will disappear
			$('.modalbox').fadeToggle(200, function() {
				$('#overlay').hide();
			});
		});
		
	// Charts
		
		$('.bargraph').visualize({ // Create awesome charts!
			type: 'bar',
			height: '200px',
			colors: ['#005ba8','#1175c9','#92d5ea','#ee8310','#8d10ee','#5a3b16','#26a4ed','#f45a90','#e9e744'],
			appendTitle: false
		});
		
		$('.linegraph').visualize({ // Create awesome charts!
			type: 'line',
			height: '200px',
			lineWeight: 2,
			colors: ['#005ba8','#1175c9','#92d5ea','#ee8310','#8d10ee','#5a3b16','#26a4ed','#f45a90','#e9e744'],
			appendTitle: false
		});
		
		$('.areagraph').visualize({ // Create awesome charts!
			type: 'area',
			height: '200px',
			lineWeight: 1,
			colors: ['#005ba8','#1175c9','#92d5ea','#ee8310','#8d10ee','#5a3b16','#26a4ed','#f45a90','#e9e744'],
			appendTitle: false
		});
		
		$('.linegraph').hide(); // Hide original table
		$('.bargraph').hide();
		$('.areagraph').hide();

	// Navigation tabs with smooth transitions:
	
		$('#main-nav > li > ul').hide(); // Hide all subnavigation
		$('#main-nav > li > a.current').parent().children("ul").show(); // Show current subnavigation	
			
		$('#main-nav > li > a').click( // Click!
			function() {
				$(this).parent().siblings().children("a").removeClass('current'); // Remove .current class from all tabs
				$(this).addClass('current'); // Add class .current
				$(this).parent().siblings().children("ul").fadeOut(150); // Hide all subnavigation
				$(this).parent().children("ul").fadeIn(150); // Show current subnavigation
				return false;
			}
		);
	
	// Content tabs:
		
		$('.content-box-header ul li:first-child a').addClass('current'); // Add .current to the first class
		$('.content-box .tab-content').hide(); // Hide all .tab-content divs
		$('.content-box .tab-content:first-child').show(); // Show default tabs
	
		$('.content-box-header ul li a').click(function() {
			$(this).parent().siblings().find("a").removeClass('current'); // Remove .current from all tabs
			$(this).addClass('current'); // Set tab to current
			var tabcontent = $(this).attr('href'); // Get link to requested tab
			$(tabcontent).siblings().hide(); // Hide all other .tab-content divs
			$(tabcontent).show(); // Show content div
			return false;
		});
		
	// Alternating table rows
	
		$('tbody tr').removeClass("alt-row"); // Remove all .alt-row classes
		$('tbody tr:even').addClass("alt-row"); // Add .alt-row to even table rows
		
	// Check-all
	
		$('thead th input[type="checkbox"]').click(function() { // Click a checkbox that's in the <thead>
			$(this).parent().parent().parent().parent().find("input[type='checkbox']").attr('checked', $(this).is(':checked')); // Find all checkboxes and check them if needed
		});
		
	// Tooltip-confirmation
	
		$('.confirmation').wrap('<div class="confirm" />');
	
		$('.confirm > a').click(function() {
			$('.tooltip').fadeOut(200, function() { // Remove all tooltips
				$(this).remove();
			});
			var link = $(this).parent().children("a").attr('href'); // Get the requested link
			$(this).parent().append('<div class="tooltip"><p>Are you sure?</p><a href="' + link + '">Yes</a> | <a href="#" class="close">No</a></div>'); // Adding the tooltip to the DOM
			
			$('.close').click(function() { // Closing the tooltip
				$('.tooltip').fadeOut(200, function() {
					$(this).remove();
				});
				return false;
			});

			$(this).parent().children('.tooltip').fadeIn(200);
			return false; // Make sure it doesn't follow the link immediately
		});
	
	// Collapse content boxes:
	
		$('.content-box-header h3').click(function() {
			if($(this).parent().parent().hasClass('closed')) {
				$(this).parent().parent().children('.content-box-content').show();
				$(this).parent().parent().removeClass('closed');
			} else {
				$(this).parent().parent().children('.content-box-content').hide();
				$(this).parent().parent().addClass('closed');
			}
		});

	// Close notifications:
	
		$('div.notification').click(function() {
			$(this).fadeOut(200, function () {
				$(this).hide();
			});
		});
	
});