var HopeApp = (function(app, $){
    var GlobalNav = function () {

        function init() {

            var i;
            var numDropdowns;
            var element;
            var $dropdowns = $(".navPrimary > .navList > li");

            function menuTouch(event) {
                // toggle flag for preventing click for this link
                var noclick = !(this.dataNoclick);

                // reset flag on all links
                for (i = 0, numDropdowns = $dropdowns.length; i < numDropdowns; ++i) {
                    $dropdowns[i].dataNoclick = false;
                }

                // set new flag value and focus on dropdown menu
                this.dataNoclick = noclick;
                this.focus();
            }

            function menuClick(event) {
                // if click isn't wanted, prevent it
                if (this.dataNoclick) {
                    event.preventDefault();
                }
            }

            $dropdowns.bind({
                touchstart: menuTouch,
            click: menuClick
            });

            return app;
        }

        return {
            init: init
        }
    }
    app.globalNav = new GlobalNav();
    return app;
})(HopeApp || {}, $);
