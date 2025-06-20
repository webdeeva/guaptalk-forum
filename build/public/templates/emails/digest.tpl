<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<meta charset="utf-8"> <!-- utf-8 works for most cases -->
<meta name="viewport" content="width=device-width"> <!-- Forcing initial-scale shouldn't be necessary -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- Use the latest (edge) version of IE rendering engine -->
<meta name="x-apple-disable-message-reformatting">  <!-- Disable auto-scale in iOS 10 Mail entirely -->
<title></title> <!-- The title tag shows in email notifications, like Android 4.4. -->
<!-- Web Font / @font-face : BEGIN -->
<!-- NOTE: If web fonts are not required, lines 10 - 27 can be safely removed. -->
<!-- Desktop Outlook chokes on web font references and defaults to Times New Roman, so we force a safe fallback font. -->
<!--[if mso]>
<style>
* {
font-family: sans-serif !important;
}
</style>
<![endif]-->
<!-- All other clients get the webfont reference; some will render the font and others will silently fail to the fallbacks. More on that here: http://stylecampaign.com/blog/2015/02/webfont-support-in-email/ -->
<!--[if !mso]><!-->
<!-- insert web font reference, eg: <link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'> -->
<!--<![endif]-->
<!-- Web Font / @font-face : END -->
<!-- CSS Reset -->
<style>
/* What it does: Remove spaces around the email design added by some email clients. */
/* Beware: It can remove the padding / margin and add a background color to the compose a reply window. */
html,
body {
margin: 0 auto !important;
padding: 0 !important;
height: 100% !important;
width: 100% !important;
}
/* What it does: Stops email clients resizing small text. */
* {
-ms-text-size-adjust: 100%;
-webkit-text-size-adjust: 100%;
}
/* What it does: Centers email on Android 4.4 */
div[style*="margin: 16px 0"] {
margin:0 !important;
}
/* What it does: Stops Outlook from adding extra spacing to tables. */
table,
td {
mso-table-lspace: 0pt !important;
mso-table-rspace: 0pt !important;
}
/* What it does: Fixes webkit padding issue. Fix for Yahoo mail table alignment bug. Applies table-layout to the first 2 tables then removes for anything nested deeper. */
table {
border-spacing: 0 !important;
border-collapse: collapse !important;
table-layout: fixed !important;
margin: 0 auto !important;
}
table table table {
table-layout: auto;
}
/* What it does: Uses a better rendering method when resizing images in IE. */
img {
-ms-interpolation-mode:bicubic;
}
/* What it does: A work-around for email clients meddling in triggered links. */
*[x-apple-data-detectors],	/* iOS */
.x-gmail-data-detectors, 	/* Gmail */
.x-gmail-data-detectors *,
.aBn {
border-bottom: 0 !important;
cursor: default !important;
color: inherit !important;
text-decoration: none !important;
font-size: inherit !important;
font-family: inherit !important;
font-weight: inherit !important;
line-height: inherit !important;
}
/* What it does: Prevents Gmail from displaying an download button on large, non-linked images. */
.a6S {
display: none !important;
opacity: 0.01 !important;
}
/* If the above doesn't work, add a .g-img class to any image in question. */
img.g-img + div {
display:none !important;
}
/* What it does: Prevents underlining the button text in Windows 10 */
.button-link {
text-decoration: none !important;
}
/* What it does: Removes right gutter in Gmail iOS app: https://github.com/TedGoas/Cerberus/issues/89  */
/* Create one of these media queries for each additional viewport size you'd like to fix */
/* Thanks to Eric Lepetit (@ericlepetitsf) for help troubleshooting */
@media only screen and (min-device-width: 375px) and (max-device-width: 413px) { /* iPhone 6 and 6+ */
.email-container {
min-width: 375px !important;
}
}
</style>
<!-- Progressive Enhancements -->
<style>
/* What it does: Hover styles for buttons */
.button-td,
.button-a {
transition: all 100ms ease-in;
}
.button-td:hover,
.button-a:hover {
background: #555555 !important;
border-color: #555555 !important;
}
/* Media Queries */
@media screen and (max-width: 600px) {
/* What it does: Adjust typography on small screens to improve readability */
.email-container p {
font-size: 17px !important;
line-height: 26px !important;
}
}
.notification-body img {
max-width: 100%;
height: auto;
}
</style>
<!-- What it does: Makes background images in 72ppi Outlook render at correct size. -->
<!--[if gte mso 9]>
<xml>
<o:OfficeDocumentSettings>
<o:AllowPNG/>
<o:PixelsPerInch>96</o:PixelsPerInch>
</o:OfficeDocumentSettings>
</xml>
<![endif]-->
</head>
<body width="100%" bgcolor="#f6f6f6" style="margin: 0; mso-line-height-rule: exactly;">
<center style="width: 100%; background: #f6f6f6; text-align: left;">
<!--
Set the email width. Defined in two places:
1. max-width for all clients except Desktop Windows Outlook, allowing the email to squish on narrow but never go wider than 600px.
2. MSO tags for Desktop Windows Outlook enforce a 600px width.
-->
<div style="max-width: 600px; margin: auto;{{{ if rtl }}} text-align: right; direction: rtl;{{{ end }}}" class="email-container">
<!--[if mso]>
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" align="center">
<tr>
<td>
<![endif]-->
<!-- Email Header : BEGIN -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="100%" style="max-width: 600px;">
<tr>
<td style="padding: 20px 0; text-align: center">
{{{ if logo.src }}}
<img src="{logo.src}" height="auto" width="{logo.width}" alt="{site_title}" border="0" style="height: auto; width: {logo.width}px; background: #f6f6f6; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 15px; line-height: 20px; color: #333333;">
{{{ else }}}
&nbsp;
{{{ end }}}
</td>
</tr>
</table>
<!-- Email Header : END -->
<!-- Email Body : BEGIN -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="100%" style="max-width: 600px;">
<!-- 1 Column Text + Button : BEGIN -->
<tr>
<td bgcolor="#ffffff">
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
<td style="padding: 40px 40px 6px 40px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 15px; line-height: 20px; color: #555555;">
<h1 style="margin: 0; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 24px; line-height: 27px; color: #333333; font-weight: normal;">[[email:greeting-with-name, {displayname}]]</h1>
</td>
</tr>
<tr>
<td style="padding: 0px 40px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 15px; line-height: 20px; color: #555555;">
<h1 style="margin: 0 0 10px 0; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 18px; line-height: 21px; color: #aaaaaa; font-weight: normal;">[[email:digest.title.{interval}]]</h1>
</td>
</tr>
{{{ if notifications.length }}}
<tr>
<td style="padding: 0px 40px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 15px; line-height: 20px; color: #555555;">
<ul style="margin: 0; padding: 0;">
{{{ each notifications }}}
<li style="text-decoration: none; list-style-type: none; padding-bottom: 0.5em;">
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
<td style="padding: 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; width: 32px;">
{{{ if notifications.image }}}
<img style="vertical-align: middle; width: 32px; height: 32px; border-radius: 50%" src="{notifications.image}" alt="" />
{{{ else }}}
<div style="vertical-align: middle; width: 32px; height: 32px; line-height: 32px; font-size: 16px; background-color: {notifications.user.icon:bgColor}; color: white; text-align: center; display: inline-block; border-radius: 50%">{notifications.user.icon:text}</div>
{{{ end }}}
</td>
<td style="padding: 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px; color: #333333;">
<p style="margin: 0;"><a style="text-decoration:none !important; text-decoration:none; color: #333333;" href="{notifications.notification_url}">{notifications.bodyShort}</a></p>
</td>
</tr>
</table>
</li>
{{{ end }}}
</ul>
</td>
</tr>
{{{ end }}}
{{{ if publicRooms.length }}}
<tr>
<td style="padding: 0px 40px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 15px; line-height: 20px; color: #555555;">
<h1 style="margin: 16px 0 24px 0; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 18px; line-height: 21px; color: #aaaaaa; font-weight: normal;">[[email:digest.unread-rooms]]</h1>
<ul style="margin: 0; padding: 0;">
{{{ each publicRooms }}}
<li style="text-decoration: none; list-style-type: none; padding-bottom: 0.5em;">
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
<td style="padding: 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px; color: #333333;">
<p style="margin: 0;"><a style="text-decoration:none !important; text-decoration:none; color: #333333;" href="{url}/chats/{./roomId}"># [[email:digest.room-name-unreadcount, {./roomName}, {./unreadCountText}]]</a></p>
</td>
</tr>
</table>
</li>
{{{ end }}}
</ul>
</td>
</tr>
{{{ end }}}
{{{ if topTopics.length }}}
<tr>
<td style="padding: 0px 40px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 15px; line-height: 20px; color: #555555;">
<h1 style="margin: 16px 0 24px 0; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 18px; line-height: 21px; color: #aaaaaa; font-weight: normal;">[[email:digest.top-topics, {site_title}]]</h1>
<ul style="margin: 0; padding: 0;">
{{{ each topTopics }}}
<li style="text-decoration: none; list-style-type: none; padding-bottom: 0.5em;">
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
<td style="padding: 6px 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; width: 32px; vertical-align: middle;">{function.renderDigestAvatar}</td>
<td style="padding: 6px 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px; color: #333333;">
<p style="margin: 0;"><a style="text-decoration:none !important; text-decoration:none; color: #333333;" href="{url}/topic/{topTopics.slug}"><strong>{topTopics.title}</strong></a></p>
<p style="margin: 0; font-size: 12px;"><a style="text-decoration:none !important; text-decoration:none; color: #aaaaaa; line-height: 16px;" href="{url}/uid/{topTopics.teaser.user.uid}"><strong>{topTopics.teaser.user.displayname}</strong></a></p>
</td>
</tr>
<tr>
<td colspan="2" style="padding: 8px 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px; color: #333333;">
<p style="margin: 0; padding: 6px 0px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 13px; line-height: 26px; color: #666666;">{topTopics.teaser.content}</p>
<p style="margin: 0; padding: 6px 0px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px;">
<a style="text-decoration:none !important; text-decoration:none; text-transform: capitalize; color: #666666; line-height: 16px;" href="{url}/topic/{topTopics.slug}">
<small><strong><span style="color: #aaaaaa;">&rsaquo;</span> [[global:read-more]]</strong></small>
</a>
</p>
</td>
</tr>
</table>
</li>
{{{ if !@last }}}
<li style="text-decoration: none; list-style-type: none; margin: 0px 64px 16px 64px; border-bottom: 1px solid #dddddd"></li>
{{{ end }}}
{{{ end }}}
</ul>
</td>
</tr>
{{{ end }}}
{{{ if popularTopics.length }}}
<tr>
<td style="padding: 0px 40px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 15px; line-height: 20px; color: #555555;">
<h1 style="margin: 16px 0 24px 0; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 18px; line-height: 21px; color: #aaaaaa; font-weight: normal;">[[email:digest.popular-topics, {site_title}]]</h1>
<ul style="margin: 0; padding: 0;">
{{{ each popularTopics }}}
<li style="text-decoration: none; list-style-type: none; padding-bottom: 0.5em;">
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
<td style="padding: 6px 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; width: 32px; vertical-align: middle;">{function.renderDigestAvatar}</td>
<td style="padding: 6px 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px; color: #333333;">
<p style="margin: 0;"><a style="text-decoration:none !important; text-decoration:none; color: #333333;" href="{url}/topic/{popularTopics.slug}"><strong>{popularTopics.title}</strong></a></p>
<p style="margin: 0; font-size: 12px;"><a style="text-decoration:none !important; text-decoration:none; color: #aaaaaa; line-height: 16px;" href="{url}/uid/{popularTopics.teaser.user.uid}"><strong>{popularTopics.teaser.user.displayname}</strong></a></p>
</td>
</tr>
<tr>
<td colspan="2" style="padding: 8px 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px; color: #333333;">
<p style="margin: 0; padding: 6px 0px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 13px; line-height: 26px; color: #666666;">{popularTopics.teaser.content}</p>
<p style="margin: 0; padding: 6px 0px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px;">
<a style="text-decoration:none !important; text-decoration:none; text-transform: capitalize; color: #666666; line-height: 16px;" href="{url}/topic/{popularTopics.slug}">
<small><strong><span style="color: #aaaaaa;">&rsaquo;</span> [[global:read-more]]</strong></small>
</a>
</p>
</td>
</tr>
</table>
</li>
{{{ if !@last }}}
<li style="text-decoration: none; list-style-type: none; margin: 0px 64px 16px 64px; border-bottom: 1px solid #dddddd"></li>
{{{ end }}}
{{{ end }}}
</ul>
</td>
</tr>
{{{ end }}}
{{{ if recent.length }}}
<tr>
<td style="padding: 0px 40px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 15px; line-height: 20px; color: #555555;">
<h1 style="margin: 16px 0 24px 0; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 18px; line-height: 21px; color: #aaaaaa; font-weight: normal;">[[email:digest.latest-topics, {site_title}]]</h1>
<ul style="margin: 0; padding: 0;">
{{{ each recent }}}
<li style="text-decoration: none; list-style-type: none; padding-bottom: 0.5em;">
<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
<td style="padding: 6px 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; width: 32px; vertical-align: middle;">{function.renderDigestAvatar}</td>
<td style="padding: 6px 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px; color: #333333;">
<p style="margin: 0;"><a style="text-decoration:none !important; text-decoration:none; color: #333333;" href="{url}/topic/{recent.slug}"><strong>{recent.title}</strong></a></p>
<p style="margin: 0; font-size: 12px;"><a style="text-decoration:none !important; text-decoration:none; color: #aaaaaa; line-height: 16px;" href="{url}/uid/{recent.teaser.user.uid}"><strong>{recent.teaser.user.displayname}</strong></a></p>
</td>
</tr>
<tr>
<td colspan="2" style="padding: 8px 16px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px; color: #333333;">
<p style="margin: 0; padding: 6px 0px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 13px; line-height: 26px; color: #666666;">{recent.teaser.content}</p>
<p style="margin: 0; padding: 6px 0px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height: 16px;">
<a style="text-decoration:none !important; text-decoration:none; text-transform: capitalize; color: #666666; line-height: 16px;" href="{url}/topic/{recent.slug}">
<small><strong><span style="color: #aaaaaa;">&rsaquo;</span> [[global:read-more]]</strong></small>
</a>
</p>
</td>
</tr>
</table>
</li>
{{{ if !@last }}}
<li style="text-decoration: none; list-style-type: none; margin: 0px 64px 16px 64px; border-bottom: 1px solid #dddddd"></li>
{{{ end }}}
{{{ end }}}
</ul>
</td>
</tr>
{{{ end }}}
<tr>
<td style="padding: 32px 40px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 15px; line-height: 20px; color: #555555;">
<!-- Button : BEGIN -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
<tr>
<td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
<a href="{url}" style="background: #222222; border: 15px solid #222222; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
<span style="color:#ffffff;" class="button-link">[[email:digest.cta, {site_title}]] &rarr;</span>
</a>
</td>
</tr>
</table>
<!-- Button : END -->
</td>
</tr>
</table>
</td>
</tr>
<!-- 1 Column Text + Button : END -->
</table>
<!-- Email Body : END -->
<!-- Email Footer : BEGIN -->
<table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="100%" style="max-width: 680px;">
<tr>
<td style="padding: 40px 10px;width: 100%;font-size: 12px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol; line-height:18px; text-align: center; color: #888888;">
<br><br>
{{{ if showUnsubscribe }}}
[[email:notif.post.unsub.info]] <a href="{url}/uid/{uid}/settings">[[email:unsub.cta]]</a>.
<br />[[email:notif.post.unsub.one-click]] <a href="{unsubUrl}">[[email:unsubscribe]]</a>.
{{{ end }}}
<br><br>
</td>
</tr>
</table>
<!-- Email Footer : END -->
<!--[if mso]>
</td>
</tr>
</table>
<![endif]-->
</div>
</center>
</body>
</html>