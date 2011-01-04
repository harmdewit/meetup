$('document').ready(function() {
	jQuery.fx.interval = 1;
	
	$('#tabcontent ul li a').click(function() {
		$('#tabcontent ul li').each(function() {
			$(this).removeClass('active');
		});
		
		$(this).parent().addClass('active');
		
		return false;
	});

	$('.stack').click(function() {
		if($(this).children('.main_card').hasClass('flip')) {
			$(this).children('.main_card').removeClass('flip');
		} else {
			$(this).children('.main_card').addClass('flip');
		}
	});

	$('.clickarea').click(function() {
		var array = [-3, -2, 1, 4, 3, 2, -1, -4, -5, -6, -7, -8, 5, 6, 7, 8];
		var index = $(this).parent().parent().index() + 1;
		var newarray = [];
	
		for(i = 0; i < array.length; i++) {
			var getal = index + array[i];
		
			if(getal > 0 && getal <= 9 ) {
				newarray.push(array[i]);
			}
		}
	
		$(this).parent().parent().addClass('overlay');
		$(this).parent().parent().parent().children(".stack").each(function() {
			if(!$(this).hasClass('overlay')) {
				$(this).css({opacity: .15});
			}
		});
	
		$(this).parent().parent().children('.connections').children('.card:nth-child(1)').animate({left: "330px", top: "162px"}, {duration: 400, easing: 'easeOutBack'});
		$(this).parent().parent().children('.connections').children('.card:nth-child(2)').animate({left: "330px", top: 0}, {duration: 400, easing: 'easeOutBack'});
		$(this).parent().parent().children('.connections').children('.card:nth-child(3)').animate({left: 0, top: "162px"}, {duration: 400, easing: 'easeOutBack'});

		$(this).parent().parent().children('.connections').children('.card').children(".card_inside").animate({width: "298px", opacity: "1"}, {duration: 400});
		$(this).parent().parent().children('.connections').children('.card').animate({border: "1px solid #f5edd8"}, {duration: 400});
		return false;
	});

	$('.modal').click(function() {
		$('#overlay').show();
	});

	$('#modal a').click(function() {
		$('#overlay').hide();
	});

	$('.dropdown').click(function() {
		if($(this).hasClass('active')) {
			$(this).removeClass('active');
			$(this).children('ul').slideUp(200);
		} else {
			$(this).addClass('active');
			$(this).children('ul').slideDown(200);
		}
	});
	
	$('.close').click(function() {
		$(this).parent().slideUp('fast');
	});

});

function linkedin() {
	$('document').ready(function() {
		var id = [];
		$('.linkedin').each(function() {
			id.push($(this).attr("data-linkedin"));
		});
		IN.API.Profile(id).result(displayCard);
	});
}

function displayCard(profiles) {
	var members = profiles.values;
	
	for(var member in members) {
	
		$('.linkedin').each(function() {
			if($(this).attr("data-linkedin") == members[member].id) {
				$(this).find("small").html(members[member].headline);
				$(this).find("img").attr("src", members[member].pictureUrl);
			}
		});
		
	}
}