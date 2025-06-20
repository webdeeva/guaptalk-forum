
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
    return (guard((context != null && context['breadcrumbs'] != null) ? context['breadcrumbs']['length'] : null) ?
        "\n<ol class=\"breadcrumb mb-0 " + 
          (guard((context != null && context['config'] != null && context['config']['theme'] != null) ? context['config']['theme']['centerHeaderElements'] : null) ?
            "justify-content-center" :
            "") + 
          "\" itemscope=\"itemscope\" itemprop=\"breadcrumb\" itemtype=\"http://schema.org/BreadcrumbList\">\n" + 
          compiled.blocks['breadcrumbs'](helpers, context, guard, iter, helper) + 
          "\n</ol>\n" :
        "") + 
      "\n<div class=\"d-flex flex-column flex-md-row\">\n<div class=\"flex-shrink-0 d-flex flex-column gap-3 border-end-md text-sm mb-3 pe-4\" style=\"flex-basis: 240px !important;\">\n<div class=\"d-grid gap-1\">\n<a class=\"btn btn-ghost btn-sm ff-secondary border d-flex gap-2 align-items-center\" href=\"" + 
      __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
      "/" + 
      __escape(guard((context != null) ? context['type_path'] : null)) + 
      "/" + 
      __escape(guard((context != null) ? context['targetId'] : null)) + 
      "\">\n<i class=\"fa fa-fw fa-external-link text-primary\"></i>\n[[flags:go-to-target]]\n</a>\n" + 
      (guard((context != null && context['target'] != null) ? context['target']['uid'] : null) ?
        "\n<div class=\"btn-group dropend\" data-uid=\"" + 
          __escape(guard((context != null && context['target'] != null) ? context['target']['uid'] : null)) + 
          "\">\n<button type=\"button\" class=\"btn btn-ghost btn-sm ff-secondary border d-flex gap-2 align-items-center dropdown-toggle\" data-bs-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n<i class=\"fa fa-fw fa-street-view text-primary\"></i>\n[[flags:flagged-user]]\n<i class=\"fa fa-chevron-right ms-auto text-secondary\"></i>\n</button>\n<ul class=\"dropdown-menu p-1 text-sm\" role=\"menu\">\n<li><a class=\"dropdown-item rounded-1\" href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/uid/" + 
          __escape(guard((context != null && context['target'] != null) ? context['target']['uid'] : null)) + 
          "\" role=\"menuitem\">[[flags:view-profile]]</a></li>\n" + 
          (guard((context != null && context['config'] != null) ? context['config']['disableChat'] : null) ?
            "" :
            "\n<li><a class=\"dropdown-item rounded-1\" href=\"#\" data-action=\"chat\" role=\"menuitem\">[[flags:start-new-chat]]</a></li>\n") + 
          "\n<li class=\"dropdown-divider\"></li>\n" + 
          (guard((context != null && context['privileges'] != null) ? context['privileges']['ban'] : null) ?
            "\n<li class=\"" + 
              (guard((context != null && context['target'] != null && context['target']['user'] != null) ? context['target']['user']['banned'] : null) ?
                "hidden" :
                "") + 
              "\"><a class=\"dropdown-item rounded-1\" href=\"#\" data-action=\"ban\" role=\"menuitem\">[[user:ban-account]]</a></li>\n<li class=\"" + 
              (guard((context != null && context['target'] != null && context['target']['user'] != null) ? context['target']['user']['banned'] : null) ?
                "" :
                "hidden") + 
              "\"><a class=\"dropdown-item rounded-1\" href=\"#\" data-action=\"unban\" role=\"menuitem\">[[user:unban-account]]</a></li>\n" :
            "") + 
          "\n" + 
          (guard((context != null && context['privileges'] != null) ? context['privileges']['mute'] : null) ?
            "\n<li class=\"" + 
              (guard((context != null && context['target'] != null && context['target']['user'] != null) ? context['target']['user']['muted'] : null) ?
                "hidden" :
                "") + 
              "\"><a class=\"dropdown-item rounded-1\" href=\"#\" data-action=\"mute\" role=\"menuitem\">[[user:mute-account]]</a></li>\n<li class=\"" + 
              (guard((context != null && context['target'] != null && context['target']['user'] != null) ? context['target']['user']['muted'] : null) ?
                "" :
                "hidden") + 
              "\"><a class=\"dropdown-item rounded-1\" href=\"#\" data-action=\"unmute\" role=\"menuitem\">[[user:unmute-account]]</a></li>\n" :
            "") + 
          "\n" + 
          (guard((context != null && context['privileges'] != null) ? context['privileges']['admin:users'] : null) ?
            "\n<li><a class=\"dropdown-item rounded-1\" href=\"#\" data-action=\"delete-account\" role=\"menuitem\">[[user:delete-account-as-admin]]</a></li>\n<li><a class=\"dropdown-item rounded-1\" href=\"#\" data-action=\"delete-content\" role=\"menuitem\">[[user:delete-content]]</a></li>\n<li><a class=\"dropdown-item rounded-1\" href=\"#\" data-action=\"delete-all\" role=\"menuitem\">[[user:delete-all]]</a></li>\n" :
            "") + 
          "\n</ul>\n</div>\n" :
        "") + 
      "\n<a class=\"btn btn-ghost btn-sm ff-secondary border d-flex gap-2 align-items-center\" href=\"#\" data-action=\"assign\">\n<i class=\"fa fa-fw fa-id-card-o text-primary\"></i>\n[[flags:assign-to-me]]\n</a>\n" + 
      (guard((context != null && context['type_bool'] != null) ? context['type_bool']['post'] : null) ?
        "\n" + 
          (guard((context != null && context['target'] != null) ? context['target']['deleted'] : null) ?
            "\n<a class=\"d-flex gap-2 align-items-center btn btn-sm btn-danger border border-secondary-subtle text-start\" href=\"#\" data-action=\"purge-post\"><i class=\"fa fa-fw fa-trash\"></i> [[flags:purge-post]]</a>\n<a class=\"d-flex gap-2 align-items-center btn btn-sm btn-outline-success border border-secondary-subtle text-start\" href=\"#\" data-action=\"restore-post\"><i class=\"fa fa-fw fa-reply\"></i><i class=\"fa fa-trash\"></i> [[flags:restore-post]]</a>\n" :
            "\n<a class=\"d-flex gap-2 align-items-center btn btn-sm btn-outline-danger border border-secondary-subtle text-start\" href=\"#\" data-action=\"delete-post\"><i class=\"fa fa-fw fa-trash\"></i> [[flags:delete-post]]</a>\n") + 
          "\n" :
        "") + 
      "\n</div>\n<form class=\"d-flex flex-column gap-3\" id=\"attributes\">\n<div>\n<label class=\"text-muted fw-semibold\" for=\"state\">[[flags:state]]</label>\n<select class=\"form-select form-select-sm\" id=\"state\" name=\"state\" disabled>\n<option value=\"open\">[[flags:state-open]]</option>\n<option value=\"wip\">[[flags:state-wip]]</option>\n<option value=\"resolved\">[[flags:state-resolved]]</option>\n<option value=\"rejected\">[[flags:state-rejected]]</option>\n</select>\n</div>\n<div>\n<label class=\"text-muted fw-semibold\" for=\"assignee\">[[flags:assignee]]</label>\n<select class=\"form-control form-control-sm\" id=\"assignee\" name=\"assignee\" disabled>\n<option value=\"\">[[flags:no-assignee]]</option>\n" + 
      compiled.blocks['assignees'](helpers, context, guard, iter, helper) + 
      "\n</select>\n</div>\n<div class=\"d-grid\">\n<button type=\"button\" class=\"btn btn-primary\" data-action=\"update\">[[flags:update]]</button>\n</div>\n</form>\n<div class=\"overflow-auto\" component=\"flag/history\" style=\"max-height: 30rem;\">\n<h2 class=\"h6 fw-bold\">[[flags:history]]</h2>\n" + 
      (guard((context != null && context['history'] != null) ? context['history']['length'] : null) ?
        "" :
        "\n<div class=\"alert alert-success text-center\">[[flags:no-history]]</div>\n") + 
      "\n" + 
      compiled.blocks['history'](helpers, context, guard, iter, helper) + 
      "\n</div>\n</div>\n<div class=\"flex-grow-1 ps-md-2 ps-lg-5\" style=\"min-width:0;\">\n<div class=\"d-flex flex-column gap-4\">\n<h2 class=\"h6 fw-bold\">\n" + 
      __escape(guard((context != null) ? context['target_readable'] : null)) + 
      "\n</h2>\n<div component=\"flag/content\" class=\"d-flex flex-column gap-1 pb-3 border-bottom\">\n" + 
      (guard((context != null && context['type_bool'] != null) ? context['type_bool']['post'] : null) ?
        "\n<div class=\"d-flex gap-2 align-items-center\">\n<a class=\"d-flex text-decoration-none\" href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/user/" + 
          __escape(guard((context != null && context['target'] != null && context['target']['user'] != null) ? context['target']['user']['userslug'] : null)) + 
          "\">" + 
          __escape(helper(context, helpers, 'buildAvatar', [guard((context != null && context['target'] != null) ? context['target']['user'] : null), "16px", guard((context != null) ? context['true'] : null)])) + 
          "</a>\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/user/" + 
          __escape(guard((context != null && context['target'] != null && context['target']['user'] != null) ? context['target']['user']['userslug'] : null)) + 
          "\">" + 
          __escape(guard((context != null && context['target'] != null && context['target']['user'] != null) ? context['target']['user']['username'] : null)) + 
          "</a>\n<span class=\"timeago text-muted\" title=\"" + 
          __escape(guard((context != null && context['target'] != null) ? context['target']['timestampISO'] : null)) + 
          "\"></span>\n</div>\n<blockquote>" + 
          __escape(guard((context != null && context['target'] != null) ? context['target']['content'] : null)) + 
          "</blockquote>\n" :
        "") + 
      "\n" + 
      (guard((context != null && context['type_bool'] != null) ? context['type_bool']['user'] : null) ?
        "\n<div class=\"d-flex gap-2 align-items-center lh-1 mb-2\">\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/user/" + 
          __escape(guard((context != null && context['target'] != null) ? context['target']['userslug'] : null)) + 
          "\">" + 
          __escape(helper(context, helpers, 'buildAvatar', [guard((context != null) ? context['target'] : null), "16px", guard((context != null) ? context['true'] : null)])) + 
          "</a>\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/user/" + 
          __escape(guard((context != null && context['target'] != null) ? context['target']['userslug'] : null)) + 
          "\">" + 
          __escape(guard((context != null && context['target'] != null) ? context['target']['username'] : null)) + 
          "</a>\n</div>\n<blockquote>" + 
          (guard((context != null && context['target'] != null) ? context['target']['aboutme'] : null) ?
            __escape(guard((context != null && context['target'] != null) ? context['target']['aboutme'] : null)) :
            "<em>[[flags:target-aboutme-empty]]</em>") + 
          "</blockquote>\n" :
        "") + 
      "\n" + 
      (guard((context != null && context['type_bool'] != null) ? context['type_bool']['empty'] : null) ?
        "\n<div class=\"alert alert-warning\" role=\"alert\">[[flags:target-purged]]</div>\n" :
        "") + 
      "\n</div>\n<div class=\"flag/reports\" class=\"pb-4 border-bottom\">\n<h2 class=\"h6 fw-bold\">[[flags:reports]]</h2>\n<ul class=\"list-unstyled mt-4\">\n" + 
      compiled.blocks['reports'](helpers, context, guard, iter, helper) + 
      "\n</ul>\n</div>\n<div class=\"pb-4 border-bottom\">\n<div class=\"d-flex align-items-center\">\n<h2 class=\"h6 fw-bold me-auto mb-0\">[[flags:notes]]</h2>\n<button class=\"btn btn-ghost ff-secondary border\" data-action=\"addEditNote\">[[flags:add-note]]</button>\n</div>\n<ul component=\"flag/notes\" class=\"list-unstyled mt-4\">\n" + 
      (guard((context != null && context['notes'] != null) ? context['notes']['length'] : null) ?
        "" :
        "\n<em>[[flags:no-notes]]</em>\n") + 
      "\n" + 
      compiled.blocks['notes'](helpers, context, guard, iter, helper) + 
      "\n</ul>\n</div>\n</div>\n</div>\n</div>";
  }

  compiled.blocks = {
    'breadcrumbs': function breadcrumbs(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null) ? context['breadcrumbs'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n<li" + 
          (index === length - 1 ?
            " component=\"breadcrumb/current\"" :
            "") + 
          " itemscope=\"itemscope\" itemprop=\"itemListElement\" itemtype=\"http://schema.org/ListItem\" class=\"breadcrumb-item " + 
          (index === length - 1 ?
            "active" :
            "") + 
          "\">\n<meta itemprop=\"position\" content=\"" + 
          __escape(helper(context, helpers, 'increment', [index, "1"])) + 
          "\" />\n" + 
          (guard((context != null && context['breadcrumbs'] != null && context['breadcrumbs'][key0] != null) ? context['breadcrumbs'][key0]['url'] : null) ?
            "<a href=\"" + 
              __escape(guard((context != null && context['breadcrumbs'] != null && context['breadcrumbs'][key0] != null) ? context['breadcrumbs'][key0]['url'] : null)) + 
              "\" itemprop=\"item\">" :
            "") + 
          "\n<span class=\"fw-semibold\" itemprop=\"name\">" + 
          __escape(guard((context != null && context['breadcrumbs'] != null && context['breadcrumbs'][key0] != null) ? context['breadcrumbs'][key0]['text'] : null)) + 
          "</span>\n" + 
          (guard((context != null && context['breadcrumbs'] != null && context['breadcrumbs'][key0] != null) ? context['breadcrumbs'][key0]['url'] : null) ?
            "</a>" :
            "") + 
          "\n</li>\n";
      }, function alt() {
        return "";
      });
    },
    'assignees': function assignees(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null) ? context['assignees'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n<option value=\"" + 
          __escape(guard((context != null && context['assignees'] != null && context['assignees'][key0] != null) ? context['assignees'][key0]['uid'] : null)) + 
          "\">" + 
          __escape(guard((context != null && context['assignees'] != null && context['assignees'][key0] != null) ? context['assignees'][key0]['username'] : null)) + 
          "</option>\n";
      }, function alt() {
        return "";
      });
    },
    'history': function history(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null) ? context['history'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n<div class=\"d-flex flex-column gap-1\">\n<div class=\"d-flex gap-2 align-items-center\">\n<a class=\"d-flex text-decoration-none\" href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/user/" + 
          __escape(guard((context != null && context['history'] != null && context['history'][key0] != null && context['history'][key0]['user'] != null) ? context['history'][key0]['user']['userslug'] : null)) + 
          "\">" + 
          __escape(helper(context, helpers, 'buildAvatar', [guard((context != null && context['history'] != null && context['history'][key0] != null) ? context['history'][key0]['user'] : null), "16px", guard((context != null) ? context['true'] : null)])) + 
          "</a>\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/user/" + 
          __escape(guard((context != null && context['history'] != null && context['history'][key0] != null && context['history'][key0]['user'] != null) ? context['history'][key0]['user']['userslug'] : null)) + 
          "\">" + 
          __escape(guard((context != null && context['history'] != null && context['history'][key0] != null && context['history'][key0]['user'] != null) ? context['history'][key0]['user']['username'] : null)) + 
          "</a>\n<span class=\"timeago text-muted text-nowrap\" title=\"" + 
          __escape(guard((context != null && context['history'] != null && context['history'][key0] != null) ? context['history'][key0]['datetimeISO'] : null)) + 
          "\"></span>\n</div>\n<div>\n<ul class=\"list-unstyled\">\n" + 
          iter(guard((context != null && context['history'] != null && context['history'][key0] != null) ? context['history'][key0]['fields'] : null), function each(key1, index, length, value) {
            var key = key1;
            return "\n<li>\n[[flags:" + 
              __escape(key) + 
              "]]" + 
              (guard(value) ?
                " &rarr; <span class=\"fw-semibold\">" + 
                  __escape(guard(value)) + 
                  "</span>" :
                "") + 
              "\n</li>\n";
          }, function alt() {
            return "";
          }) + 
          "\n" + 
          iter(guard((context != null && context['history'] != null && context['history'][key0] != null) ? context['history'][key0]['meta'] : null), function each(key1, index, length, value) {
            var key = key1;
            return "\n<li>\n" + 
              guard((context != null && context['history'] != null && context['history'][key0] != null && context['history'][key0]['meta'] != null && context['history'][key0]['meta'][key1] != null) ? context['history'][key0]['meta'][key1]['key'] : null) + 
              (guard((context != null && context['history'] != null && context['history'][key0] != null && context['history'][key0]['meta'] != null && context['history'][key0]['meta'][key1] != null) ? context['history'][key0]['meta'][key1]['value'] : null) ?
                " &rarr; <span class=\"fw-semibold\">" + 
                  __escape(guard((context != null && context['history'] != null && context['history'][key0] != null && context['history'][key0]['meta'] != null && context['history'][key0]['meta'][key1] != null) ? context['history'][key0]['meta'][key1]['value'] : null)) + 
                  "</span>" :
                "") + 
              "\n</li>\n";
          }, function alt() {
            return "";
          }) + 
          "\n</ul>\n</div>\n</div>\n";
      }, function alt() {
        return "";
      });
    },
    'reports': function reports(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null) ? context['reports'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n<li class=\"d-flex flex-column gap-1\" component=\"flag/report\" data-timestamp=\"" + 
          __escape(guard((context != null && context['reports'] != null && context['reports'][key0] != null) ? context['reports'][key0]['timestamp'] : null)) + 
          "\">\n<div class=\"d-flex gap-2 align-items-center\">\n<a class=\"d-flex text-decoration-none\" href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/user/" + 
          __escape(guard((context != null && context['reports'] != null && context['reports'][key0] != null && context['reports'][key0]['reporter'] != null) ? context['reports'][key0]['reporter']['userslug'] : null)) + 
          "\">" + 
          __escape(helper(context, helpers, 'buildAvatar', [guard((context != null && context['reports'] != null && context['reports'][key0] != null) ? context['reports'][key0]['reporter'] : null), "16px", guard((context != null) ? context['true'] : null)])) + 
          "</a>\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/user/" + 
          __escape(guard((context != null && context['reports'] != null && context['reports'][key0] != null && context['reports'][key0]['reporter'] != null) ? context['reports'][key0]['reporter']['userslug'] : null)) + 
          "\">" + 
          __escape(guard((context != null && context['reports'] != null && context['reports'][key0] != null && context['reports'][key0]['reporter'] != null) ? context['reports'][key0]['reporter']['username'] : null)) + 
          "</a>\n<span class=\"timeago text-muted\" title=\"" + 
          __escape(guard((context != null && context['reports'] != null && context['reports'][key0] != null) ? context['reports'][key0]['timestampISO'] : null)) + 
          "\"></span>\n</div>\n<p>" + 
          __escape(guard((context != null && context['reports'] != null && context['reports'][key0] != null) ? context['reports'][key0]['value'] : null)) + 
          "</p>\n</li>\n";
      }, function alt() {
        return "";
      });
    },
    'notes': function notes(helpers, context, guard, iter, helper) {
      var __escape = helpers.__escape;
      var value = context;
      return iter(guard((context != null) ? context['notes'] : null), function each(key0, index, length, value) {
        var key = key0;
        return "\n<li class=\"d-flex flex-column gap-1\" component=\"flag/note\" data-datetime=\"" + 
          __escape(guard((context != null && context['notes'] != null && context['notes'][key0] != null) ? context['notes'][key0]['datetime'] : null)) + 
          "\" data-index=\"" + 
          __escape(index) + 
          "\">\n<div class=\"d-flex gap-2 align-items-center\">\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/user/" + 
          __escape(guard((context != null && context['notes'] != null && context['notes'][key0] != null && context['notes'][key0]['user'] != null) ? context['notes'][key0]['user']['userslug'] : null)) + 
          "\">" + 
          __escape(helper(context, helpers, 'buildAvatar', [guard((context != null && context['notes'] != null && context['notes'][key0] != null) ? context['notes'][key0]['user'] : null), "16px", guard((context != null) ? context['true'] : null)])) + 
          "</a>\n<a href=\"" + 
          __escape(guard((context != null && context['config'] != null) ? context['config']['relative_path'] : null)) + 
          "/user/" + 
          __escape(guard((context != null && context['notes'] != null && context['notes'][key0] != null && context['notes'][key0]['user'] != null) ? context['notes'][key0]['user']['userslug'] : null)) + 
          "\">" + 
          __escape(guard((context != null && context['notes'] != null && context['notes'][key0] != null && context['notes'][key0]['user'] != null) ? context['notes'][key0]['user']['username'] : null)) + 
          "</a>\n<span class=\"timeago text-muted\" title=\"" + 
          __escape(guard((context != null && context['notes'] != null && context['notes'][key0] != null) ? context['notes'][key0]['datetimeISO'] : null)) + 
          "\"></span>\n<div class=\" ms-auto flex-shrink-0\">\n<a href=\"#\" class=\"btn btn-sm btn-link\" data-action=\"addEditNote\"><i class=\"fa fa-pencil\"></i></a>\n<a href=\"#\" class=\"btn btn-sm btn-link\" data-action=\"delete-note\"><i class=\"fa fa-trash text-danger\"></i></a>\n</div>\n</div>\n<p>" + 
          __escape(guard((context != null && context['notes'] != null && context['notes'][key0] != null) ? context['notes'][key0]['content'] : null)) + 
          "</p>\n</li>\n";
      }, function alt() {
        return "";
      });
    }
  };

  return compiled;
})
