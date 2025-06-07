
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
      "/uploads/people.png\" alt=\"Guaptalk Community\" />\n</div>\n</div>\n</div>\n</div>\n<div data-widget-area=\"header\">\n" + 
      compiled.blocks['widgets.header'](helpers, context, guard, iter, helper) + 
      "\n</div>\n<div class=\"row flex-fill py-2\">\n<div class=\"" + 
      (guard((context != null && context['widgets'] != null && context['widgets']['sidebar'] != null) ? context['widgets']['sidebar']['length'] : null) ?
        "col-lg-9 col-sm-12" :
        "col-lg-12") + 
      "\">\n" + 
      (guard((context != null && context['pagination'] != null && context['pagination']['pages'] != null) ? context['pagination']['pages']['length'] : null) ?
        "\n<div><div component=\"category-selector\" class=\"btn-group dropdown-left category-dropdown-container bottom-sheet\">\n<button type=\"button\" class=\"btn btn-ghost btn-sm ff-secondary d-flex align-items-center gap-2 dropdown-toggle\" data-bs-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n<span component=\"category-selector-selected\">\n" + 
          ((guard((context != null) ? context['selectedCategory'] : null) && !guard((context != null) ? context['showCategorySelectLabel'] : null)) ?
            "\n<span class=\"category-item d-inline-flex align-items-center gap-1\">\n" + 
              __escape(helper(context, helpers, 'buildCategoryIcon', [guard((context != null) ? context['selectedCategory'] : null), "24px", "rounded-circle"])) + 
              "\n<span class=\"fw-semibold\">" + 
              __escape(guard((context != null && context['selectedCategory'] != null) ? context['selectedCategory']['name'] : null)) + 
              "</span>\n</span>\n" :
            "\n<i class=\"fa fa-fw " + 
              (guard((context != null) ? context['selectCategoryIcon'] : null) ?
                __escape(guard((context != null) ? context['selectCategoryIcon'] : null)) :
                "fa-list") + 
              " text-primary\"></i>\n<span class=\"visible-md-inline visible-lg-inline fw-semibold\">" + 
              (guard((context != null) ? context['selectCategoryLabel'] : null) ?
                __escape(guard((context != null) ? context['selectCategoryLabel'] : null)) :
                "[[topic:thread-tools.select-category]]") + 
              "</span>\n") + 
          "\n</span>\n</button>\n<div class=\"dropdown-menu p-1\">\n<div component=\"category-selector-search\" class=\"p-1 hidden\">\n<input type=\"text\" class=\"form-control form-control-sm\" placeholder=\"[[search:type-to-search]]\" autocomplete=\"off\">\n<hr class=\"mt-2 mb-0\"/>\n</div>\n<ul component=\"category/list\" class=\"list-unstyled mb-0 text-sm category-dropdown-menu ghost-scrollbar\" role=\"menu\">\n<li component=\"category/no-matches\" role=\"presentation\" class=\"category hidden\">\n<a class=\"dropdown-item rounded-1\" role=\"menuitem\">[[search:no-matches]]</a>\n</li>\n" + 
          compiled.blocks['categoryItems'](helpers, context, guard, iter, helper) + 
          "\n</ul>\n</div>\n</div></div>\n" :
        "") + 
      "\n<ul class=\"categories-list list-unstyled\" itemscope itemtype=\"http://www.schema.org/ItemList\">\n" + 
      compiled.blocks['categories'](helpers, context, guard, iter, helper) + 
      "\n</ul>\n<nav component=\"pagination\" class=\"pagination-container mt-3" + 
      (guard((context != null && context['pagination'] != null && context['pagination']['pages'] != null) ? context['pagination']['pages']['length'] : null) ?
        "" :
        " hidden") + 
      "\" aria-label=\"[[global:pagination]]\">\n<ul class=\"pagination pagination-sm gap-1 hidden-xs hidden-sm justify-content-center\">\n<li class=\"page-item previous " + 
      (guard((context != null && context['pagination'] != null && context['pagination']['prev'] != null) ? context['pagination']['prev']['active'] : null) ?
        "" :
        " disabled") + 
      "\">\n<a class=\"page-link rounded fw-secondary px-3\" href=\"?" + 
      __escape(guard((context != null && context['pagination'] != null && context['pagination']['prev'] != null) ? context['pagination']['prev']['qs'] : null)) + 
      "\" data-page=\"" + 
      __escape(guard((context != null && context['pagination'] != null && context['pagination']['prev'] != null) ? context['pagination']['prev']['page'] : null)) + 
      "\" aria-label=\"[[global:pagination.previouspage]]\"><i class=\"fa fa-chevron-left\"></i> </a>\n</li>\n" + 
      compiled.blocks['pagination.pages'](helpers, context, guard, iter, helper) + 
      "\n<li class=\"page-item next " + 
      (guard((context != null && context['pagination'] != null && context['pagination']['next'] != null) ? context['pagination']['next']['active'] : null) ?
        "" :
        " disabled") + 
      "\">\n<a class=\"page-link rounded fw-secondary px-3\" href=\"?" + 
      __escape(guard((context != null && context['pagination'] != null && context['pagination']['next'] != null) ? context['pagination']['next']['qs'] : null)) + 
      "\" data-page=\"" + 
      __escape(guard((context != null && context['pagination'] != null && context['pagination']['next'] != null) ? context['pagination']['next']['page'] : null)) + 
      "\" aria-label=\"[[global:pagination.nextpage]]\"> <i class=\"fa fa-chevron-right\"></i></a>\n</li>\n</ul>\n" + 
      (guard((context != null && context['template'] != null) ? context['template']['topic'] : null) ?
        "" :
        "\n<ul class=\"pagination pagination-sm hidden-md hidden-lg justify-content-center\">\n<li class=\"page-item first" + 
          (guard((context != null && context['pagination'] != null && context['pagination']['prev'] != null) ? context['pagination']['prev']['active'] : null) ?
            "" :
            " disabled") + 
          "\">\n<a class=\"page-link fw-secondary\" href=\"?" + 
          __escape(guard((context != null && context['pagination'] != null && context['pagination']['first'] != null) ? context['pagination']['first']['qs'] : null)) + 
          "\" data-page=\"1\" aria-label=\"[[global:pagination.firstpage]]\"><i class=\"fa fa-fast-backward\"></i> </a>\n</li>\n<li class=\"page-item previous" + 
          (guard((context != null && context['pagination'] != null && context['pagination']['prev'] != null) ? context['pagination']['prev']['active'] : null) ?
            "" :
            " disabled") + 
          "\">\n<a class=\"page-link fw-secondary\" href=\"?" + 
          __escape(guard((context != null && context['pagination'] != null && context['pagination']['prev'] != null) ? context['pagination']['prev']['qs'] : null)) + 
          "\" data-page=\"" + 
          __escape(guard((context != null && context['pagination'] != null && context['pagination']['prev'] != null) ? context['pagination']['prev']['page'] : null)) + 
          "\" aria-label=\"[[global:pagination.previouspage]]\"><i class=\"fa fa-chevron-left\"></i> </a>\n</li>\n<li component=\"pagination/select-page\" class=\"page-item page select-page\">\n<a class=\"page-link fw-secondary\" href=\"#\" aria-label=\"[[global:pagination.go-to-page]]\">" + 
          __escape(guard((context != null && context['pagination'] != null) ? context['pagination']['currentPage'] : null)) + 
          " / " + 
          __escape(guard((context != null && context['pagination'] != null) ? context['pagination']['pageCount'] : null)) + 
          "</a>\n</li>\n<li class=\"page-item next" + 
          (guard((context != null && context['pagination'] != null && context['pagination']['next'] != null) ? context['pagination']['next']['active'] : null) ?
            "" :
            " disabled") + 
          "\">\n<a class=\"page-link fw-secondary\" href=\"?" + 
          __escape(guard((context != null && context['pagination'] != null && context['pagination']['next'] != null) ? context['pagination']['next']['qs'] : null)) + 
          "\" data-page=\"" + 
          __escape(guard((context != null && context['pagination'] != null && context['pagination']['next'] != null) ? context['pagination']['next']['page'] : null)) + 
          "\" aria-label=\"[[global:pagination.nextpage]]\"> <i class=\"fa fa-chevron-right\"></i></a>\n</li>\n<li class=\"page-item last" + 
          (guard((context != null && context['pagination'] != null && context['pagination']['next'] != null) ? context['pagination']['next']['active'] : null) ?
            "" :
            " disabled") + 
          "\">\n<a class=\"page-link fw-secondary\"  href=\"?" + 
          __escape(guard((context != null && context['pagination'] != null && context['pagination']['last'] != null) ? context['pagination']['last']['qs'] : null)) + 
          "\" data-page=\"" + 
          __escape(guard((context != null && context['pagination'] != null) ? context['pagination']['pageCount'] : null)) + 
          "\" aria-label=\"[[global:pagination.lastpage]]\"><i class=\"fa fa-fast-forward\"></i> </a>\n</li>\n</ul>\n") + 
      "\n</nav>\n</div>\n<div data-widget-area=\"sidebar\" class=\"col-lg-3 col-sm-12 " + 
      (guard((context != null && context['widgets'] != null && context['widgets']['sidebar'] != null) ? context['widgets']['sidebar']['length'] : null) ?
        "" :
        "hidden") + 
      "\">\n" + 
      compiled.blocks['widgets.sidebar'](helpers, context, guard, iter, helper) + 
      "\n</div>\n</div>\n<div data-widget-area=\"footer\">\n" + 
      compiled.blocks['widgets.footer'](helpers, context, guard, iter, helper) + 
      "\n</div>";
  }

  compiled.blocks = {
    'widgets.header': function widgetsheader(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null && context['widgets'] != null) ? context['widgets']['header'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n" + 
          guard((context != null && context['widgets'] != null && context['widgets']['header'] != null && context['widgets']['header'][key0] != null) ? context['widgets']['header'][key0]['html'] : null) + 
          "\n";
      }, function alt() {
        return "";
      });
    },
    'categoryItems': function categoryItems(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null) ? context['categoryItems'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n<li role=\"presentation\" class=\"category " + 
          (guard((context != null && context['categoryItems'] != null && context['categoryItems'][key0] != null) ? context['categoryItems'][key0]['disabledClass'] : null) ?
            "disabled " :
            "") + 
          "\" data-cid=\"" + 
          __escape(guard((context != null && context['categoryItems'] != null && context['categoryItems'][key0] != null) ? context['categoryItems'][key0]['cid'] : null)) + 
          "\" data-name=\"" + 
          __escape(guard((context != null && context['categoryItems'] != null && context['categoryItems'][key0] != null) ? context['categoryItems'][key0]['name'] : null)) + 
          "\" data-parent-cid=\"" + 
          __escape(guard((context != null && context['categoryItems'] != null && context['categoryItems'][key0] != null) ? context['categoryItems'][key0]['parentCid'] : null)) + 
          "\">\n<a class=\"dropdown-item rounded-1 " + 
          (guard((context != null && context['categoryItems'] != null && context['categoryItems'][key0] != null) ? context['categoryItems'][key0]['disabledClass'] : null) ?
            "disabled" :
            "") + 
          "\" role=\"menuitem\" href=\"#\">" + 
          __escape(guard((context != null && context['categoryItems'] != null && context['categoryItems'][key0] != null) ? context['categoryItems'][key0]['level'] : null)) + 
          "\n<span component=\"category-markup\" style=\"" + 
          (guard((context != null && context['categoryItems'] != null && context['categoryItems'][key0] != null) ? context['categoryItems'][key0]['match'] : null) ?
            "font-weight: bold;" :
            "") + 
          "\">\n<div class=\"category-item d-inline-flex align-items-center gap-1\">\n" + 
          (guard((context != null && context['categoryItems'] != null && context['categoryItems'][key0] != null) ? context['categoryItems'][key0]['icon'] : null) ?
            "\n" + 
              __escape(helper(context, helpers, 'buildCategoryIcon', [guard(value), "24px", "rounded-circle"])) + 
              "\n" :
            "") + 
          "\n" + 
          __escape(guard((context != null && context['categoryItems'] != null && context['categoryItems'][key0] != null) ? context['categoryItems'][key0]['name'] : null)) + 
          "\n</div>\n</span>\n</a>\n</li>\n";
      }, function alt() {
        return "";
      });
    },
    'categories': function categories(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null) ? context['categories'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n<li component=\"categories/category\" data-cid=\"" + 
          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['cid'] : null)) + 
          "\" class=\"w-100 border-bottom py-3 py-lg-4 gap-lg-0 gap-2 d-flex flex-column flex-lg-row align-items-start category-" + 
          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['cid'] : null)) + 
          " " + 
          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['unread-class'] : null)) + 
          "\">\n<meta itemprop=\"name\" content=\"" + 
          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['name'] : null)) + 
          "\">\n<div class=\"d-flex col-lg-7 gap-2 gap-lg-3\">\n<div class=\"flex-shrink-0\">\n" + 
          __escape(helper(context, helpers, 'buildCategoryIcon', [guard(value), "40px", "rounded-1"])) + 
          "\n</div>\n<div class=\"flex-grow-1 d-flex flex-wrap gap-1 me-0 me-lg-2\">\n<h2 class=\"title text-break fs-4 fw-semibold m-0 tracking-tight w-100\">\n" + 
          (guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['isSection'] : null) ?
            "\n" + 
              __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['name'] : null)) + 
              "\n" :
            "\n<a class=\"text-reset\" href=\"" + 
              (guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['link'] : null) ?
                __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['link'] : null)) :
                __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
                  "/category/" + 
                  __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['slug'] : null))) + 
              "\" itemprop=\"url\">" + 
              __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['name'] : null)) + 
              "</a>\n") + 
          "\n</h2>\n" + 
          (guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['descriptionParsed'] : null) ?
            "\n<div class=\"description text-muted text-sm w-100 line-clamp-sm-5\">\n" + 
              __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['descriptionParsed'] : null)) + 
              "\n</div>\n" :
            "") + 
          "\n" + 
          (guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['link'] : null) ?
            "" :
            "\n<div class=\"d-flex gap-1 d-block d-lg-none w-100\">\n<span class=\"badge text-body border stats text-xs text-muted\">\n<i class=\"fa fa-fw fa-list\"></i>\n<span class=\"fw-normal\">" + 
              __escape(helper(context, helpers, 'humanReadableNumber', [guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['totalTopicCount'] : null), guard((context != null) ? context['0'] : null)])) + 
              "</span>\n</span>\n<span class=\"badge text-body border stats text-xs text-muted\">\n<i class=\"fa-regular fa-fw fa-message\"></i>\n<span class=\"fw-normal\">" + 
              __escape(helper(context, helpers, 'humanReadableNumber', [guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['totalPostCount'] : null), guard((context != null) ? context['0'] : null)])) + 
              "</span>\n</span>\n" + 
              (guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['teaser'] : null) ?
                "\n<a href=\"" + 
                  __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
                  __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['teaser'] != null) ? context['categories'][key0]['teaser']['url'] : null)) + 
                  "\" class=\"border badge bg-transparent text-muted fw-normal timeago " + 
                  ((!guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['teaser'] != null) ? context['categories'][key0]['teaser']['timestampISO'] : null) || guard((context != null && context['config'] != null && context['config']['theme'] != null) ? context['config']['theme']['mobileTopicTeasers'] : null)) ?
                    "hidden" :
                    "") + 
                  "\" title=\"" + 
                  __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['teaser'] != null) ? context['categories'][key0]['teaser']['timestampISO'] : null)) + 
                  "\"></a>\n" :
                "") + 
              "\n</div>\n") + 
          "\n" + 
          (guard((context != null && context['config'] != null) ? context['config']['hideSubCategories'] : null) ?
            "" :
            "\n" + 
              (guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['children'] != null) ? context['categories'][key0]['children']['length'] : null) ?
                "\n<ul class=\"list-unstyled category-children row row-cols-1 row-cols-md-2 g-2 my-1 w-100\">\n" + 
                  iter(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['children'] : null), function each(key1, index, length, value) {
                    var key = key1;
                    return "\n" + 
                      (guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['children'] != null && context['categories'][key0]['children'][key1] != null) ? context['categories'][key0]['children'][key1]['isSection'] : null) ?
                        "" :
                        "\n<li data-cid=\"" + 
                          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['children'] != null && context['categories'][key0]['children'][key1] != null) ? context['categories'][key0]['children'][key1]['cid'] : null)) + 
                          "\" class=\"category-children-item small\">\n<div class=\"d-flex gap-1\">\n<i class=\"fa fa-fw fa-caret-right text-primary\" style=\"line-height: var(--bs-body-line-height);\"></i>\n<a href=\"" + 
                          (guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['children'] != null && context['categories'][key0]['children'][key1] != null) ? context['categories'][key0]['children'][key1]['link'] : null) ?
                            __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['children'] != null && context['categories'][key0]['children'][key1] != null) ? context['categories'][key0]['children'][key1]['link'] : null)) :
                            __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
                              "/category/" + 
                              __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['children'] != null && context['categories'][key0]['children'][key1] != null) ? context['categories'][key0]['children'][key1]['slug'] : null))) + 
                          "\" class=\"text-reset fw-semibold\">" + 
                          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['children'] != null && context['categories'][key0]['children'][key1] != null) ? context['categories'][key0]['children'][key1]['name'] : null)) + 
                          "</a>\n</div>\n</li>\n") + 
                      "\n";
                  }, function alt() {
                    return "";
                  }) + 
                  "\n</ul>\n" :
                "") + 
              "\n") + 
          "\n</div>\n</div>\n" + 
          (guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['link'] : null) ?
            "" :
            "\n<div class=\"d-flex col-lg-5 col-12 align-content-stretch\">\n<div class=\"meta stats d-none d-lg-grid col-6 gap-1 pe-2 text-muted\" style=\"grid-template-columns: 1fr 1fr;\">\n<div class=\"card card-header border-0 p-2 overflow-hidden rounded-1 d-flex flex-column align-items-center\">\n<span class=\"fs-5 ff-secondary lh-1\" title=\"" + 
              __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['totalTopicCount'] : null)) + 
              "\">" + 
              __escape(helper(context, helpers, 'humanReadableNumber', [guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['totalTopicCount'] : null), guard((context != null) ? context['0'] : null)])) + 
              "</span>\n<span class=\"d-none d-xl-flex text-lowercase text-xs\">[[global:topics]]</span>\n<i class=\"d-xl-none fa fa-fw text-xs text-muted opacity-75 fa-list\"></i>\n</div>\n<div class=\"card card-header border-0 p-2 overflow-hidden rounded-1 d-flex flex-column align-items-center\">\n<span class=\"fs-5 ff-secondary lh-1\" title=\"" + 
              __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['totalPostCount'] : null)) + 
              "\">" + 
              __escape(helper(context, helpers, 'humanReadableNumber', [guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['totalPostCount'] : null), guard((context != null) ? context['0'] : null)])) + 
              "</span>\n<span class=\"d-none d-xl-flex text-lowercase text-xs\">[[global:posts]]</span>\n<i class=\"d-xl-none fa-regular fa-fw text-xs text-muted opacity-75 fa-message\"></i>\n</div>\n</div>\n" + 
              (guard((context != null && context['config'] != null) ? context['config']['hideCategoryLastPost'] : null) ?
                "" :
                "\n<div component=\"topic/teaser\" class=\"teaser ps-5 ps-lg-0 col-lg-6 col-12 " + 
                  (guard((context != null && context['config'] != null && context['config']['theme'] != null) ? context['config']['theme']['mobileTopicTeasers'] : null) ?
                    "" :
                    "d-none d-lg-block") + 
                  "\">\n<div class=\"lastpost border-start border-2 lh-sm h-100\" style=\"border-color: " + 
                  __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['bgColor'] : null)) + 
                  "!important;\">\n" + 
                  iter(guard((context != null && context['categories'] != null && context['categories'][key0] != null) ? context['categories'][key0]['posts'] : null), function each(key1, index, length, value) {
                    var key = key1;
                    return "\n" + 
                      (index === 0 ?
                        "\n<div component=\"category/posts\" class=\"ps-2 text-xs d-flex flex-column h-100 gap-1\">\n<div class=\"text-nowrap text-truncate\">\n<a class=\"text-decoration-none avatar-tooltip\" title=\"" + 
                          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null && context['categories'][key0]['posts'][key1]['user'] != null) ? context['categories'][key0]['posts'][key1]['user']['displayname'] : null)) + 
                          "\" href=\"" + 
                          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
                          "/user/" + 
                          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null && context['categories'][key0]['posts'][key1]['user'] != null) ? context['categories'][key0]['posts'][key1]['user']['userslug'] : null)) + 
                          "\">" + 
                          __escape(helper(context, helpers, 'buildAvatar', [guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null) ? context['categories'][key0]['posts'][key1]['user'] : null), "18px", guard((context != null) ? context['true'] : null)])) + 
                          "</a>\n<a class=\"permalink text-muted timeago text-xs\" href=\"" + 
                          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
                          "/topic/" + 
                          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null && context['categories'][key0]['posts'][key1]['topic'] != null) ? context['categories'][key0]['posts'][key1]['topic']['slug'] : null)) + 
                          (guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null) ? context['categories'][key0]['posts'][key1]['index'] : null) ?
                            "/" + 
                              __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null) ? context['categories'][key0]['posts'][key1]['index'] : null)) :
                            "") + 
                          "\" title=\"" + 
                          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null) ? context['categories'][key0]['posts'][key1]['timestampISO'] : null)) + 
                          "\" aria-label=\"[[global:lastpost]]\"></a>\n</div>\n<div class=\"post-content text-xs text-break line-clamp-sm-2 lh-sm position-relative flex-fill\">\n<a class=\"stretched-link\" tabindex=\"-1\" href=\"" + 
                          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
                          "/topic/" + 
                          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null && context['categories'][key0]['posts'][key1]['topic'] != null) ? context['categories'][key0]['posts'][key1]['topic']['slug'] : null)) + 
                          (guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null) ? context['categories'][key0]['posts'][key1]['index'] : null) ?
                            "/" + 
                              __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null) ? context['categories'][key0]['posts'][key1]['index'] : null)) :
                            "") + 
                          "\" aria-label=\"[[global:lastpost]]\"></a>\n" + 
                          __escape(guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null && context['categories'][key0]['posts'][key1] != null) ? context['categories'][key0]['posts'][key1]['content'] : null)) + 
                          "\n</div>\n</div>\n" :
                        "") + 
                      "\n";
                  }, function alt() {
                    return "";
                  }) + 
                  "\n" + 
                  (guard((context != null && context['categories'] != null && context['categories'][key0] != null && context['categories'][key0]['posts'] != null) ? context['categories'][key0]['posts']['length'] : null) ?
                    "" :
                    "\n<div component=\"category/posts\" class=\"ps-2\">\n<div class=\"post-content overflow-hidden text-xs\">\n[[category:no-new-posts]]\n</div>\n</div>\n") + 
                  "\n</div>\n</div>\n") + 
              "\n</div>\n") + 
          "\n</li>\n";
      }, function alt() {
        return "";
      });
    },
    'pagination.pages': function paginationpages(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null && context['pagination'] != null) ? context['pagination']['pages'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n" + 
          (guard((context != null && context['pagination'] != null && context['pagination']['pages'] != null && context['pagination']['pages'][key0] != null) ? context['pagination']['pages'][key0]['separator'] : null) ?
            "\n<li component=\"pagination/select-page\" class=\"page-item page select-page\">\n<a class=\"page-link rounded fw-secondary px-3\" href=\"#\" aria-label=\"[[global:pagination.go-to-page]]\"><i class=\"fa fa-ellipsis-h\"></i></a>\n</li>\n" :
            "\n<li class=\"page-item page" + 
              (guard((context != null && context['pagination'] != null && context['pagination']['pages'] != null && context['pagination']['pages'][key0] != null) ? context['pagination']['pages'][key0]['active'] : null) ?
                " active" :
                "") + 
              "\" >\n<a class=\"page-link rounded fw-secondary px-3\" href=\"?" + 
              __escape(guard((context != null && context['pagination'] != null && context['pagination']['pages'] != null && context['pagination']['pages'][key0] != null) ? context['pagination']['pages'][key0]['qs'] : null)) + 
              "\" data-page=\"" + 
              __escape(guard((context != null && context['pagination'] != null && context['pagination']['pages'] != null && context['pagination']['pages'][key0] != null) ? context['pagination']['pages'][key0]['page'] : null)) + 
              "\" aria-label=\"[[global:pagination.page-x, " + 
              __escape(guard((context != null && context['pagination'] != null && context['pagination']['pages'] != null && context['pagination']['pages'][key0] != null) ? context['pagination']['pages'][key0]['page'] : null)) + 
              "]]\">" + 
              __escape(guard((context != null && context['pagination'] != null && context['pagination']['pages'] != null && context['pagination']['pages'][key0] != null) ? context['pagination']['pages'][key0]['page'] : null)) + 
              "</a>\n</li>\n") + 
          "\n";
      }, function alt() {
        return "";
      });
    },
    'widgets.sidebar': function widgetssidebar(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null && context['widgets'] != null) ? context['widgets']['sidebar'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n" + 
          guard((context != null && context['widgets'] != null && context['widgets']['sidebar'] != null && context['widgets']['sidebar'][key0] != null) ? context['widgets']['sidebar'][key0]['html'] : null) + 
          "\n";
      }, function alt() {
        return "";
      });
    },
    'widgets.footer': function widgetsfooter(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null && context['widgets'] != null) ? context['widgets']['footer'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n" + 
          guard((context != null && context['widgets'] != null && context['widgets']['footer'] != null && context['widgets']['footer'][key0] != null) ? context['widgets']['footer'][key0]['html'] : null) + 
          "\n";
      }, function alt() {
        return "";
      });
    }
  };

  return compiled;
})
