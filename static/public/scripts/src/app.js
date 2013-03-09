var HopeApp = (function(app, $){

	/**
	 * Initialize Hope App
	 */
	function init() {
	
	    console.log('ALIVE BUTTS 5!!!');	
		return app;
	}
	
	// announce touch device
	app.isTouch = !!('ontouchstart' in window) ? true : false; // bang bang, you're boolean
	if (app.isTouch) {
		$('body').addClass('is-touch');
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
