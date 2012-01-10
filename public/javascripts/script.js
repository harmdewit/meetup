$('document').ready(function() {
	jQuery.fx.interval = 1;
	
	$('#tabcontent .content div').hide();
	$('#tabcontent .content div:first-child').show();
	
	$('#tabcontent > ul li a').click(function() {
		$('#tabcontent ul li').removeClass('active');
		$(this).parent().addClass('active');
		
		var id = $(this).attr("href");
		
		$('#tabcontent .content div').hide();
		$(this).parent().parent().parent().find(id).show();
		
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
		var one = ["four", "six", "five"];
		var two = ["eight", "four", "six"];
		var three = ["eight", "six", "seven"];
		var four = ["two", "four", "three"];
		var five = ["eight", "two", "four"];
		var six = ["eight", "two", "one"];
		var seven = ["two", "four", "three"];
		var eight = ["eight", "two", "four"];
		var nine = ["two", "eight", "one"];
		
		var number = $(this).parent().parent().index() + 1;
		
		switch(number) {
			case 1:
				var array = one;
				break;
			case 2:
				var array = two;
				break;
			case 3:
				var array = three;
				break;
			case 4:
				var array = four;
				break;
			case 5:
				var array = five;
				break;
			case 6:
				var array = six;
				break;
			case 7:
				var array = seven;
				break;
			case 8:
				var array = eight;
				break;
			case 9:
				var array = nine;
				break;
			default:
				var array = one;
				break;
		}
		
		if(!$(this).parent().parent().hasClass('overlay')) {
			$(this).parent().parent().addClass('overlay');
			$(this).parent().parent().parent().children(".stack").each(function() {
				if(!$(this).hasClass('overlay')) {
					$(this).fadeTo(200, ".15");
				}
			});
			
			$(this).parent().parent().children('.connections').children('.card:nth-child(1)').addClass(array[0]);
			$(this).parent().parent().children('.connections').children('.card:nth-child(2)').addClass(array[1]);
			$(this).parent().parent().children('.connections').children('.card:nth-child(3)').addClass(array[2]);
			
			$(this).parent().parent().children('.connections').children('.card:nth-child(1)').fadeIn();
			$(this).parent().parent().children('.connections').children('.card:nth-child(2)').fadeIn();
			$(this).parent().parent().children('.connections').children('.card:nth-child(3)').fadeIn();
			
			$(this).parent().parent().children('.connections').children('.card').children(".card_inside").css({width: "298px", opacity: "1"});
			$(this).parent().parent().children('.connections').children('.card').css({border: "1px solid #f5edd8"});
		} else {
			$(this).parent().parent().removeClass('overlay');
			$(this).parent().parent().parent().children(".stack").each(function() {
				$(this).fadeTo(200, "1");
			});
			
			$(this).parent().parent().children('.connections').children('.card:nth-child(1)').removeClass(array[0]);
			$(this).parent().parent().children('.connections').children('.card:nth-child(2)').removeClass(array[1]);
			$(this).parent().parent().children('.connections').children('.card:nth-child(3)').removeClass(array[2]);
			
			$(this).parent().parent().children('.connections').children('.card:nth-child(1)').children(".card_inside").css({width: "284px", opacity: "0.9"});
			$(this).parent().parent().children('.connections').children('.card:nth-child(2)').children(".card_inside").css({width: "272px", opacity: "0.7"});
			$(this).parent().parent().children('.connections').children('.card:nth-child(3)').children(".card_inside").css({width: "298px", opacity: "0.7"});
		}
		
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
	
	$('a.gebruikersovereenkomst').click(function() {
		var link = $(this).attr("href");
		
		$("#overlay").show();
		$('.hide_overlay').click(function() {
			$("#overlay").hide();
		});
		
		$('#modal .buttons a:first-child').attr("href", link);
		
		$('p.gebruikersovereenkomst').jScrollPane();
		$('.jspVerticalBar').hide();

		$('p.gebruikersovereenkomst').hover(function() {
			$('.jspVerticalBar').fadeIn('fast');
		}, function() {
			$('.jspVerticalBar').fadeOut('fast');
		});
		
		return false;
	});

});

function linkedin() {
	$('document').ready(function() {
		var id = [];
		$('.linkedin').each(function() {
			id.push($(this).attr("data-linkedin"));
		});
		IN.API.Profile(id).fields("id", "firstName", "lastName", "headline", "pictureUrl", "site-standard-profile-request").result(displayCard);
		//IN.API.Profile(id).result(displayCard);

	});
}

function displayCard(profiles) {
	var members = profiles.values;
	
	for(var member in members) {
	
		$('.linkedin').each(function() {
			if($(this).attr("data-linkedin") == members[member].id) {
				$(this).find("small").html(members[member].headline);
				$(this).find("img.linkedin_img").attr("src", members[member].pictureUrl);
				$(this).find(".linkedin_url a").attr("href", members[member].siteStandardProfileRequest.url)
			}
		});
		
	}
}