<div data-widget-area="header">
{{{each widgets.header}}}
{{widgets.header.html}}
{{{end}}}
</div>
<div class="row flex-fill">
<div class="tags {{{if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">
<h3 class="fw-semibold">[[pages:tags]]</h3>
{{{ if displayTagSearch }}}
{{{ if tags.length }}}
<div class="row justify-content-end mb-3">
<div class="col-lg-6">
<div class="d-flex justify-content-end">
<div>
<div class="input-group">
<input type="text" class="form-control form-control-sm" placeholder="[[global:search]]" id="tag-search">
<button class="btn btn-primary btn-sm" type="button">
<i class="fa fa-search"></i>
</button>
</div>
</div>
</div>
</div>
</div>
{{{ end }}}
{{{ end }}}
<hr/>
{{{ if !tags.length }}}
<div class="alert alert-warning">[[tags:no-tags]]</div>
{{{ end }}}
<div class="category">
<div class="tag-list row row-cols-2 row-cols-lg-4 row-cols-xl-5 gx-3 gy-2" data-nextstart="{nextStart}">
{{{each tags}}}
<div>
<a href="{config.relative_path}/tags/{./valueEncoded}" data-tag="{./valueEscaped}" class="btn btn-ghost ff-base d-flex flex-column gap-1 align-items-start justify-content-start text-truncate p-2">
<div class="fw-semibold text-nowrap tag-item w-100 text-start text-truncate">{./valueEscaped}</div>
<div class="text-xs text-muted text-nowrap tag-topic-count">[[global:x-topics, {txEscape(formattedNumber(./score))}]]</div>
</a>
</div>
{{{end}}}
</div>
</div>
</div>
<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
{{{ each widgets.sidebar }}}
{{widgets.sidebar.html}}
{{{ end }}}
</div>
</div>
<div data-widget-area="footer">
{{{each widgets.footer}}}
{{widgets.footer.html}}
{{{end}}}
</div>