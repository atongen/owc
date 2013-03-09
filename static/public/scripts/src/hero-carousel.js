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