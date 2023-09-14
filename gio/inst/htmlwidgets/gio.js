HTMLWidgets.widget({

  name: 'gio',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance
    var controller;

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        var container = document.getElementById(el.id);
        controller = new GIO.Controller(el);
        controller.addData(x.data);
        controller.setStyle(x.style);

        if(x.stats)
          controller.enableStats();


        controller.init();

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
