//@codekit-append "app.js";
//@codekit-append "global-nav.js";
//@codekit-append "hero-carousel.js";
//@codekit-append "gallery-carousel.js";
//@codekit-append "easter-egg.js";
//@codekit-append "mobile-menu.js";


/* **********************************************
     Begin app.js
********************************************** */

var HopeApp = (function(app, $){

	/**
	 * Initialize Hope App
	 */
	function init() {
	    app.heroCarousel.init();
        app.galleryCarousel.init();
        app.easterEgg.init();

        app.mobileMenu.init();

        if ('ontouchstart' in document.documentElement)
        	if ($(window).width() > 640)
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


/* **********************************************
     Begin global-nav.js
********************************************** */

var HopeApp = (function(app, $){
    var GlobalNav = function () {
        var buttons;
        var selection;

        function init() {
            buttons = $(".navList").children().find("a").each(function(key, value) {
                $(value).click(didClickButton);
            });

            return app;
        }

        function didClickButton(event) {
            event.preventDefault();
            $(event.currentTarget).parent().trigger("mouseover");
        }

        return {
            init: init
        }
    }
    app.globalNav = new GlobalNav();
    return app;
})(HopeApp || {}, $);

/* **********************************************
     Begin hero-carousel.js
********************************************** */

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

/* **********************************************
     Begin easter-egg.js
********************************************** */

var HopeApp = (function(app, $){
    var EasterEgg = function () {

        var mk = $(new Image());
        mk.load().attr('src', "public/easter/toasty.png")
            .css("position", "fixed")
            .css("bottom", "0px")
            .css("right", "-298px");

        var step = 0;
        function init() {
            $('body').keydown(function(event) {
                //play();

                if (step === 0 && event.keyCode === 38) {
                    //console.log("up");
                    step++;
                    return;
                } else if (step === 1 && event.keyCode === 38) {
                    //console.log("up");
                    step++;
                    return;
                } else if (step === 2 && event.keyCode === 40) {
                    //console.log("down");
                    step++;
                    return;
                } else if (step === 3 && event.keyCode === 40) {
                    //console.log("down");
                    step++;
                    return;
                } else if (step === 4 && event.keyCode === 37) {
                    //console.log("left");
                    step++;
                    return;
                } else if (step === 5 && event.keyCode === 39) {
                    //console.log("right");
                    step++;
                    return;
                } else if (step === 6 && event.keyCode === 37) {
                    //console.log("left");
                    step++;
                    return;
                } else if (step === 7 && event.keyCode === 39) {
                    //console.log("right");
                    step++;
                    return;
                } else if (step === 8 && event.keyCode === 65) {
                    //console.log("a");
                    step++;
                    return;
                } else if (step === 9 && event.keyCode === 66) {
                    //console.log("b");
                    step++;
                    return;
                } else if (step === 10 && event.keyCode === 13) {
                    //console.log("start");
                    console.log("contra...")
                    $('body').append("<embed src='public/easter/contra.mp3' hidden=true autostart=true loop=false>");
                    step = 0;
                    return;
                }

                if (step === 0 && event.keyCode === 65) {
                    //console.log("a");
                    step++;
                    return;
                } else if (step === 1 && event.keyCode === 66) {
                    //console.log("b");
                    step++;
                    return;
                } else if (step === 2 && event.keyCode === 65) {
                    //console.log("a");
                    step++;
                    return;
                } else if (step === 3 && event.keyCode === 67) {
                    //console.log("c");
                    step++;
                    return;
                } else if (step === 4 && event.keyCode === 65) {
                    //console.log("a");
                    step++;
                    return;
                } else if (step === 5 && event.keyCode === 66) {
                    //console.log("b");
                    step++;
                    return;
                } else if (step === 6 && event.keyCode === 66) {
                    //console.log("b");
                    console.log("test your might...")
                    mk.appendTo($('body')).animate({right: 0}, 100).delay(700).animate({right: "-298px"}, 100, function(){mk.remove()});
                    //$('body').append("<embed src='public/easter/contra.mp3' hidden=true autostart=true loop=false>");
                    step = 0;
                    return;
                }

                step = 0;
                //console.log("wrong.");
            });
            return app;
        }

        return {
            init: init
        }
    }
    app.easterEgg = new EasterEgg();
    return app;
})(HopeApp || {}, $);

/* **********************************************
     Begin mobile-menu.js
********************************************** */

var HopeApp = (function(app, $){

	var MobileMenu = function () {

		var $site,
			$menuToggle,
			isOpen = false,
			$mobileMenu;

		function init() { 
	
			$site = $('.site');
            console.log('page load ',$site.width())
			$mobileMenu = $('.navPrimaryMobile');
			$menuToggle = $('.navPrimary-toggle-btn');
			
			$menuToggle.bind('click', function(event){
				event.preventDefault();
				
				if(isOpen){
					isOpen = false;
					$site.css({ '-webkit-transform': 'translateX(0px)' });
                    console.log('nav de-activated ',$site.width())
				} else {
					isOpen = true;
					console.log('nav activated ',$site.width())
					// $site.css({ '-webkit-transform': 'translateX(' + ($site.width() - 66) + 'px)' });
                    $site.css({ '-webkit-transform': 'translateX(' + ($site.width() - 66) + 'px)' });

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
