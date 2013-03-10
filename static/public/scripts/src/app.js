var HopeApp = (function(app, $){

	/**
	 * Initialize Hope App
	 */
	function init() {
	
	    console.log('ALIVE!');	
	    
	    console.log(app.heroCarousel);
	    app.heroCarousel.init();
        app.galleryCarousel.init();
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
