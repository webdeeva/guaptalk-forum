<div>
<ul class="top_topics list-unstyled d-flex flex-column">
{{{ each topics }}}
<li class="widget-topics">
<div class="d-flex flex-column gap-2">
<a class="topic-title fw-semibold fs-6 text-reset text-break d-block" href="{relative_path}/topic/{./slug}">{./title}</a>
<div class="d-flex gap-2 align-items-center text-sm">
<a class="text-decoration-none avatar-tooltip" title="{./user.displayname}" href="{{{ if ./teaser.user.userslug }}}{relative_path}/user/{./teaser.user.userslug}{{{ else }}}#{{{ end }}}">
{buildAvatar(./teaser.user, "24px", true)}
</a>
<div class="post-author d-flex align-items-center gap-1">
<a class="lh-1 fw-semibold text-nowrap" href="{config.relative_path}/user/{./teaser.user.userslug}">{./teaser.user.displayname}</a>
</div>
<span class="timeago text-muted lh-1 text-nowrap" title="{./teaser.timestampISO}"></span>
</div>
<div class="d-flex justify-content-between">
<div class="btn btn-link btn-sm text-body pe-none"><i class="fa-fw fa-heart text-xs fa-regular text-muted"></i> {humanReadableNumber(./votes)}</div>
<div class="btn btn-link btn-sm text-body pe-none"><i class="fa-fw fa-regular fa-message text-xs text-muted"></i> {humanReadableNumber(./postcount)}</div>
<div class="btn btn-link btn-sm text-body pe-none"><i class="fa-fw fa-regular fa-eye text-xs text-muted"></i> {humanReadableNumber(./viewcount)}</div>
</div>
</div>
{{{ if !@last}}}
<hr/>
{{{ end }}}
</li>
{{{ end }}}
</ul>
</div>