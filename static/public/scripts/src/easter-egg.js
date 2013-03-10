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