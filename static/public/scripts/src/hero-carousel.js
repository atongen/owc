var HopeApp = (function(app, $){

	var HeroCarousel = function () {

		function init() {
	
			var $carousel = $('.hero-carousel');
			var $slides = $('.slides li', '.hero-carousel');
			var $pagination = $carousel.find('.pagination');
			// build pagination
			
			var paginationMarkup = '';
		
			for(var i=0; i<$slides.length; i++){
				paginationMarkup += '<li><a href="#">•</a></li>';
			}
			
			$carousel.find('.pagination').append(paginationMarkup);
			
			$pagination.find('li').first().addClass('active');
			
			console.log($slides);	
		}
	
		function changeSlide(targetIndex){
			
			
			
		}
	
		return {
			init: init
		}
	
	}
	app.heroCarousel = new HeroCarousel();
	
	return app;

})(HopeApp || {}, $);