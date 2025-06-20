
(function (factory) {
  if (typeof module === 'object' && module.exports) {
    module.exports = factory();
  } else if (typeof define === 'function' && define.amd) {
    define(factory);
  }
})(function () {
  function compiled(helpers, context, guard, iter, helper) {
    var __escape = helpers.__escape;
    var value = context;
    return "<div class=\"mb-3\">\n<label class=\"form-label\">Room ID:</label>\n<input type=\"text\" class=\"form-control\" name=\"roomId\" placeholder=\"0\" />\n<p class=\"form-text\">Enter the room id to use for this widget</p>\n</div>";
  }

  compiled.blocks = {
    
  };

  return compiled;
})
