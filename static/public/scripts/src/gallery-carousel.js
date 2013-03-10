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
            self.imageContainer = view.find(".images")
            self.images = view.find(".image");
            self.index = 0;

            console.log(self.images);

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

            view.find(".navigation").click(function(event) {
                event.preventDefault();
                if (event.offsetX < self.width/2)
                    self.gotoPreviousImage(true);
                else
                    self.gotoNextImage(true);
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