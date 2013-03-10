//@codekit-append "app.js";
//@codekit-append "hero-carousel.js";
//@codekit-append "gallery-carousel.js";

/* **********************************************
     Begin app.js
********************************************** */

var HopeApp = (function(app, $){

	/**
	 * Initialize Hope App
	 */
	function init() {
	
	    console.log('ALIVE!');	
	    
	    console.log(app.heroCarousel);
	    app.heroCarousel.init();
		return app;
	}
	
	app.config = {
	
	};
	
	app.init = init;

	return app;

})(HopeApp || {}, $);


$(function(){
	// BEGIN!
	var app = HopeApp.init();
});


/* **********************************************
     Begin hero-carousel.js
********************************************** */

var HopeApp = (function(app, $){

	var HeroCarousel = function () {

		function init() {
	
			console.log('Carousel');	
			return app;
		}
	
		return {
			init: init
		}
	
	}
	app.heroCarousel = new HeroCarousel();
	
	return app;

})(HopeApp || {}, $);