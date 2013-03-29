var HopeApp = (function(app, $){
    var GlobalNav = function () {
        var buttons;
        var selection;

        function init() {
            buttons = $(".navList").children().children("a").each(function(key, value) {
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
