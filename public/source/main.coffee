require.config
  paths:
    ko: 'knockout-2.0.0.debug'

require ['order!config', 'order!ko', 'order!app', 'text!/templates.html'], (config, koLib, App, templates) ->
  $('head').append(templates)
  # on dom ready
  $ ->

    myObjectInstance = new App

    ko.applyBindings(myObjectInstance)
