(function() {

  require.config({
    paths: {
      ko: 'knockout-2.0.0.debug'
    }
  });

  require(['order!config', 'order!ko', 'order!app', 'text!/templates.html'], function(config, koLib, App, templates) {
    $('head').append(templates);
    return $(function() {
      var myObjectInstance;
      myObjectInstance = new App;
      return ko.applyBindings(myObjectInstance);
    });
  });

}).call(this);
