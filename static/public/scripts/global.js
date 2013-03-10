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


/* **********************************************
     Begin hero-carousel.js
********************************************** */

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

/* **********************************************
     Begin gallery-carousel.js
********************************************** */

var HopeApp = (function(app, $){
    var GalleryCarousel = function () {
        function init() {
            console.log('Gallery');
            $(".gallery-carousel").each(function(index, view) {
                new app.galleryCarousel.Gallery($(view));
            });
            return app;
        }

        function Gallery(view) {
            var self = this;
            self.width = view.width();
            self.navigation = view.find(".navigation");
            self.imageContainer = view.find(".images")
            self.images = view.find(".image");
            self.previous = view.find(".previous");
            self.next = view.find(".next");
            self.index = 0;
            self.button;

            self.previous.fadeOut(0);
            self.next.fadeOut(0);

            self.gotoIndex = function(index, animated, direction) {
                if (index < 0)
                    index += self.images.length;
                if (index > self.images.length - 1)
                    index -= self.images.length;

                self.index = index;

                var offset = 0;
                if (direction)
                    offset = direction === "next" ? self.width : -self.width;

                $(self.images[self.index]).stop(true, true)
                    .appendTo(self.imageContainer)
                    .css("left", offset)
                    .animate({left: 0}, !animated ? 0 : "normal");
            }

            self.gotoNextImage = function(animated) {
                self.gotoIndex(self.index+1, true, "next");
            }

            self.gotoPreviousImage = function(animated) {
                self.gotoIndex(self.index-1, true, "previous");
            }

            self.navigation.click(function(event) {
                event.preventDefault();
                if (self.button === self.previous)
                    self.gotoPreviousImage(true);
                else
                    self.gotoNextImage(true);
            });

            self.setRollover = function(value) {
                var rollover;
                if (value !== 0)
                    rollover = value < self.width/2 ? self.previous : self.next;

                if (rollover !== self.button) {
                    if (self.button)
                        self.button.stop(true, true).fadeOut("fast");
                    self.button = rollover;
                    if (self.button)
                        self.button.stop(true, true).fadeIn("fast");
                }
            }

            self.navigation.mouseenter(function(event) {
                event.preventDefault();
                self.setRollover(event.pageX - self.images.offset().left);
            });

            self.navigation.mousemove(function(event) {
                event.preventDefault();
                self.setRollover(event.pageX - self.images.offset().left);
            });

            self.navigation.mouseleave(function(event) {
                event.preventDefault();
                self.setRollover(0);
            });

            self.gotoIndex(0, false);
        }

        return {
            init: init,
            Gallery: Gallery
        }
    }
    app.galleryCarousel = new GalleryCarousel();
    return app;
})(HopeApp || {}, $);