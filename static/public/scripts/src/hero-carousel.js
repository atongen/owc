var HopeApp = (function(app, $){

	var HeroCarousel = function () {

		var autoRotateTimout,
			autoRotateDelay = 2000,
			currentSlideIndex = 0,
			slideChangeSpeed = 1000,
			totalSlides = 0,
			$carousel,
			$slides,
			$pagination;

		function init() {
	
			$carousel = $('.hero-carousel');
			$slides = $('.slides');
			totalSlides = $slides.find('li').length;
			$pagination = $carousel.find('.pagination');
			// build pagination
			
			var paginationMarkup = '';
		
			for(var i=0; i< totalSlides; i++){
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
			if(targetSlideIndex >= totalSlides){
				targetSlideIndex = 0;
			}
			changeSlide(targetSlideIndex);
		}
		
		function previousSlide(){
			currentSlideIndex
		}
		
		function changeSlide(targetSlideIndex){
			
			var $currentSlide = $slides.find('li.active');
			var $targetSlide = $slides.find('li').eq(targetSlideIndex);
			$currentSlide.removeClass('active').addClass('exiting');
			var slideWidth = $carousel.width();
			$targetSlide.css({ left: slideWidth }).addClass('active').animate({ left: 0 }, slideChangeSpeed, function(){
				$slides.find('li').removeClass('exiting');
			});
			currentSlideIndex = targetSlideIndex;
			
			// update pagination
			$pagination.find('li').removeClass('active');
			$pagination.find('li').eq(targetSlideIndex).addClass('active');
			
			beginTimer();
		}
	
		return {
			init: init
		}
	
	}
	app.heroCarousel = new HeroCarousel();
	
	return app;

})(HopeApp || {}, $);