var HopeApp = (function(app, $){

	var MobileMenu = function () {

		var $site,
			$menuToggle,
			isOpen = false,
			$mobileMenu;

		function init() { 
	
			$site = $('.site');
			$mobileMenu = $('.navPrimaryMobile');
			$menuToggle = $('.navPrimary-toggle-btn');
			
			$menuToggle.bind('click', function(event){
				event.preventDefault();
				
				// if(isOpen){
				// 	isOpen = false;
				// 	$site.css({ '-webkit-transform': 'translateX(0px)' });
				// } else {
				// 	isOpen = true;
					
				// 	$site.css({ '-webkit-transform': 'translateX(' + ($site.width() - 66) + 'px)' });
				// }
                if(isOpen){
                    isOpen = false;
                    $site.css({ '-webkit-transform': 'translate3d(0px, 0, 0)' });
                } else {
                    isOpen = true;
                    
                    $site.css({ '-webkit-transform': 'translate3d(' + ($site.width() - 66) + 'px), 0 ,0' });
                }
			});
		}
		
	
	
		return {
			init: init
		}
	
	}
	app.mobileMenu = new MobileMenu();
	
	return app;

})(HopeApp || {}, $);