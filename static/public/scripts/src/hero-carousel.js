var HopeApp = (function(app, $){

	var HeroCarousel = function () {

		var autoRotateTimeout,
			autoRotateDelay = 5000,
			currentSlideIndex = 0,
			slideChangeSpeed = 750,
			totalSlides = 0,
			isOver = false,
			$carousel,
			$slides,
			$pagination;

		function init() {
	
			$carousel = $('.hero-carousel');
			
			$carousel.mouseenter(function(){
				isOver = true;
				stopTimer();
			});
			
			$carousel.mouseleave(function(){
				isOver = false;
				beginTimer();
			});
			
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
	
			$pagination.find('a').click(function(event){
				event.preventDefault();
				var targetSlideIndex = $(this).parent().index();
				if(targetSlideIndex == currentSlideIndex) return;
				changeSlide(targetSlideIndex);
			});
	
			beginTimer();
	
		}
	
		function beginTimer() {
			autoRotateTimeout = setTimeout(function(){
				nextSlide();
			}, autoRotateDelay);
		}
		
		function stopTimer() {
			clearTimeout(autoRotateTimeout);
		}  
	
		function nextSlide(){
			var targetSlideIndex = currentSlideIndex + 1;
			if(targetSlideIndex >= totalSlides){
				targetSlideIndex = 0;
			}
			changeSlide(targetSlideIndex);
		}
		
		
		function changeSlide(targetSlideIndex){
			
			
			var fromLeft = false;
			
			if(targetSlideIndex < currentSlideIndex) fromLeft = true;
			
			var $currentSlide = $slides.find('li.active');
			var $targetSlide = $slides.find('li').eq(targetSlideIndex);
			$currentSlide.removeClass('active').addClass('exiting');
			var slideWidth = $carousel.width();
			
			if(!fromLeft){
				$targetSlide.css({ left: slideWidth }).addClass('active').animate({ left: 0 }, slideChangeSpeed, function(){
					$slides.find('li').removeClass('exiting');
				});
			} else {
				$targetSlide.css({ left: -slideWidth }).addClass('active').animate({ left: 0 }, slideChangeSpeed, function(){
					$slides.find('li').removeClass('exiting');
				});
			}
			currentSlideIndex = targetSlideIndex;
			
			// update pagination
			$pagination.find('li').removeClass('active');
			$pagination.find('li').eq(targetSlideIndex).addClass('active');
			
			if(!isOver) beginTimer();
		}
	
		return {
			init: init
		}
	
	}
	app.heroCarousel = new HeroCarousel();
	
	return app;

})(HopeApp || {}, $);