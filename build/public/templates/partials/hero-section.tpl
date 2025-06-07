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