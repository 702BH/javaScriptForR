HTMLWidgets.widget({

  name: 'gio',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance
    var controller;
    var sel_handle = new crosstalk.SelectionHandle();

    return {

      renderValue: function(x) {

        sel_handle.setGroup(x.crosstalk.group);



        // TODO: code to render the widget, e.g.
        var container = document.getElementById(el.id);
        controller = new GIO.Controller(el);
        controller.addData(x.data);
        controller.setStyle(x.style);

        if(x.stats){
          controller.enableStats();
        }



        controller.init();

      },

      resize: function(width, height) {

        controller.resizeUpdate();

        // TODO: code to re-render the widget with a new size

      },
    };
    function callback(selectedCountry){
      sel_handle.set([selectedCountry.ISOCode]);
    }
    controller.onCountryPicked(callback);

    sel_handle.on("change", function(e){
      if (e.sender !== sel_handle){

      }
      controller.switchCountry(e.value[0]);
    })


  },
});
