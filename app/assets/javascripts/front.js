//if ($.cookie("theme_csspath")) {
//	$('link#theme-stylesheet').attr("href", $.cookie("theme_csspath"));
//}

$(function() {
	productDetailGallery(4000);
	utils();
	demo();
});


/* for demo purpose only - can be deleted */

function demo() {

	//if ($.cookie("theme_csspath")) {
	//	$('link#theme-stylesheet').attr("href", $.cookie("theme_csspath"));
	//}

	$("#colour").change(function() {

		if ($(this).val() !== '') {

			var theme_csspath = 'css/style.' + $(this).val() + '.css';

			$('link#theme-stylesheet').attr("href", theme_csspath);

			$.cookie("theme_csspath", theme_csspath, {expires: 365, path: '/'});
		}

		return false;
	});
}

/* product detail gallery */

function productDetailGallery(confDetailSwitch) {
	$('.thumb:first').addClass('active');
	timer = setInterval(autoSwitch, confDetailSwitch);
	$(".thumb").click(function(e) {

		switchImage($(this));
		clearInterval(timer);
		timer = setInterval(autoSwitch, confDetailSwitch);
		e.preventDefault();
	}
	);
	$('#mainImage').hover(function() {
		clearInterval(timer);
	}, function() {
		timer = setInterval(autoSwitch, confDetailSwitch);
	});

	function autoSwitch() {
		var nextThumb = $('.thumb.active').closest('div').next('div').find('.thumb');
		if (nextThumb.length == 0) {
			nextThumb = $('.thumb:first');
		}
		switchImage(nextThumb);
	}

	function switchImage(thumb) {

		$('.thumb').removeClass('active');
		var bigUrl = thumb.attr('href');
		thumb.addClass('active');
		$('#mainImage img').attr('src', bigUrl);
	}
}

function utils() {


	/* click on the box activates the radio */

	$('#checkout').on('click', '.box.shipping-method, .box.payment-method', function(e) {
		var radio = $(this).find(':radio');
		radio.prop('checked', true);
	});
	/* click on the box activates the link in it */

	$('.box.clickable').on('click', function(e) {

		window.location = $(this).find('a').attr('href');
	});
	/* external links in new window*/

	$('.external').on('click', function(e) {

		e.preventDefault();
		window.open($(this).attr("href"));
	});
	/* animated scrolling */

	$('.scroll-to, .scroll-to-top').click(function(event) {

		var full_url = this.href;
		var parts = full_url.split("#");
		if (parts.length > 1) {

			scrollTo(full_url);
			event.preventDefault();
		}
	});
	function scrollTo(full_url) {
		var parts = full_url.split("#");
		var trgt = parts[1];
		var target_offset = $("#" + trgt).offset();
		var target_top = target_offset.top - 100;
		if (target_top < 0) {
			target_top = 0;
		}

		$('html, body').animate({
			scrollTop: target_top
		}, 1000);
	}
}
