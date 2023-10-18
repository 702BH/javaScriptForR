// custom.js
var boxxyBinding = new Shiny.OutputBinding()

$.extend(boxxyBinding, {
    find: function(scope) {
        return $(scope).find(".boxxy");
    }
})