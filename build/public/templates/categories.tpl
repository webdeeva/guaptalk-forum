<!-- Guaptalk Hero Section -->
<div class="hero-section">
<div class="hero-container">
<div class="hero-content">
<div class="hero-text">
<h1 class="hero-title">Welcome to Guaptalk Community</h1>
<p class="hero-subtitle">Where authentic conversations create lasting connections</p>
<div class="hero-actions">
{{{ if !loggedIn }}}
<a href="{config.relative_path}/register" class="btn btn-primary btn-lg hero-btn">
<i class="fa fa-user-plus"></i> Join the Community
</a>
<a href="{config.relative_path}/login" class="btn btn-outline-primary btn-lg hero-btn">
<i class="fa fa-sign-in"></i> Sign In
</a>
{{{ else }}}
<a href="{config.relative_path}/recent" class="btn btn-primary btn-lg hero-btn">
<i class="fa fa-comments"></i> View Recent Discussions
</a>
<a href="{config.relative_path}/compose" class="btn btn-outline-primary btn-lg hero-btn">
<i class="fa fa-pencil"></i> Start a Topic
</a>
{{{ end }}}
</div>
</div>
<div class="hero-image">
<img src="{config.relative_path}/uploads/people.png" alt="Guaptalk Community" />
</div>
</div>
</div>
</div>
<div data-widget-area="header">
{{{ each widgets.header }}}
{{widgets.header.html}}
{{{ end }}}
</div>
<div class="row flex-fill py-2">
<div class="{{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">
{{{ if pagination.pages.length }}}
<div><div component="category-selector" class="btn-group dropdown-left category-dropdown-container bottom-sheet">
<button type="button" class="btn btn-ghost btn-sm ff-secondary d-flex align-items-center gap-2 dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<span component="category-selector-selected">
{{{ if (selectedCategory && !showCategorySelectLabel) }}}
<span class="category-item d-inline-flex align-items-center gap-1">
{buildCategoryIcon(selectedCategory, "24px", "rounded-circle")}
<span class="fw-semibold">{selectedCategory.name}</span>
</span>
{{{ else }}}
<i class="fa fa-fw {{{ if selectCategoryIcon }}}{selectCategoryIcon}{{{ else }}}fa-list{{{ end }}} text-primary"></i>
<span class="visible-md-inline visible-lg-inline fw-semibold">{{{ if selectCategoryLabel }}}{selectCategoryLabel}{{{ else }}}[[topic:thread-tools.select-category]]{{{ end }}}</span>
{{{ end }}}
</span>
</button>
<div class="dropdown-menu p-1">
<div component="category-selector-search" class="p-1 hidden">
<input type="text" class="form-control form-control-sm" placeholder="[[search:type-to-search]]" autocomplete="off">
<hr class="mt-2 mb-0"/>
</div>
<ul component="category/list" class="list-unstyled mb-0 text-sm category-dropdown-menu ghost-scrollbar" role="menu">
<li component="category/no-matches" role="presentation" class="category hidden">
<a class="dropdown-item rounded-1" role="menuitem">[[search:no-matches]]</a>
</li>
{{{ each categoryItems }}}
<li role="presentation" class="category {{{ if ./disabledClass }}}disabled {{{ end }}}" data-cid="{./cid}" data-name="{./name}" data-parent-cid="{./parentCid}">
<a class="dropdown-item rounded-1 {{{ if ./disabledClass }}}disabled{{{ end }}}" role="menuitem" href="#">{./level}
<span component="category-markup" style="{{{ if ./match }}}font-weight: bold;{{{end}}}">
<div class="category-item d-inline-flex align-items-center gap-1">
{{{ if ./icon }}}
{buildCategoryIcon(@value, "24px", "rounded-circle")}
{{{ end }}}
{./name}
</div>
</span>
</a>
</li>
{{{ end }}}
</ul>
</div>
</div></div>
{{{ end }}}
<ul class="categories-list list-unstyled" itemscope itemtype="http://www.schema.org/ItemList">
{{{ each categories }}}
<li component="categories/category" data-cid="{./cid}" class="w-100 border-bottom py-3 py-lg-4 gap-lg-0 gap-2 d-flex flex-column flex-lg-row align-items-start category-{./cid} {./unread-class}">
<meta itemprop="name" content="{./name}">
<div class="d-flex col-lg-7 gap-2 gap-lg-3">
<div class="flex-shrink-0">
{buildCategoryIcon(@value, "40px", "rounded-1")}
</div>
<div class="flex-grow-1 d-flex flex-wrap gap-1 me-0 me-lg-2">
<h2 class="title text-break fs-4 fw-semibold m-0 tracking-tight w-100">
{{{ if ./isSection }}}
{./name}
{{{ else }}}
<a class="text-reset" href="{{{ if ./link }}}{./link}{{{ else }}}{config.relative_path}/category/{./slug}{{{ end }}}" itemprop="url">{../name}</a>
{{{ end }}}
</h2>
{{{ if ./descriptionParsed }}}
<div class="description text-muted text-sm w-100 line-clamp-sm-5">
{./descriptionParsed}
</div>
{{{ end }}}
{{{ if !./link }}}
<div class="d-flex gap-1 d-block d-lg-none w-100">
<span class="badge text-body border stats text-xs text-muted">
<i class="fa fa-fw fa-list"></i>
<span class="fw-normal">{humanReadableNumber(./totalTopicCount, 0)}</span>
</span>
<span class="badge text-body border stats text-xs text-muted">
<i class="fa-regular fa-fw fa-message"></i>
<span class="fw-normal">{humanReadableNumber(./totalPostCount, 0)}</span>
</span>
{{{ if ./teaser }}}
<a href="{config.relative_path}{./teaser.url}" class="border badge bg-transparent text-muted fw-normal timeago {{{ if (!./teaser.timestampISO || config.theme.mobileTopicTeasers) }}}hidden{{{ end }}}" title="{./teaser.timestampISO}"></a>
{{{ end }}}
</div>
{{{ end }}}
{{{ if !config.hideSubCategories }}}
{{{ if ./children.length }}}
<ul class="list-unstyled category-children row row-cols-1 row-cols-md-2 g-2 my-1 w-100">
{{{ each ./children }}}
{{{ if !./isSection }}}
<li data-cid="{./cid}" class="category-children-item small">
<div class="d-flex gap-1">
<i class="fa fa-fw fa-caret-right text-primary" style="line-height: var(--bs-body-line-height);"></i>
<a href="{{{ if ./link }}}{./link}{{{ else }}}{config.relative_path}/category/{./slug}{{{ end }}}" class="text-reset fw-semibold">{./name}</a>
</div>
</li>
{{{ end }}}
{{{ end }}}
</ul>
{{{ end }}}
{{{ end }}}
</div>
</div>
{{{ if !./link }}}
<div class="d-flex col-lg-5 col-12 align-content-stretch">
<div class="meta stats d-none d-lg-grid col-6 gap-1 pe-2 text-muted" style="grid-template-columns: 1fr 1fr;">
<div class="card card-header border-0 p-2 overflow-hidden rounded-1 d-flex flex-column align-items-center">
<span class="fs-5 ff-secondary lh-1" title="{./totalTopicCount}">{humanReadableNumber(./totalTopicCount, 0)}</span>
<span class="d-none d-xl-flex text-lowercase text-xs">[[global:topics]]</span>
<i class="d-xl-none fa fa-fw text-xs text-muted opacity-75 fa-list"></i>
</div>
<div class="card card-header border-0 p-2 overflow-hidden rounded-1 d-flex flex-column align-items-center">
<span class="fs-5 ff-secondary lh-1" title="{./totalPostCount}">{humanReadableNumber(./totalPostCount, 0)}</span>
<span class="d-none d-xl-flex text-lowercase text-xs">[[global:posts]]</span>
<i class="d-xl-none fa-regular fa-fw text-xs text-muted opacity-75 fa-message"></i>
</div>
</div>
{{{ if !config.hideCategoryLastPost }}}
<div component="topic/teaser" class="teaser ps-5 ps-lg-0 col-lg-6 col-12 {{{ if !config.theme.mobileTopicTeasers }}}d-none d-lg-block{{{ end }}}">
<div class="lastpost border-start border-2 lh-sm h-100" style="border-color: {./bgColor}!important;">
{{{ each ./posts }}}
{{{ if @first }}}
<div component="category/posts" class="ps-2 text-xs d-flex flex-column h-100 gap-1">
<div class="text-nowrap text-truncate">
<a class="text-decoration-none avatar-tooltip" title="{./user.displayname}" href="{config.relative_path}/user/{./user.userslug}">{buildAvatar(posts.user, "18px", true)}</a>
<a class="permalink text-muted timeago text-xs" href="{config.relative_path}/topic/{./topic.slug}{{{ if ./index }}}/{./index}{{{ end }}}" title="{./timestampISO}" aria-label="[[global:lastpost]]"></a>
</div>
<div class="post-content text-xs text-break line-clamp-sm-2 lh-sm position-relative flex-fill">
<a class="stretched-link" tabindex="-1" href="{config.relative_path}/topic/{./topic.slug}{{{ if ./index }}}/{./index}{{{ end }}}" aria-label="[[global:lastpost]]"></a>
{./content}
</div>
</div>
{{{ end }}}
{{{ end }}}
{{{ if !./posts.length }}}
<div component="category/posts" class="ps-2">
<div class="post-content overflow-hidden text-xs">
[[category:no-new-posts]]
</div>
</div>
{{{ end }}}
</div>
</div>
{{{ end }}}
</div>
{{{ end }}}
</li>
{{{ end }}}
</ul>
<nav component="pagination" class="pagination-container mt-3{{{ if !pagination.pages.length }}} hidden{{{ end }}}" aria-label="[[global:pagination]]">
<ul class="pagination pagination-sm gap-1 hidden-xs hidden-sm justify-content-center">
<li class="page-item previous {{{ if !pagination.prev.active }}} disabled{{{ end }}}">
<a class="page-link rounded fw-secondary px-3" href="?{pagination.prev.qs}" data-page="{pagination.prev.page}" aria-label="[[global:pagination.previouspage]]"><i class="fa fa-chevron-left"></i> </a>
</li>
{{{each pagination.pages}}}
{{{ if ./separator }}}
<li component="pagination/select-page" class="page-item page select-page">
<a class="page-link rounded fw-secondary px-3" href="#" aria-label="[[global:pagination.go-to-page]]"><i class="fa fa-ellipsis-h"></i></a>
</li>
{{{ else }}}
<li class="page-item page{{{ if ./active }}} active{{{ end }}}" >
<a class="page-link rounded fw-secondary px-3" href="?{./qs}" data-page="{./page}" aria-label="[[global:pagination.page-x, {./page}]]">{./page}</a>
</li>
{{{ end }}}
{{{end}}}
<li class="page-item next {{{ if !pagination.next.active }}} disabled{{{ end }}}">
<a class="page-link rounded fw-secondary px-3" href="?{pagination.next.qs}" data-page="{pagination.next.page}" aria-label="[[global:pagination.nextpage]]"> <i class="fa fa-chevron-right"></i></a>
</li>
</ul>
{{{ if !template.topic }}}
<ul class="pagination pagination-sm hidden-md hidden-lg justify-content-center">
<li class="page-item first{{{ if !pagination.prev.active }}} disabled{{{ end }}}">
<a class="page-link fw-secondary" href="?{pagination.first.qs}" data-page="1" aria-label="[[global:pagination.firstpage]]"><i class="fa fa-fast-backward"></i> </a>
</li>
<li class="page-item previous{{{ if !pagination.prev.active }}} disabled{{{ end }}}">
<a class="page-link fw-secondary" href="?{pagination.prev.qs}" data-page="{pagination.prev.page}" aria-label="[[global:pagination.previouspage]]"><i class="fa fa-chevron-left"></i> </a>
</li>
<li component="pagination/select-page" class="page-item page select-page">
<a class="page-link fw-secondary" href="#" aria-label="[[global:pagination.go-to-page]]">{pagination.currentPage} / {pagination.pageCount}</a>
</li>
<li class="page-item next{{{ if !pagination.next.active }}} disabled{{{ end }}}">
<a class="page-link fw-secondary" href="?{pagination.next.qs}" data-page="{pagination.next.page}" aria-label="[[global:pagination.nextpage]]"> <i class="fa fa-chevron-right"></i></a>
</li>
<li class="page-item last{{{ if !pagination.next.active }}} disabled{{{ end }}}">
<a class="page-link fw-secondary"  href="?{pagination.last.qs}" data-page="{pagination.pageCount}" aria-label="[[global:pagination.lastpage]]"><i class="fa fa-fast-forward"></i> </a>
</li>
</ul>
{{{ end }}}
</nav>
</div>
<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
{{{ each widgets.sidebar }}}
{{widgets.sidebar.html}}
{{{ end }}}
</div>
</div>
<div data-widget-area="footer">
{{{ each widgets.footer }}}
{{widgets.footer.html}}
{{{ end }}}
</div>