var HopeApp = (function(app, $){
    var EasterEgg = function () {

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
                    step++;
                    return;
                }

                step = 0;
                //console.log("wrong.");
            });
            return app;
        }

        var collection=[];// final collection of sounds to play
        var loadedIndex=0;// horrible way of forcing a load of audio sounds

// remap audios to a buffered collection
        var audio;
        function play() {
            audio = new Audio("public/easter/contra.mp3");
            buffer(audio);
            console.log("play");
        }

// did I mention it's a horrible way to buffer?
        function buffer(audio) {
            if(audio.readyState==4)return playLooped();
            setTimeout(function(){buffer(audio)},100);
        }

// check if we're leady to dj this
        function loaded() {
            loadedIndex++;
            if(collection.length==loadedIndex)playLooped();
        }

// play and loop after finished
        function playLooped() {
            audio.play();
        }

        return {
            init: init
        }
    }
    app.easterEgg = new EasterEgg();
    return app;
})(HopeApp || {}, $);