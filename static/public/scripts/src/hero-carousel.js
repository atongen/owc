var HopeApp = (function(app, $){

	var HeroCarousel = function () {

		var autoRotateTimout,
			autoRotateDelay = 1000,
			currentSlideIndex = 0,
			$carousel,
			$slides,
			$pagination;

		function init() {
	
			$carousel = $('.hero-carousel');
			$slides = $('.slides li');
			console.log($slides);
			$pagination = $carousel.find('.pagination');
			// build pagination
			
			var paginationMarkup = '';
		
			for(var i=0; i<$slides.length; i++){
				paginationMarkup += '<li><a href="#">•</a></li>';
			}
			
			$carousel.find('.pagination').append(paginationMarkup);			
			$pagination.find('li').first().addClass('active');
	
			beginTimer();
	
		}
	
		function beginTimer() {
			autoRotateTimeout = setTimeout(function(){
				nextSlide();
			}, autoRotateDelay);
		}
		
		function stopTimer() {
		
		}  
	
		function nextSlide(){
			var targetSlideIndex = currentSlideIndex + 1;
			if(targetSlideIndex >= $slides.length){
				target = 0;
			}
			changeSlide(targetSlideIndex);
		}
		
		function previousSlide(){
			currentSlideIndex
		}
		
		function changeSlide(targetIndex){
			
			$currentSlide = $slides.find('.active');
			console.log('hi', $slides.html());
			$currentSlide.removeClass('.active');
			
			
		}
	
		return {
			init: init
		}
	
	}
	app.heroCarousel = new HeroCarousel();
	
	return app;

})(HopeApp || {}, $);