var HopeApp = (function(app, $){

	/**
	 * Initialize Hope App
	 */
	function init() {
	    app.heroCarousel.init();
        app.galleryCarousel.init();
        app.easterEgg.init();
        if ('ontouchstart' in document.documentElement)
            app.globalNav.init();
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
