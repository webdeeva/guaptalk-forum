{{{ if (!./index && widgets.mainpost-header.length) }}}
<div data-widget-area="mainpost-header">
{{{ each widgets.mainpost-header }}}
{widgets.mainpost-header.html}
{{{ end }}}
</div>
{{{ end }}}
{{{ if (./parent && !hideParent) }}}
<div component="post/parent" data-collapsed="true" data-parent-pid="{./parent.pid}" data-uid="{./parent.uid}" class="btn btn-ghost btn-sm d-flex gap-2 text-start flex-row mb-2" style="font-size: 13px;">
<div class="d-flex gap-2 text-nowrap">
<div class="d-flex flex-nowrap gap-1 align-items-center">
<a href="{config.relative_path}/user/{./parent.user.userslug}" class="text-decoration-none lh-1">{buildAvatar(./parent.user, "16px", true, "not-responsive align-middle")}</a>
<a class="fw-semibold text-truncate" style="max-width: 150px;" href="{config.relative_path}/user/{./parent.user.userslug}">{./parent.user.displayname}</a>
</div>
<a href="{config.relative_path}/post/{encodeURIComponent(./parent.pid)}" class="text-muted timeago text-nowrap hidden" title="{./parent.timestampISO}"></a>
</div>
<div component="post/parent/content" class="text-muted line-clamp-1 text-break w-100">{./parent.content}</div>
</div>
{{{ end }}}
<div class="d-flex align-items-start gap-3 post-container-parent">
<div class="bg-body d-none d-sm-block rounded-circle" style="outline: 2px solid var(--bs-body-bg);">
<a class="d-inline-block position-relative text-decoration-none" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}" aria-label="[[aria:profile-page-for, {./user.displayname}]]">
{buildAvatar(posts.user, "48px", true, "", "user/picture")}
{{{ if ./user.isLocal }}}
<span component="user/status" class="position-absolute top-100 start-100 border border-white border-2 rounded-circle status {posts.user.status}"><span class="visually-hidden">[[global:{posts.user.status}]]</span></span>
{{{ else }}}
<span component="user/locality" class="position-absolute top-100 start-100 lh-1 border border-white border-2 rounded-circle small" title="[[global:remote-user]]">
<span class="visually-hidden">[[global:remote-user]]</span>
<i class="fa fa-globe"></i>
</span>
{{{ end }}}
</a>
</div>
<div class="post-container d-flex gap-2 flex-grow-1 flex-column w-100" style="min-width:0;">
<div class="d-flex align-items-start justify-content-between gap-1 flex-nowrap w-100 post-header" itemprop="author" itemscope itemtype="https://schema.org/Person">
<div class="d-flex gap-1 flex-wrap align-items-center text-truncate">
<meta itemprop="name" content="{./user.displayname}">
{{{ if ./user.userslug }}}<meta itemprop="url" content="{config.relative_path}/user/{./user.userslug}">{{{ end }}}
<div class="d-flex flex-nowrap gap-1 align-items-center text-truncate">
<div class="bg-body d-sm-none">
<a class="d-inline-block position-relative text-decoration-none" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
{buildAvatar(posts.user, "20px", true, "", "user/picture")}
{{{ if ./user.isLocal }}}
<span component="user/status" class="position-absolute top-100 start-100 border border-white border-2 rounded-circle status {posts.user.status}"><span class="visually-hidden">[[global:{posts.user.status}]]</span></span>
{{{ else }}}
<span component="user/locality" class="position-absolute top-100 start-100 lh-1 border border-white border-2 rounded-circle small" title="[[global:remote-user]]">
<span class="visually-hidden">[[global:remote-user]]</span>
<i class="fa fa-globe"></i>
</span>
{{{ end }}}
</a>
</div>
<a class="fw-bold text-nowrap text-truncate" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.displayname}</a>
</div>
{{{ each posts.user.selectedGroups }}}
{{{ if posts.user.selectedGroups.slug }}}
<a href="{config.relative_path}/groups/{./slug}" class="badge rounded-1 text-uppercase text-truncate text-decoration-none" style="max-width: 150px;color:{./textColor};background-color: {./labelColor};"><i class="fa {{{ if ./icon }}}{./icon}{{{ if ./userTitle}}} me-1{{{ end }}}{{{else}}}hidden{{{ end }}}"></i><span class="badge-text align-text-bottom">{{{ if ./userTitle }}}{./userTitle}{{{ end }}}</span></a>
{{{ end }}}
{{{ end }}}
{{{ if posts.user.banned }}}
<span class="badge bg-danger rounded-1">[[user:banned]]</span>
{{{ end }}}
<div class="d-flex gap-1 align-items-center">
<span class="text-muted">{generateWrote(@value, config.timeagoCutoff)}</span>
<i component="post/edit-indicator" class="fa fa-edit text-muted{{{ if privileges.posts:history }}} pointer{{{ end }}} edit-icon {{{ if !posts.editor.username }}}hidden{{{ end }}}" title="[[global:edited-timestamp, {isoTimeToLocaleString(./editedISO, config.userLang)}]]"></i>
<span data-editor="{posts.editor.userslug}" component="post/editor" class="visually-hidden">[[global:last-edited-by, {posts.editor.username}]] <span class="timeago" title="{isoTimeToLocaleString(posts.editedISO, config.userLang)}"></span></span>
</div>
{{{ if posts.user.custom_profile_info.length }}}
<div>
<span>
&#124;
{{{ each posts.user.custom_profile_info }}}
{posts.user.custom_profile_info.content}
{{{ end }}}
</span>
</div>
{{{ end }}}
</div>
<div class="d-flex align-items-center gap-1 justify-content-end">
<span class="bookmarked opacity-0 text-primary"><i class="fa fa-bookmark-o"></i></span>
<a href="{config.relative_path}/post/{encodeURIComponent(./pid)}" class="post-index text-muted d-none d-md-inline">#{increment(./index, "1")}</a>
</div>
</div>
<div class="content text-break" component="post/content" itemprop="text">
{posts.content}
</div>
<div component="post/footer" class="post-footer border-bottom pb-2">
{{{ if posts.user.signature }}}
<div component="post/signature" data-uid="{posts.user.uid}" class="text-xs text-muted mt-2">{posts.user.signature}</div>
{{{ end }}}
<div class="d-flex flex-wrap-reverse gap-2 {{{ if (hideReplies || !posts.replies.count) }}}justify-content-end{{{ else }}}justify-content-between{{{ end }}}">
{{{ if !hideReplies }}}
<a component="post/reply-count" data-target-component="post/replies/container" href="#" class="d-flex gap-2 align-items-center btn btn-ghost ff-secondary border rounded-1 p-1 text-muted text-decoration-none text-xs {{{ if (!./replies || shouldHideReplyContainer(@value)) }}}hidden{{{ end }}}">
<span component="post/reply-count/avatars" class="d-flex gap-1 {{{ if posts.replies.hasMore }}}hasMore{{{ end }}}">
{{{each posts.replies.users}}}
<span>{buildAvatar(posts.replies.users, "20px", true, "avatar-tooltip")}</span>
{{{end}}}
{{{ if posts.replies.hasMore}}}
<span style="height: 20px; line-height: 20px;"><i class="fa fa-ellipsis"></i></span>
{{{ end }}}
</span>
<span class="ms-2 replies-count fw-semibold text-nowrap" component="post/reply-count/text" data-replies="{posts.replies.count}">{posts.replies.text}</span>
<span class="ms-2 replies-last hidden-xs fw-semibold">[[topic:last-reply-time]] <span class="timeago" title="{posts.replies.timestampISO}"></span></span>
<i class="fa fa-fw fa-chevron-down" component="post/replies/open"></i>
</a>
{{{ end }}}
<div component="post/actions" class="d-flex flex-grow-1 align-items-center justify-content-end gap-1 post-tools">
<!-- This partial intentionally left blank; overwritten by nodebb-plugin-reactions -->
<a component="post/reply" href="#" class="btn btn-ghost btn-sm {{{ if !privileges.topics:reply }}}hidden{{{ end }}}" title="[[topic:reply]]"><i class="fa fa-fw fa-reply text-primary"></i></a>
<a component="post/quote" href="#" class="btn btn-ghost btn-sm {{{ if !privileges.topics:reply }}}hidden{{{ end }}}" title="[[topic:quote]]"><i class="fa fa-fw fa-quote-right text-primary"></i></a>
{{{ if ./announces }}}
<a component="post/announce-count" href="#" class="btn btn-ghost btn-sm d-flex gap-2 align-items-center" title="[[topic:announcers]]"><i class="fa fa-share-alt text-primary"></i> {./announces}</a>
{{{ end }}}
{{{ if !reputation:disabled }}}
<div class="d-flex votes align-items-center">
<a component="post/upvote" href="#" class="btn btn-ghost btn-sm{{{ if posts.upvoted }}} upvoted{{{ end }}}" title="[[topic:upvote-post]]">
<i class="fa fa-fw fa-chevron-up text-primary"></i>
</a>
<meta itemprop="upvoteCount" content="{posts.upvotes}">
<meta itemprop="downvoteCount" content="{posts.downvotes}">
<a href="#" class="px-2 mx-1 btn btn-ghost btn-sm" component="post/vote-count" data-votes="{posts.votes}" title="[[global:voters]]">{posts.votes}</a>
{{{ if !downvote:disabled }}}
<a component="post/downvote" href="#" class="btn btn-ghost btn-sm{{{ if posts.downvoted }}} downvoted{{{ end }}}" title="[[topic:downvote-post]]">
<i class="fa fa-fw fa-chevron-down text-primary"></i>
</a>
{{{ end }}}
</div>
{{{ end }}}
<span component="post/tools" class="dropdown bottom-sheet {{{ if !./display_post_menu }}}hidden{{{ end }}}">
<a class="btn btn-ghost btn-sm ff-secondary dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="[[topic:post-tools]]"><i class="fa fa-fw fa-ellipsis-v text-primary"></i></a>
<ul class="dropdown-menu dropdown-menu-end p-1 text-sm" role="menu"></ul>
</span>
</div>
</div>
<div component="post/replies/container" class="my-2 col-11 border rounded-1 p-3 hidden-empty"></div>
</div>
</div>
</div>
{{{ if (!./index && widgets.mainpost-footer.length) }}}
<div data-widget-area="mainpost-footer">
{{{ each widgets.mainpost-footer }}}
{widgets.mainpost-footer.html}
{{{ end }}}
</div>
{{{ end }}}