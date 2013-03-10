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
			autoRotateDelay = 1000,
			currentSlideIndex = 0,
			$carousel,
			$slides,
			$pagination;

		function init() {
	
			$carousel = $('.hero-carousel');
			$slides = $('.slides li', '.hero-carousel');
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
<<<<<<< HEAD
            self.navigation = view.find(".navigation");
            self.imageContainer = view.find(".images")
            self.images = view.find(".image");
            self.previous = view.find(".previous");
            self.next = view.find(".next");
            self.index = 0;
            self.button;

            self.previous.fadeOut(0);
            self.next.fadeOut(0);
=======
            self.imageContainer = view.find(".images")
            self.images = view.find(".image");
            self.index = 0;

            console.log(self.images);
>>>>>>> 047ef53a97636d4bb10e776adc6cadf3b02078a2

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

<<<<<<< HEAD
            self.navigation.click(function(event) {
                event.preventDefault();
                if (self.button === self.previous)
=======
            view.find(".navigation").click(function(event) {
                event.preventDefault();
                if (event.offsetX < self.width/2)
>>>>>>> 047ef53a97636d4bb10e776adc6cadf3b02078a2
                    self.gotoPreviousImage(true);
                else
                    self.gotoNextImage(true);
            });

<<<<<<< HEAD
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

=======
>>>>>>> 047ef53a97636d4bb10e776adc6cadf3b02078a2
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