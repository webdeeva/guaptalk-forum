
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
    return "<!-- Guaptalk Hero Section -->\n<div class=\"hero-section\">\n<div class=\"hero-container\">\n<div class=\"hero-content\">\n<div class=\"hero-text\">\n<h1 class=\"hero-title\">Welcome to Guaptalk Community</h1>\n<p class=\"hero-subtitle\">Where authentic conversations create lasting connections</p>\n<div class=\"hero-actions\">\n" + 
      (guard((context != null) ? context['loggedIn'] : null) ?
        "\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/recent\" class=\"btn btn-primary btn-lg hero-btn\">\n<i class=\"fa fa-comments\"></i> View Recent Discussions\n</a>\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/compose\" class=\"btn btn-outline-primary btn-lg hero-btn\">\n<i class=\"fa fa-pencil\"></i> Start a Topic\n</a>\n" :
        "\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/register\" class=\"btn btn-primary btn-lg hero-btn\">\n<i class=\"fa fa-user-plus\"></i> Join the Community\n</a>\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/login\" class=\"btn btn-outline-primary btn-lg hero-btn\">\n<i class=\"fa fa-sign-in\"></i> Sign In\n</a>\n") + 
      "\n</div>\n</div>\n<div class=\"hero-image\">\n<img src=\"" + 
      __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
      "/uploads/people.png\" alt=\"Guaptalk Community\" />\n</div>\n</div>\n</div>\n</div>";
  }

  compiled.blocks = {
    
  };

  return compiled;
})
