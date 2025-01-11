<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="alternate" type="application/rss+xml" title="JunkHack &raquo; フィード" href="//feed/">
<link rel="alternate" type="application/rss+xml" title="JunkHack &raquo; Yahoo フィード" href="//feed/yahoo/">
<link rel="alternate" type="application/rss+xml" title="JunkHack &raquo; SmartNews フィード" href="//feed/smartnews/">
<link rel="manifest" href="/wp-content/themes/jh-hew/manifest.json">
<link rel="icon alternate" href="/wp-content/themes/jh-hew/img/favicon-48.png" type="image/png">
<link rel="apple-touch-icon" href="/wp-content/themes/jh-hew/img/apple-touch-icon180.png" sizes="180x180">
<meta name="theme-color" content="#FAD641">
<meta name="apple-mobile-web-app-title" content="JunkHack">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<script>if ('serviceWorker' in navigator && 'localhost' !== window.location.hostname) {
	window.addEventListener('load', function () {
		navigator.serviceWorker.register('/sw.js').then(
			function (registration) {
				console.log('ServiceWorker registration successful with scope: ', registration.scope);
			},
			function (err) {
				console.log('ServiceWorker registration failed: ', err);
			}
		);
	});
}</script>


<title>WordPress.com でドメインマッピングしてサブドメインの独自ドメインを利用 &#8211; JunkHack</title>
<meta name="robots" content="max-image-preview:large">
<link rel="dns-prefetch" href="//cdnjs.cloudflare.com">
<link rel="dns-prefetch" href="//fonts.googleapis.com">
<link rel="stylesheet" id="wp-block-library-css" href="/wp-includes/css/dist/block-library/style.min.css?ver=6.6.2" type="text/css" media="all">
<style id="classic-theme-styles-inline-css" type="text/css">/*! This file is auto-generated */
.wp-block-button__link{color:#fff;background-color:#32373c;border-radius:9999px;box-shadow:none;text-decoration:none;padding:calc(.667em + 2px) calc(1.333em + 2px);font-size:1.125em}.wp-block-file__button{background:#32373c;color:#fff;text-decoration:none}</style>
<style id="global-styles-inline-css" type="text/css">:root{--wp--preset--aspect-ratio--square: 1;--wp--preset--aspect-ratio--4-3: 4/3;--wp--preset--aspect-ratio--3-4: 3/4;--wp--preset--aspect-ratio--3-2: 3/2;--wp--preset--aspect-ratio--2-3: 2/3;--wp--preset--aspect-ratio--16-9: 16/9;--wp--preset--aspect-ratio--9-16: 9/16;--wp--preset--color--black: #000000;--wp--preset--color--cyan-bluish-gray: #abb8c3;--wp--preset--color--white: #ffffff;--wp--preset--color--pale-pink: #f78da7;--wp--preset--color--vivid-red: #cf2e2e;--wp--preset--color--luminous-vivid-orange: #ff6900;--wp--preset--color--luminous-vivid-amber: #fcb900;--wp--preset--color--light-green-cyan: #7bdcb5;--wp--preset--color--vivid-green-cyan: #00d084;--wp--preset--color--pale-cyan-blue: #8ed1fc;--wp--preset--color--vivid-cyan-blue: #0693e3;--wp--preset--color--vivid-purple: #9b51e0;--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg,rgba(6,147,227,1) 0%,rgb(155,81,224) 100%);--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg,rgb(122,220,180) 0%,rgb(0,208,130) 100%);--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg,rgba(252,185,0,1) 0%,rgba(255,105,0,1) 100%);--wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg,rgba(255,105,0,1) 0%,rgb(207,46,46) 100%);--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg,rgb(238,238,238) 0%,rgb(169,184,195) 100%);--wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg,rgb(74,234,220) 0%,rgb(151,120,209) 20%,rgb(207,42,186) 40%,rgb(238,44,130) 60%,rgb(251,105,98) 80%,rgb(254,248,76) 100%);--wp--preset--gradient--blush-light-purple: linear-gradient(135deg,rgb(255,206,236) 0%,rgb(152,150,240) 100%);--wp--preset--gradient--blush-bordeaux: linear-gradient(135deg,rgb(254,205,165) 0%,rgb(254,45,45) 50%,rgb(107,0,62) 100%);--wp--preset--gradient--luminous-dusk: linear-gradient(135deg,rgb(255,203,112) 0%,rgb(199,81,192) 50%,rgb(65,88,208) 100%);--wp--preset--gradient--pale-ocean: linear-gradient(135deg,rgb(255,245,203) 0%,rgb(182,227,212) 50%,rgb(51,167,181) 100%);--wp--preset--gradient--electric-grass: linear-gradient(135deg,rgb(202,248,128) 0%,rgb(113,206,126) 100%);--wp--preset--gradient--midnight: linear-gradient(135deg,rgb(2,3,129) 0%,rgb(40,116,252) 100%);--wp--preset--font-size--small: 13px;--wp--preset--font-size--medium: 20px;--wp--preset--font-size--large: 36px;--wp--preset--font-size--x-large: 42px;--wp--preset--spacing--20: 0.44rem;--wp--preset--spacing--30: 0.67rem;--wp--preset--spacing--40: 1rem;--wp--preset--spacing--50: 1.5rem;--wp--preset--spacing--60: 2.25rem;--wp--preset--spacing--70: 3.38rem;--wp--preset--spacing--80: 5.06rem;--wp--preset--shadow--natural: 6px 6px 9px rgba(0, 0, 0, 0.2);--wp--preset--shadow--deep: 12px 12px 50px rgba(0, 0, 0, 0.4);--wp--preset--shadow--sharp: 6px 6px 0px rgba(0, 0, 0, 0.2);--wp--preset--shadow--outlined: 6px 6px 0px -3px rgba(255, 255, 255, 1), 6px 6px rgba(0, 0, 0, 1);--wp--preset--shadow--crisp: 6px 6px 0px rgba(0, 0, 0, 1);}:where(.is-layout-flex){gap: 0.5em;}:where(.is-layout-grid){gap: 0.5em;}body .is-layout-flex{display: flex;}.is-layout-flex{flex-wrap: wrap;align-items: center;}.is-layout-flex > :is(*, div){margin: 0;}body .is-layout-grid{display: grid;}.is-layout-grid > :is(*, div){margin: 0;}:where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}:where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}.has-black-color{color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-color{color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-color{color: var(--wp--preset--color--white) !important;}.has-pale-pink-color{color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-color{color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-color{color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-color{color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-color{color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-color{color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-color{color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-color{color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-color{color: var(--wp--preset--color--vivid-purple) !important;}.has-black-background-color{background-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-background-color{background-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-background-color{background-color: var(--wp--preset--color--white) !important;}.has-pale-pink-background-color{background-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-background-color{background-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-background-color{background-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-background-color{background-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-background-color{background-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-background-color{background-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-background-color{background-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-background-color{background-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-background-color{background-color: var(--wp--preset--color--vivid-purple) !important;}.has-black-border-color{border-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-border-color{border-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-border-color{border-color: var(--wp--preset--color--white) !important;}.has-pale-pink-border-color{border-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-border-color{border-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-border-color{border-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-border-color{border-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-border-color{border-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-border-color{border-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-border-color{border-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-border-color{border-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-border-color{border-color: var(--wp--preset--color--vivid-purple) !important;}.has-vivid-cyan-blue-to-vivid-purple-gradient-background{background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;}.has-light-green-cyan-to-vivid-green-cyan-gradient-background{background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;}.has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;}.has-luminous-vivid-orange-to-vivid-red-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;}.has-very-light-gray-to-cyan-bluish-gray-gradient-background{background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;}.has-cool-to-warm-spectrum-gradient-background{background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;}.has-blush-light-purple-gradient-background{background: var(--wp--preset--gradient--blush-light-purple) !important;}.has-blush-bordeaux-gradient-background{background: var(--wp--preset--gradient--blush-bordeaux) !important;}.has-luminous-dusk-gradient-background{background: var(--wp--preset--gradient--luminous-dusk) !important;}.has-pale-ocean-gradient-background{background: var(--wp--preset--gradient--pale-ocean) !important;}.has-electric-grass-gradient-background{background: var(--wp--preset--gradient--electric-grass) !important;}.has-midnight-gradient-background{background: var(--wp--preset--gradient--midnight) !important;}.has-small-font-size{font-size: var(--wp--preset--font-size--small) !important;}.has-medium-font-size{font-size: var(--wp--preset--font-size--medium) !important;}.has-large-font-size{font-size: var(--wp--preset--font-size--large) !important;}.has-x-large-font-size{font-size: var(--wp--preset--font-size--x-large) !important;}
:where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}
:where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}
:root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}</style>
<link rel="stylesheet" id="wpel-style-css" href="/wp-content/plugins/wp-external-links/public/css/wpel.css?ver=2.62" type="text/css" media="all">
<style id="md-style-inline-css" type="text/css">.gfm-task-list { border: 1px solid transparent; list-style-type: none; } .gfm-task-list input { margin-right: 10px !important; } .katex-container { margin: 25px !important; text-align: center; } .katex-container.katex-inline { display: inline-block !important; background: none !important; margin: 0 !important; padding: 0 !important; } pre .katex-container { font-size: 1.4em !important; } .katex-inline { background: none !important; margin: 0 3px; } .copy-button { cursor: pointer; border: 0; font-size: 12px; text-transform: uppercase; font-weight: 500; padding: 3px 6px 3px 6px; background-color: rgba(255, 255, 255, 0.6); position: absolute; overflow: hidden; top: 5px; right: 5px; border-radius: 3px; } .copy-button:before { content: ""; display: inline-block; width: 16px; height: 16px; margin-right: 3px; background-size: contain; background-image: url("data:image/svg+xml,%3Csvg version=\'1.1\' xmlns=\'http://www.w3.org/2000/svg\' xmlns:xlink=\'http://www.w3.org/1999/xlink\' x=\'0px\' y=\'0px\' width=\'16px\' height=\'16px\' viewBox=\'888 888 16 16\' enable-background=\'new 888 888 16 16\' xml:space=\'preserve\'%3E %3Cpath fill=\'%23333333\' d=\'M903.143,891.429c0.238,0,0.44,0.083,0.607,0.25c0.167,0.167,0.25,0.369,0.25,0.607v10.857 c0,0.238-0.083,0.44-0.25,0.607s-0.369,0.25-0.607,0.25h-8.571c-0.238,0-0.44-0.083-0.607-0.25s-0.25-0.369-0.25-0.607v-2.571 h-4.857c-0.238,0-0.44-0.083-0.607-0.25s-0.25-0.369-0.25-0.607v-6c0-0.238,0.06-0.5,0.179-0.786s0.262-0.512,0.428-0.679 l3.643-3.643c0.167-0.167,0.393-0.309,0.679-0.428s0.547-0.179,0.786-0.179h3.714c0.238,0,0.44,0.083,0.607,0.25 c0.166,0.167,0.25,0.369,0.25,0.607v2.929c0.404-0.238,0.785-0.357,1.143-0.357H903.143z M898.286,893.331l-2.67,2.669h2.67V893.331 z M892.571,889.902l-2.669,2.669h2.669V889.902z M894.321,895.679l2.821-2.822v-3.714h-3.428v3.714c0,0.238-0.083,0.441-0.25,0.607 s-0.369,0.25-0.607,0.25h-3.714v5.714h4.571v-2.286c0-0.238,0.06-0.5,0.179-0.786C894.012,896.071,894.155,895.845,894.321,895.679z M902.857,902.857v-10.286h-3.429v3.714c0,0.238-0.083,0.441-0.25,0.607c-0.167,0.167-0.369,0.25-0.607,0.25h-3.714v5.715H902.857z\' /%3E %3C/svg%3E"); background-repeat: no-repeat; position: relative; top: 3px; } pre { position: relative; } pre:hover .copy-button { background-color: rgba(255, 255, 255, 0.9); } .post pre code script, .language-mathjax ~ .copy-button { display: none !important; }</style>
<link rel="stylesheet" id="mouse-css" href="/wp-content/plugins/wp-keypopup-algolia/mouse.css?ver=6.6.2" type="text/css" media="all">
<link rel="stylesheet" id="related-frontend-css-css" href="/wp-content/plugins/ccrw_related/css/frontend-style.css?ver=0.1.0" type="text/css" media="all">
<link rel="stylesheet" id="uagb-block-css-css" href="/wp-content/plugins/ultimate-addons-for-gutenberg/dist/style-blocks.css?ver=2.6.1" type="text/css" media="all">
<link rel="stylesheet" id="JankHack-Hew-fonts-css" href="https://fonts.googleapis.com/css?family=Open+Sans%3A400%2C600%2C700%2C400italic%2C600italic%2C700italic%7CNoto+Serif%3A400%2C700%2C400italic%2C700italic&#038;subset=latin" type="text/css" media="all">
<link rel="stylesheet" id="genericons-css" href="/wp-content/themes/jh-hew/genericons/genericons.css?ver=3.4.1" type="text/css" media="all">
<link rel="stylesheet" id="JankHack-Hew-style-css" href="/wp-content/themes/jh-hew/style.css?ver=6.6.2" type="text/css" media="all">
<link rel="stylesheet" id="algolia-autocomplete-css" href="/wp-content/plugins/wp-search-with-algolia/css/algolia-autocomplete.css?ver=2.8.1" type="text/css" media="all">
<link rel="stylesheet" id="emojify-css" href="https://cdnjs.cloudflare.com/ajax/libs/emojify.js/1.1.0/css/basic/emojify.min.css?ver=1.1.0" type="text/css" media="all">
<script type="text/javascript" src="/wp-content/plugins/jquery-manager/assets/js/jquery-3.5.1.min.js" id="jquery-core-js"></script>
<script type="text/javascript" src="/wp-content/plugins/jquery-manager/assets/js/jquery-migrate-3.3.0.min.js" id="jquery-migrate-js"></script>
<script type="text/javascript" src="/wp-content/plugins/wp-keypopup-algolia/mousetrap.min.js?ver=6.6.2" id="mice-js"></script>
<script type="text/javascript" id="mouse-js-extra">
/* <![CDATA[ */
var mouse = {"home":"\/","list":"\/list\/","search":"\/s\/"};
/* ]]> */
</script>
<script type="text/javascript" src="/wp-content/plugins/wp-keypopup-algolia/mouse.js?ver=6.6.2" id="mouse-js"></script>
<link rel="https://api.w.org/" href="/wp-json/">
<link rel="alternate" title="JSON" type="application/json" href="/wp-json/wp/v2/posts/4649">
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="/xmlrpc.php?rsd">
<meta name="generator" content="WordPress 6.6.2">
<link rel="canonical" href="/2018/10/18/domain-mapping-on-wordpress.com">
<link rel="shortlink" href="/?p=4649">
<link rel="alternate" title="oEmbed (JSON)" type="application/json+oembed" href="/wp-json/oembed/1.0/embed?url=https%3A%2F%2F%2F2018%2F10%2F18%2Fdomain-mapping-on-wordpress.com">
<link rel="alternate" title="oEmbed (XML)" type="text/xml+oembed" href="/wp-json/oembed/1.0/embed?url=https%3A%2F%2F%2F2018%2F10%2F18%2Fdomain-mapping-on-wordpress.com#038;format=xml">
		<style>.algolia-search-highlight {
				background-color: #fffbcc;
				border-radius: 2px;
				font-style: normal;
			}</style>
		<style id="uagb-style-frontend-4649">.uagb-block-188fea4d .uagb-search-form__container .uagb-search-submit{width: 60px;padding: 0;border: 0;}.uagb-block-188fea4d .uagb-search-form__container .uagb-search-form__input::placeholder{opacity: 0.6;}.uagb-block-188fea4d .uagb-search-form__container .uagb-search-submit .uagb-wp-search-button-icon-wrap svg{width: 17px;height: 17px;font-size: 17px;}.uagb-block-188fea4d .uagb-search-form__container .uagb-search-submit .uagb-wp-search-button-text{color: #313131;}.uagb-block-188fea4d.uagb-layout-input .uagb-wp-search-icon-wrap svg{width: 17px;height: 17px;font-size: 17px;}.uagb-block-188fea4d .uagb-search-form__container .uagb-search-form__input{background-color: #ECEEEF;border: 0;border-radius: 0px;margin: 0;outline: unset;padding-top: 15px;padding-bottom: 15px;padding-right: 13px;padding-left: 13px;}.uagb-block-188fea4d .uagb-search-wrapper .uagb-search-form__container{border-top-left-radius: 3px;border-top-right-radius: 3px;border-bottom-left-radius: 3px;border-bottom-right-radius: 3px;border-style: none;outline: unset;box-shadow: 0px 0px    ;transition: all .5s;width: 100%;}.uagb-block-188fea4d .uagb-search-form__container .uagb-wp-search-icon-wrap{background-color: #ECEEEF;padding-top: 15px;padding-bottom: 15px;padding-left: 13px;}.uagb-block-188fea4d.uagb-layout-input-button .uagb-search-wrapper .uagb-search-form__container .uagb-search-submit{background-color: #9d9d9d;}@media only screen and (max-width: 976px) {.uagb-block-188fea4d .uagb-search-wrapper .uagb-search-form__container .uagb-search-form__input{padding-top: 15px;padding-bottom: 15px;padding-right: 13px;padding-left: 13px;}.uagb-block-188fea4d .uagb-search-form__container .uagb-wp-search-icon-wrap{padding-top: 15px;padding-bottom: 15px;padding-left: 13px;}}@media only screen and (max-width: 767px) {.uagb-block-188fea4d .uagb-search-wrapper .uagb-search-form__container .uagb-search-form__input{padding-top: 15px;padding-bottom: 15px;padding-right: 13px;padding-left: 13px;}.uagb-block-188fea4d .uagb-search-form__container .uagb-wp-search-icon-wrap{padding-top: 15px;padding-bottom: 15px;padding-left: 13px;}}</style>
</head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-161935417-3"></script>
<script>window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-161935417-3');</script>
<body class="post-template-default single single-post postid-4649 single-format-standard has-sidebar has-header-image">
<div id="page" class="hfeed site">
		<div id="widgets-wrapper" class="hide">
		
<div id="secondary" class="wrap top-widget-area" role="complementary">
	
	
	
		<div id="sidebar-4" class="widget-area" role="complementary">
		<aside id="block-9" class="widget widget_block"><p><script async="" src="https://cse.google.com/cse.js?cx=df8210082ba786774"></script></p>
<div class="gcse-search"></div></aside>	</div>
<!-- #four .widget-area -->
	</div>
<!-- #secondary -->
	</div>
	
	<a class="skip-link screen-reader-text" href="#content">コンテンツへ移動</a>

	<header id="masthead" class="site-header" role="banner">
					<a class="site-logo" href="/" title="JunkHack" rel="home noopener noreferrer" data-wpel-link="internal">
				<img src="https://secure.gravatar.com/avatar/997681319c3cbb0bdcca95770d5edaa6/?s=80&#038;d=mm" width="80" height="80" alt="" class="no-grav header-image">
			</a>
		
		<div class="site-branding">
			<h1 class="site-title"><a href="/" rel="home noopener noreferrer" data-wpel-link="internal">JunkHack</a></h1>
			<h2 class="site-description">アリエクでポチった JUNKHACK</h2>
		</div>

					<nav id="site-navigation" class="main-navigation" role="navigation">
				<button class="menu-toggle toggle-button"><span class="screen-reader-text">メインメニュー</span></button>
				<div class="menu-new-menu-container"><ul id="menu-new-menu" class="menu">
<li id="menu-item-10686" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-10686"><a href="/list/" data-wpel-link="internal" rel="noopener noreferrer">List</a></li>
<li id="menu-item-11016" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-11016"><a href="/mail/" data-wpel-link="internal" rel="noopener noreferrer">CONTACT</a></li>
<li id="menu-item-10671" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-10671"><a href="https://mirror.gpl.jp/" data-wpel-link="external" target="_blank" rel="external noopener noreferrer" class="wpel-icon-right">Mirror<span class="wpel-icon wpel-image wpel-icon-1"></span></a></li>
<li id="menu-item-11798" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-11798"><a href="/tatebu/tatebu-13moji.html" data-wpel-link="internal" rel="noopener noreferrer">Tatebu</a></li>
</ul></div>			</nav><!-- #site-navigation -->
		
		
				<div class="toggle-wrapper">
			<a href="#" class="widgets-toggle toggle-button" title="ウィジェット">
				<span class="screen-reader-text">ウィジェット</span>
			</a>
		</div>
		
	</header><!-- #masthead -->
	
	<div id="content" class="site-content">
	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

		
			
<article id="post-4649" class="post-4649 post type-post status-publish format-standard hentry category-wordpress category-wordpress-com">
	<div class="entry-wrapper">



		<header class="entry-header">
					<span class="entry-format theme-genericon"></span>
	
			<div class="entry-meta">
				<span class="posted-on">投稿日: <a href="/2018/10/18/domain-mapping-on-wordpress.com" rel="bookmark noopener noreferrer" data-wpel-link="internal"><time class="entry-date published updated" datetime="2018-10-18T04:11:52+09:00">2018年10月18日</time></a> </span><span class="posted-on">更新日:2018年10月18日</span> <span class="categories">  <a href="/category/wordpress/" rel="category tag noopener noreferrer" data-wpel-link="internal">WordPress</a>, <a href="/category/wordpress-com/" rel="category tag noopener noreferrer" data-wpel-link="internal">wordpress.com</a></span>			</div>
<!-- .entry-meta -->

							<div class="flex">
									
				<h1 class="entry-title">WordPress.com でドメインマッピングしてサブドメインの独自ドメインを利用</h1>
				</div>
					</header><!-- .entry-header -->

		<div class="entry-content">
			<p>さて、前回 WordPress.com の一番下の有料プラン「パーソナル」という月額400円（支払いは年間一括4800円税込）を開始しました。</p>
<p>独自ドメインは、GPL.JP というドメインでこれのサブドメイン部分に、junkhack をつけた形です。</p>
<p>で、使えるようにするにはどうしたらいいかってことを簡単に紹介します。</p>
<p>オフィシャルの日本語サポートにも情報があります。</p>
<p><a title="https://ja.support.wordpress.com/domains/" href="https://ja.support.wordpress.com/domains/" target="_blank" rel="noopener noreferrer external" data-wpel-link="external" class="wpel-icon-right">https://ja.support.wordpress.com/domains/<span class="wpel-icon wpel-image wpel-icon-1"></span></a></p>
<p>&nbsp;</p>
<!--noindex--><div class="lwptoc lwptoc-center lwptoc-baseItems lwptoc-white lwptoc-notInherit" data-smooth-scroll="1" data-smooth-scroll-offset="24"><div class="lwptoc_i" style="width:80%">    <div class="lwptoc_header">
        <b class="lwptoc_title" style="font-weight:800;">もくじ</b>                    <span class="lwptoc_toggle">
                <a href="#" class="lwptoc_toggle_label" data-label="表示">非表示</a>            </span>
            </div>
<div class="lwptoc_items lwptoc_items-visible">
    <div class="lwptoc_itemWrap">
<div class="lwptoc_item">    <a href="#mu_ci">
                    <span class="lwptoc_item_number">1</span>
                <span class="lwptoc_item_label">目次</span>
    </a>
    </div>
<div class="lwptoc_item">    <a href="#rejisutoradeDNS_she_ding">
                    <span class="lwptoc_item_number">2</span>
                <span class="lwptoc_item_label">レジストラでDNS設定</span>
    </a>
    </div>
<div class="lwptoc_item">    <a href="#WordPresscom_de_she_ding">
                    <span class="lwptoc_item_number">3</span>
                <span class="lwptoc_item_label">WordPress.com で設定</span>
    </a>
    <div class="lwptoc_itemWrap">
<div class="lwptoc_item">    <a href="#340282366920938463463374607431768211456">
                    <span class="lwptoc_item_number">3.1</span>
                <span class="lwptoc_item_label">340,282,366,920,938,463,463,374,607,431,768,211,456</span>
    </a>
    </div>
<div class="lwptoc_item">    <a href="#zhaotoka_jingtokanomotto_shangno_dumi_fangdesu">
                    <span class="lwptoc_item_number">3.2</span>
                <span class="lwptoc_item_label">（※兆とか京とかのもっと上の読み方です）</span>
    </a>
    </div>
</div>
</div>
</div>
</div>
</div></div>
<!--/noindex--><h3><span id="mu_ci">目次</span></h3>
<p>まず、前提条件としては以下です。</p>
<p>・ドメイン登録は他の会社（お名前コムとかムームードメインなどなど）</p>
<p>・サブドメインを割り当て（abc.example.jp の abc 部分をサブドメインといいます）</p>
<p>&nbsp;</p>
<p>今回のドメインは、他の会社で管理しています。いわゆるレジストラというのはバリュードメインで、今はGMO資本になってブランド名だけ使われています。</p>
<p>レジストラは、無料のDNSをだいたい運営していますのでその設定がWEB上で行えるコントロールパネルが存在するところをお勧めします。昔はDNSも自前で運営していましたがあまり意味がないので今は大手のレジストラのDNSを使っている感じです。</p>
<p>&nbsp;</p>
<h3><span id="rejisutoradeDNS_she_ding">レジストラでDNS設定</span></h3>
<p>サブドメインをこのブログに割り当てるよう、お名前コムとかムームードメインとか自分が取得したレジストラにコンパネがある場合、そこで設定をします。</p>
<p>バリュードメインの場合は、テキストボックス内に以下を記載する感じ。（この簡易的なスタイルが好きです。いちいち、個別にテキスト入力しなくて一括で張り付けられる）</p>
<blockquote><p>ns junkhack ns1.wordpress.com.<br>
ns junkhack ns2.wordpress.com.<br>
ns junkhack ns3.wordpress.com.</p></blockquote>
<p>TTL の時間はキャッシュされますのでしばらく、反映されるまで待ちましょう。</p>
<p>&nbsp;</p>
<h3><span id="WordPresscom_de_she_ding">WordPress.com で設定</span></h3>
<p>ドメインをマッピングしても、主要ドメインをマッピングしたドメインに設定しないとリダイレクトされません。</p>
<p><img fetchpriority="high" decoding="async" style="float:none;margin-left:auto;display:block;margin-right:auto;border:0;" title="domain" src="/wp-content/uploads/2018/10/domain.png" alt="domain" width="899" height="1026" border="0"></p>
<p>以下のような状態にする必要があります。</p>
<p><img decoding="async" style="float:none;margin-left:auto;display:block;margin-right:auto;border:0;" title="domain2" src="/wp-content/uploads/2018/10/domain2.png" alt="domain2" width="639" height="330" border="0"></p>
<p>設定は以上で完了です。</p>
<p>&nbsp;</p>
<p>これで、リダイレクトされます。さらに、リダイレクトするときはHSTS という規格でSSL接続されます。これは想定外だったので、ちょっと得した感じです。</p>
<p>つまり簡単にいえば常時SSL接続されて暗号化通信されています。自分のドメインはSSL証明書とったわけじゃないのに不思議ですね。</p>
<p>&nbsp;</p>
<p><img decoding="async" style="float:none;margin-left:auto;display:block;margin-right:auto;border:0;" title="ssl1" src="/wp-content/uploads/2018/10/ssl1.png" alt="ssl1" width="748" height="407" border="0"></p>
<p>証明書の詳細は以下のように出ています。</p>
<p>&nbsp;</p>
<p><img loading="lazy" decoding="async" style="float:none;margin-left:auto;display:block;margin-right:auto;border:0;" title="ssl2" src="/wp-content/uploads/2018/10/ssl2.png" alt="ssl2" width="600" height="540" border="0"></p>
<p>認証したところは、Let’s Encrypt というCAのようです。</p>
<p>128bit の鍵長で、TLS1.2 のようです。ちなみに、この鍵は、2の128乗、10進法では39桁の数値</p>
<h4 align="center"><span id="340282366920938463463374607431768211456">340,282,366,920,938,463,463,374,607,431,768,211,456</span></h4>
<h4 align="center"><span id="zhaotoka_jingtokanomotto_shangno_dumi_fangdesu">（※兆とか京とかのもっと上の読み方です）</span></h4>
<p>という十分なものです。IPv6アドレスの数と同じですね。</p>
<p>CNのドメインは、tls.automattic.com のようですね。この説明は以下にあります。</p>
<p><a title="https://en.support.wordpress.com/https-ssl/" href="https://en.support.wordpress.com/https-ssl/" target="_blank" rel="noopener noreferrer external" data-wpel-link="external" class="wpel-icon-right">https://en.support.wordpress.com/https-ssl/<span class="wpel-icon wpel-image wpel-icon-1"></span></a></p>
<p><img loading="lazy" decoding="async" style="float:none;margin-left:auto;display:block;margin-right:auto;border:0;" title="ssl3" src="/wp-content/uploads/2018/10/ssl3.png" alt="ssl3" width="611" height="616" border="0"></p>
<p>他のドメインの証明書なのに、ブラウザで安全な接続となるのは、HTTPSレスポンスでStrict-Transport-Security（HSTS）ヘッダーを送信してブラウザが認識するとう内容のようですが、詳細はよく理解できていません。もう少し、コマンドラインのクライアントで詳細を見学してみます。</p>
<p>wget で見てみると以下のようになります。</p>
<blockquote><p>$ wget -S –spider hack.gpl.jp<br>
Spider mode enabled. Check if remote file exists.<br>
–2018-10-18 00:38:23–  <a href="/" data-wpel-link="internal" rel="noopener noreferrer">http://hack.gpl.jp/</a><br>
Resolving hack.gpl.jp… 192.0.78.25, 192.0.78.24<br>
<strong>Connecting to hack.gpl.jp|192.0.78.25|:80</strong>… connected.<br>
HTTP request sent, awaiting response…<br>
HTTP/1.1 301 Moved Permanently<br>
Server: nginx<br>
Date: Wed, 17 Oct 2018 15:38:23 GMT<br>
Content-Type: text/html<br>
Content-Length: 178<br>
Connection: keep-alive<br>
Location: <a href="/" data-wpel-link="internal" rel="noopener noreferrer">https://hack.gpl.jp/</a><br>
X-ac: 3.nrt _bur<br>
Location: <a href="/" data-wpel-link="internal" rel="noopener noreferrer">https://hack.gpl.jp/</a> [following]<br>
Spider mode enabled. Check if remote file exists.<br>
–2018-10-18 00:38:23–  <a href="/" data-wpel-link="internal" rel="noopener noreferrer">https://hack.gpl.jp/</a><br>
<strong>Connecting to hack.gpl.jp|192.0.78.25|:443</strong>… connected.<br>
HTTP request sent, awaiting response…<br>
HTTP/1.1 200 OK<br>
Server: nginx<br>
Date: Wed, 17 Oct 2018 15:38:23 GMT<br>
Content-Type: text/html; charset=UTF-8<br>
Connection: keep-alive<br>
<strong>Strict-Transport-Security: <span style="color:#ff0000;">max-age=86400</span></strong><br>
Vary: Accept-Encoding<br>
Vary: Cookie<br>
X-hacker: If you’re reading this, you should visit automattic.com/jobs and apply to join the fun, mention this header.<br>
Link: &lt;<a href="https://wp.me/1kMA4" data-wpel-link="external" target="_blank" rel="external noopener noreferrer" class="wpel-icon-right">https://wp.me/1kMA4<span class="wpel-icon wpel-image wpel-icon-1"></span></a>&gt;; rel=shortlink<br>
X-ac: 3.nrt _bur<br>
Length: unspecified [text/html]<br>
Remote file exists and could contain further links,<br>
but recursion is disabled — not retrieving.</p></blockquote>
<p>まず初回アクセスは、http アクセスで、hack.gpl.jp へアクセスします。名前解決し、192.0.78.25, 192.0.78.24のいずれかに接続。この時は、192.0.78.25に接続しています。</p>
<p>接続したのは、nginx のWEBサーバのようです。301は恒久的なリダイレクトで、その接続先は、<a href="/" data-wpel-link="internal" rel="noopener noreferrer">https://hack.gpl.jp/</a> です。</p>
<p>SSL接続したときは、Strict-Transport-Security: max-age=86400　というヘッダーがついていますね。1日（86400秒）は、https でSSL接続するというブラウザの挙動（実装による）となるようです。</p>
<p>X-hackerヘッダーがついているのが笑えます。</p>
<p>X-hacker: If you’re reading this, you should visit automattic.com/jobs and apply to join the fun, mention this header.</p>
<p>アクセスすると、以下にリダイレクト</p>
<p><a title="https://automattic.com/work-with-us/" href="https://automattic.com/work-with-us/" data-wpel-link="external" target="_blank" rel="external noopener noreferrer" class="wpel-icon-right">https://automattic.com/work-with-us/<span class="wpel-icon wpel-image wpel-icon-1"></span></a></p>
<p>この中の、happiness engineersってのに興味を覚えました。</p>
<p>この人たちは、以下のような仕事環境のようです。</p>
<p><a title="https://artiss.blog/2017/06/a-day-in-the-life-of-a-vip-wrangler/" href="https://artiss.blog/2017/06/a-day-in-the-life-of-a-vip-wrangler/" data-wpel-link="external" target="_blank" rel="external noopener noreferrer" class="wpel-icon-right">https://artiss.blog/2017/06/a-day-in-the-life-of-a-vip-wrangler/<span class="wpel-icon wpel-image wpel-icon-1"></span></a></p>
<p>楽しそう。<a href="https://p2theme.com/" target="_blank" rel="noopener noreferrer external" data-wpel-link="external" class="wpel-icon-right">P2ブログ<span class="wpel-icon wpel-image wpel-icon-1"></span></a>とか使っているようです。P2 ってブログのテーマなんですが、これがコミュニケーションツールになっているようです。</p>
<p>&nbsp;</p>
<p>で、違うコマンドラインクライアントを使って確認。</p>
<p>まず、curl では、何もオプションをつけないと見れません。</p>
<blockquote>
<p>$ curl -V<br>
curl 7.43.0 (x86_64-apple-darwin15.0) libcurl/7.43.0 SecureTransport zlib/1.2.5</p>
<p>$ curl hack.gpl.jp<br>
&lt;html&gt;<br>
&lt;head&gt;&lt;title&gt;301 Moved Permanently&lt;/title&gt;&lt;/head&gt;<br>
&lt;body bgcolor=”white”&gt;<br>
&lt;center&gt;&lt;h1&gt;301 Moved Permanently&lt;/h1&gt;&lt;/center&gt;<br>
&lt;hr&gt;&lt;center&gt;nginx&lt;/center&gt;<br>
&lt;/body&gt;<br>
&lt;/html&gt;</p>
</blockquote>
<p>tls1.2 で通信すると見えます。</p>
<blockquote><p>$ curl -v –tlsv1.2 <a href="/" data-wpel-link="internal" rel="noopener noreferrer">https://hack.gpl.jp/</a><br>
*   Trying 192.0.78.24…<br>
* Connected to hack.gpl.jp (192.0.78.24) port 443 (#0)<br>
* TLS 1.2 connection using TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256<br>
* Server certificate: tls.automattic.com<br>
* Server certificate: Let’s Encrypt Authority X3<br>
* Server certificate: DST Root CA X3<br>
&gt; GET / HTTP/1.1<br>
&gt; Host: hack.gpl.jp<br>
&gt; User-Agent: curl/7.43.0<br>
&gt; Accept: */*<br>
&gt;<br>
&lt; HTTP/1.1 200 OK<br>
&lt; Server: nginx<br>
&lt; Date: Wed, 17 Oct 2018 18:19:33 GMT<br>
&lt; Content-Type: text/html; charset=UTF-8<br>
&lt; Transfer-Encoding: chunked<br>
&lt; Connection: keep-alive<br>
&lt; Strict-Transport-Security: max-age=86400<br>
&lt; Vary: Accept-Encoding<br>
&lt; Vary: Cookie<br>
&lt; X-hacker: If you’re reading this, you should visit automattic.com/jobs and apply to join the fun, mention this header.<br>
&lt; Link: &lt;<a href="https://wp.me/1kMA4" data-wpel-link="external" target="_blank" rel="external noopener noreferrer" class="wpel-icon-right">https://wp.me/1kMA4<span class="wpel-icon wpel-image wpel-icon-1"></span></a>&gt;; rel=shortlink<br>
&lt; X-ac: 3.nrt _bur<br>
&lt;<br>
&lt;!DOCTYPE html&gt;</p></blockquote>
<blockquote><p>::（略）</p></blockquote>
<p>openssl の s_client を使ってみます。</p>
<blockquote><p>$ openssl s_client -connect hack.gpl.jp:443<br>
CONNECTED(00000003)<br>
depth=2 /C=GB/ST=Greater Manchester/L=Salford/O=COMODO CA Limited/CN=COMODO RSA Certification Authority<br>
verify error:num=20:unable to get local issuer certificate<br>
verify return:0<br>
—<br>
Certificate chain<br>
0 s:/OU=Domain Control Validated/OU=EssentialSSL Wildcard/CN=*.wordpress.com<br>
i:/C=GB/ST=Greater Manchester/L=Salford/O=COMODO CA Limited/CN=COMODO RSA Domain Validation Secure Server CA<br>
1 s:/C=GB/ST=Greater Manchester/L=Salford/O=COMODO CA Limited/CN=COMODO RSA Domain Validation Secure Server CA<br>
i:/C=GB/ST=Greater Manchester/L=Salford/O=COMODO CA Limited/CN=COMODO RSA Certification Authority<br>
2 s:/C=GB/ST=Greater Manchester/L=Salford/O=COMODO CA Limited/CN=COMODO RSA Certification Authority<br>
i:/C=SE/O=AddTrust AB/OU=AddTrust External TTP Network/CN=AddTrust External CA Root<br>
—<br>
Server certificate<br>
—–BEGIN CERTIFICATE—–<br>
MIIG2TCCBcGgAwIBAgIRAKeBC2S1KcGoaQC27YwaCGgwDQYJKoZIhvcNAQELBQAw<br>
gZAxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAO<br>
BgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMTYwNAYD<br>
VQQDEy1DT01PRE8gUlNBIERvbWFpbiBWYWxpZGF0aW9uIFNlY3VyZSBTZXJ2ZXIg<br>
Q0EwHhcNMTgwOTA2MDAwMDAwWhcNMjAwOTA1MjM1OTU5WjBdMSEwHwYDVQQLExhE<br>
b21haW4gQ29udHJvbCBWYWxpZGF0ZWQxHjAcBgNVBAsTFUVzc2VudGlhbFNTTCBX<br>
aWxkY2FyZDEYMBYGA1UEAwwPKi53b3JkcHJlc3MuY29tMIIBIjANBgkqhkiG9w0B<br>
AQEFAAOCAQ8AMIIBCgKCAQEAtX8qlG2EEfbt976zryjdtGbx89fdxpoAUfwTmW6Y<br>
8DY0LCvtejfR3w8kPEO6e3iRwyAmXoDBtA7cU06AsUP3e5cQyoWXcrW3ijsETOd9<br>
aBA58CeCsZJ47KfFxCU91Fijpv1VarlJblydVx1JouEj0HlGqAghLsrDehkQwczs<br>
EwWtz5gOvenRGPIXVw1g/Or/QYv1fwcvOglhOgbKN2HpHnIPOp9RAFbYPWhDC7sc<br>
a4lK2o85siaoe7563fSd+FfsiQ6Ssh4fK2sMqXbWqoyKonem+6rCWdWPvVsIBDH2<br>
8v2HZ6s74CQSeMuAy5CZJOwv8emqlByp9GtuGWECqOgLpwIDAQABo4IDXjCCA1ow<br>
HwYDVR0jBBgwFoAUkK9qOpRaC9iQ6hJWc99DtDoo2ucwHQYDVR0OBBYEFA1qB7w5<br>
rS0dqQtaLzRiiA9WS7X2MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0G<br>
A1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjBPBgNVHSAESDBGMDoGCysGAQQB<br>
sjEBAgIHMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5jb20v<br>
Q1BTMAgGBmeBDAECATBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vY3JsLmNvbW9k<br>
b2NhLmNvbS9DT01PRE9SU0FEb21haW5WYWxpZGF0aW9uU2VjdXJlU2VydmVyQ0Eu<br>
Y3JsMIGFBggrBgEFBQcBAQR5MHcwTwYIKwYBBQUHMAKGQ2h0dHA6Ly9jcnQuY29t<br>
b2RvY2EuY29tL0NPTU9ET1JTQURvbWFpblZhbGlkYXRpb25TZWN1cmVTZXJ2ZXJD<br>
QS5jcnQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTApBgNV<br>
HREEIjAggg8qLndvcmRwcmVzcy5jb22CDXdvcmRwcmVzcy5jb20wggF/BgorBgEE<br>
AdZ5AgQCBIIBbwSCAWsBaQB2AO5Lvbd1zmC64UJpH6vhnmajD35fsHLYgwDEe4l6<br>
qP3LAAABZayjjkoAAAQDAEcwRQIhAKz7RLxwEe2RASIQxFmK0wa5cL+UkxNsca2L<br>
rQY3cOjMAiARjKGfL3sPAj3NaiKaJceVxd2xKIqgVFiyn+nUNLziUQB3AF6nc/nf<br>
VsDntTZIfdBJ4DJ6kZoMhKESEoQYdZaBcUVYAAABZayjjocAAAQDAEgwRgIhAP6F<br>
dPFHxFhI07FV6PGss0u34O3IKh7t5bdInq1yzfGHAiEA2CPZamK6a3DLTOPmdFfk<br>
BVl51AekibMouaopWKH9cAwAdgBVgdTCFpA2AUrqC5tXPFPwwOQ4eHAlCBcvo6od<br>
BxPTDAAAAWWso45sAAAEAwBHMEUCIQChMawM9D4XL9Rty9yIHVt5nSAWlnWO9mUa<br>
5PukI4ogIQIgbbnceypgG1l21iW7p9PKMxG1aVILjVLPyM5bvEX1T/8wDQYJKoZI<br>
hvcNAQELBQADggEBAHs2PmSUv9MLxHibC/FugGZkr9zOgkxEVVtQlNVUZkNPGeGx<br>
017Vwhi37+mNHp8uyT6zTOtKw1YBEDlEKvGWH7L86hK57kP+BdpVkjiuRA7jtVZ/<br>
wVSzD8mUv3IT6YAN3Xe8ZRRm1wkrjgaF8tPVLDC3IAqgq7PRGKF6YMdYdC3VtO4J<br>
pfLhODzOmQEWgHTq/6avc2AkvOCdtOEyJNayEFcGhWGKoSkEXKt3UF5+UPn2XFyO<br>
hSmJErVCPQv6E8iwsAc1ugRZuEubiP0dp1RLiyLoPW8Pmzm2bidp55Tkm7zfqjjk<br>
O4h2j0/57jEg1LPNvtUTFgZr0ULj3tOxoSTmesc=<br>
—–END CERTIFICATE—–<br>
subject=/OU=Domain Control Validated/OU=EssentialSSL Wildcard/CN=*.wordpress.com<br>
issuer=/C=GB/ST=Greater Manchester/L=Salford/O=COMODO CA Limited/CN=COMODO RSA Domain Validation Secure Server CA<br>
—<br>
No client certificate CA names sent<br>
—<br>
SSL handshake has read 4880 bytes and written 456 bytes<br>
—<br>
New, TLSv1/SSLv3, Cipher is AES128-SHA<br>
Server public key is 2048 bit<br>
Secure Renegotiation IS supported<br>
Compression: NONE<br>
Expansion: NONE<br>
SSL-Session:<br>
Protocol  : TLSv1<br>
Cipher    : AES128-SHA<br>
Session-ID: 9E6C6DA392FA51DB27F9AD7538AADF5CC51120F9DA1C3227856758BCE95A315C<br>
Session-ID-ctx:<br>
Master-Key: CCE0E882CEE0E74DF78679DE4829F00B20F39C84A6F538BFA52C8026F7F8438E6A62E848AA0A1DBB4284B2076875B53D<br>
Key-Arg   : None<br>
Start Time: 1539800715<br>
Timeout   : 300 (sec)<br>
Verify return code: 0 (ok)<br>
—</p></blockquote>
<p>証明書は、Wildcard/CN=*.wordpress.com　ということのようですね。これをnginx に設定して、ドメインマッピングしたドメインはHSTS定義されたnginx ホストに渡しているようです。</p>
<p>従来のドメインでアクセスするサーバ（ロードバランサー）と、ドメインからアクセスするサーバとはIPが違います。</p>
<p>まず、従来のドメイン。</p>
<blockquote>
<p>$ dig hack.gpl.jp</p>
<p>::</p>
<p>;; ANSWER SECTION:<br>
hack.gpl.jp.    14400    IN    CNAME    lb.wordpress.com.<br>
lb.wordpress.com.    230    IN    A    192.0.78.12<br>
lb.wordpress.com.    230    IN    A    192.0.78.13</p>
<p>::</p>
</blockquote>
<p>ドメインマッピングされたもの</p>
<blockquote>
<p>$ dig hack.gpl.jp</p>
<p>::</p>
<p>;; ANSWER SECTION:<br>
hack.gpl.jp.    184    IN    A    192.0.78.25<br>
hack.gpl.jp.    184    IN    A    192.0.78.24</p>
<p>::</p>
</blockquote>
<p>内部構成はわかりませんが、パーソナルプランは、保存スペースが3GBから6GBになっていて広告がなくなっています。</p>
<p>リバースプロキシーみたいに使っているのかもしれません。ま、400円でこの構成になるならお得感はあります。一般的なレンタルサーバより確実に可用性はありますし、また自前で１台構成よりぜんぜん安心感が違います。</p>
<p>&nbsp;</p>
<p>WordPress ならではのカスタマイズはまだできませんが、月額2900円のビジネスプランまでアップグレードする価値があるか、随時試してみたいなと思います。チャットで確認しましたが、どうやらオフィシャルのプラグインサイトにないものも、zip 圧縮した開発したプラグインをアップロードして使えるということです。</p>
<p>これはいいですね。</p>
					</div>
<!-- .entry-content -->

			<footer class="entry-footer">
							
			</footer><!-- .entry-footer -->
		</div>
<!-- .entry-wrapper -->
</article><!-- #post-## -->

			
	<nav class="navigation post-navigation" aria-label="投稿">
		<h2 class="screen-reader-text">投稿ナビゲーション</h2>
		<div class="nav-links">
<div class="nav-previous"><a href="/2018/10/17/20181017/" rel="prev noopener noreferrer" data-wpel-link="internal">Linuxエンジニアがサーバを作らず結局、WordPress.com の有料プランに入ることにしたよ</a></div>
<div class="nav-next"><a href="/2018/10/19/consider-wheel-color/" rel="next noopener noreferrer" data-wpel-link="internal">ホイールの色に迷う、画像合成して検討中</a></div>
</div>
	</nav>
			
		
		</main><!-- #main -->
	</div>
<!-- #primary -->


	</div>
<!-- #content -->

	<footer id="colophon" class="site-footer wrap" role="contentinfo">
		<div class="site-info">
			Copyleft - all rights reversed.
			<span class="sep"> | </span>
			JunkHack 2011 - 2024
			<span class="sep"> | </span>
			<a href="/about-junkhack/" data-wpel-link="internal" rel="noopener noreferrer">運営者情報<span class="gf"></span></a><span class="sep"> | </span>
			<a href="/mail/" data-wpel-link="internal" rel="noopener noreferrer">お問い合わせ<span class="gf"></span></a><span class="sep"> | </span>
			<a href="/privacy/" data-wpel-link="internal" rel="noopener noreferrer">プライバシーポリシー<span class="gf"></span></a>
		</div>
<!-- .site-info -->

	</footer><!-- #colophon -->
</div>
<!-- #page -->

    <div id="mouse">
        <div class="inner">
            <h1>Search</h1>
            
                    <form class="uagb-search-wrapper" role="search" action="https://hack.gpl.jp/" method="get">
                        <div class="uagb-search-form__container" role="tablist">

                            <input placeholder="Search" class="uagb-search-form__input aa-input" id="searchbox" type="search" name="s" title="Search" autocomplete="off" spellcheck="false" role="combobox" aria-autocomplete="list" aria-expanded="false" aria-owns="algolia-autocomplete-listbox-0" dir="auto" style="width: 80%;">
                            <pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: normal; text-indent: 0px; text-rendering: auto; text-transform: none;">
                            </pre>
                        </div>
                    </form>

            <table>
                <tr>
                    <td class="divide">
                        <table>
                                <tr>
        <td>
<span class="cmd">g</span> <span class="thn">then</span> <span class="cmd">h</span>
</td>
        <td><span class="help">&rarr; home</span></td>
        <td>Go to front page</td>
    </tr>    
                                    <tr>
        <td>
<span class="cmd">g</span> <span class="thn">then</span> <span class="cmd">l</span>
</td>
        <td><span class="help">&rarr; list</span></td>
        <td>Go to List page</td>
    </tr>    
                                    <tr>
        <td>
<span class="cmd">g</span> <span class="thn">then</span> <span class="cmd">s</span>
</td>
        <td><span class="help">&rarr; search</span></td>
        <td>Go to Search page</td>
    </tr>    
                            </table>                    
                    </td>
                    <td class="divide">
                        <table>
                                <tr>
        <td><span class="cmd">/ or esc</span></td>
        <td><span class="help">&rarr; search</span></td>
        <td>Toggle , Close the search box</td>
    </tr>    
                                    <tr>
        <td><span class="cmd">.</span></td>
        <td><span class="help">&rarr; Focus</span></td>
        <td>Focus the search box</td>
    </tr>    
                                    <tr>
        <td><span class="cmd">Mouse Click</span></td>
        <td><span class="help">&rarr; unFocus</span></td>
        <td>unFocus the search box</td>
    </tr>    
                            </table>
                    
                    </td>
                </tr>
            </table>  
        </div>
    </div>
    <script type="text/javascript">var algolia = {"debug":false,"application_id":"8DCPU3VRUU","search_api_key":"052e9cca1df4182ec607663dc893c235","powered_by_enabled":true,"query":"","autocomplete":{"sources":[{"index_id":"posts_post","index_name":"wp_posts_post","label":"投稿","admin_name":"投稿","position":10,"max_suggestions":10,"tmpl_suggestion":"autocomplete-post-suggestion","enabled":true}],"input_selector":"input[name='s']:not(.no-autocomplete):not(#adminbar-search)"},"indices":{"searchable_posts":{"name":"wp_searchable_posts","id":"searchable_posts","enabled":true,"replicas":[]},"posts_post":{"name":"wp_posts_post","id":"posts_post","enabled":true,"replicas":[]}}};</script>
<script type="text/html" id="tmpl-autocomplete-header">
	<div class="autocomplete-header">
		<div class="autocomplete-header-title">{{{ data.label }}}</div>
		<div class="clear"></div>
	</div>
</script>

<script type="text/html" id="tmpl-autocomplete-post-suggestion">
	<a class="suggestion-link" href="{{ data.permalink }}" title="{{ data.post_title }}">
		<# if ( data.images.thumbnail ) { #>
			<img class="suggestion-post-thumbnail" src="{{ data.images.thumbnail.url }}" alt="{{ data.post_title }}">
		<# } #>
		<div class="suggestion-post-attributes">
			<span class="suggestion-post-title">{{{ data._highlightResult.post_title.value }}}</span>
			<# if ( data._snippetResult['content'] ) { #>
				<span class="suggestion-post-content">{{{ data._snippetResult['content'].value }}}</span>
			<# } #>
		</div>
			</a>
</script>

<script type="text/html" id="tmpl-autocomplete-term-suggestion">
	<a class="suggestion-link" href="{{ data.permalink }}" title="{{ data.name }}">
		<svg viewBox="0 0 21 21" width="21" height="21">
			<svg width="21" height="21" viewBox="0 0 21 21">
				<path
					d="M4.662 8.72l-1.23 1.23c-.682.682-.68 1.792.004 2.477l5.135 5.135c.7.693 1.8.688 2.48.005l1.23-1.23 5.35-5.346c.31-.31.54-.92.51-1.36l-.32-4.29c-.09-1.09-1.05-2.06-2.15-2.14l-4.3-.33c-.43-.03-1.05.2-1.36.51l-.79.8-2.27 2.28-2.28 2.27zm9.826-.98c.69 0 1.25-.56 1.25-1.25s-.56-1.25-1.25-1.25-1.25.56-1.25 1.25.56 1.25 1.25 1.25z"
					fill-rule="evenodd"></path>
			</svg>
		</svg>
		<span class="suggestion-post-title">{{{ data._highlightResult.name.value }}}</span>
	</a>
</script>

<script type="text/html" id="tmpl-autocomplete-user-suggestion">
	<a class="suggestion-link user-suggestion-link" href="{{ data.posts_url }}" title="{{ data.display_name }}">
		<# if ( data.avatar_url ) { #>
			<img class="suggestion-user-thumbnail" src="{{ data.avatar_url }}" alt="{{ data.display_name }}">
		<# } #>
		<span class="suggestion-post-title">{{{ data._highlightResult.display_name.value }}}</span>
	</a>
</script>

<script type="text/html" id="tmpl-autocomplete-footer">
	<div class="autocomplete-footer">
		<div class="autocomplete-footer-branding">
			<a href="#" class="algolia-powered-by-link" title="Algolia">
				<svg width="150px" height="25px" viewbox="0 0 572 64"><path fill="#36395A" d="M16 48.3c-3.4 0-6.3-.6-8.7-1.7A12.4 12.4 0 0 1 1.9 42C.6 40 0 38 0 35.4h6.5a6.7 6.7 0 0 0 3.9 6c1.4.7 3.3 1.1 5.6 1.1 2.2 0 4-.3 5.4-1a7 7 0 0 0 3-2.4 6 6 0 0 0 1-3.4c0-1.5-.6-2.8-1.9-3.7-1.3-1-3.3-1.6-5.9-1.8l-4-.4c-3.7-.3-6.6-1.4-8.8-3.4a10 10 0 0 1-3.3-7.9c0-2.4.6-4.6 1.8-6.4a12 12 0 0 1 5-4.3c2.2-1 4.7-1.6 7.5-1.6s5.5.5 7.6 1.6a12 12 0 0 1 5 4.4c1.2 1.8 1.8 4 1.8 6.7h-6.5a6.4 6.4 0 0 0-3.5-5.9c-1-.6-2.6-1-4.4-1s-3.2.3-4.4 1c-1.1.6-2 1.4-2.6 2.4-.5 1-.8 2-.8 3.1a5 5 0 0 0 1.5 3.6c1 1 2.6 1.7 4.7 1.9l4 .3c2.8.2 5.2.8 7.2 1.8 2.1 1 3.7 2.2 4.9 3.8a9.7 9.7 0 0 1 1.7 5.8c0 2.5-.7 4.7-2 6.6a13 13 0 0 1-5.6 4.4c-2.4 1-5.2 1.6-8.4 1.6Zm35.6 0c-2.6 0-4.8-.4-6.7-1.3a13 13 0 0 1-4.7-3.5 17.1 17.1 0 0 1-3.6-10.4v-1c0-2 .3-3.8 1-5.6a13 13 0 0 1 7.3-8.3 15 15 0 0 1 6.3-1.4A13.2 13.2 0 0 1 64 24.3c1 2.2 1.6 4.6 1.6 7.2V34H39.4v-4.3h21.8l-1.8 2.2c0-2-.3-3.7-.9-5.1a7.3 7.3 0 0 0-2.7-3.4c-1.2-.7-2.7-1.1-4.6-1.1s-3.4.4-4.7 1.3a8 8 0 0 0-2.9 3.6c-.6 1.5-.9 3.3-.9 5.4 0 2 .3 3.7 1 5.3a7.9 7.9 0 0 0 2.8 3.7c1.3.8 3 1.3 5 1.3s3.8-.5 5.1-1.3c1.3-1 2.1-2 2.4-3.2h6a11.8 11.8 0 0 1-7 8.7 16 16 0 0 1-6.4 1.2ZM80 48c-2.2 0-4-.3-5.7-1a8.4 8.4 0 0 1-3.7-3.3 9.7 9.7 0 0 1-1.3-5.2c0-2 .5-3.8 1.5-5.2a9 9 0 0 1 4.3-3.1c1.8-.7 4-1 6.7-1H89v4.1h-7.5c-2 0-3.4.5-4.4 1.4-1 1-1.6 2.1-1.6 3.6s.5 2.7 1.6 3.6c1 1 2.5 1.4 4.4 1.4 1.1 0 2.2-.2 3.2-.7 1-.4 1.9-1 2.6-2 .6-1 1-2.4 1-4.2l1.7 2.1c-.2 2-.7 3.8-1.5 5.2a9 9 0 0 1-3.4 3.3 12 12 0 0 1-5.3 1Zm9.5-.7v-8.8h-1v-10c0-1.8-.5-3.2-1.4-4.1-1-1-2.4-1.4-4.2-1.4a142.9 142.9 0 0 0-10.2.4v-5.6a74.8 74.8 0 0 1 8.6-.4c3 0 5.5.4 7.5 1.2s3.4 2 4.4 3.6c1 1.7 1.4 4 1.4 6.7v18.4h-5Zm12.9 0V17.8h5v12.3h-.2c0-4.2 1-7.4 2.8-9.5a11 11 0 0 1 8.3-3.1h1v5.6h-2a9 9 0 0 0-6.3 2.2c-1.5 1.5-2.2 3.6-2.2 6.4v15.6h-6.4Zm34.4 1a15 15 0 0 1-6.6-1.3c-1.9-.9-3.4-2-4.7-3.5a15.5 15.5 0 0 1-2.7-5c-.6-1.7-1-3.6-1-5.4v-1c0-2 .4-3.8 1-5.6a15 15 0 0 1 2.8-4.9c1.3-1.5 2.8-2.6 4.6-3.5a16.4 16.4 0 0 1 13.3.2c2 1 3.5 2.3 4.8 4a12 12 0 0 1 2 6H144c-.2-1.6-1-3-2.2-4.1a7.5 7.5 0 0 0-5.2-1.7 8 8 0 0 0-4.7 1.3 8 8 0 0 0-2.8 3.6 13.8 13.8 0 0 0 0 10.3c.6 1.5 1.5 2.7 2.8 3.6s2.8 1.3 4.8 1.3c1.5 0 2.7-.2 3.8-.8a7 7 0 0 0 2.6-2c.7-1 1-2 1.2-3.2h6.2a11 11 0 0 1-2 6.2 15.1 15.1 0 0 1-11.8 5.5Zm19.7-1v-40h6.4V31h-1.3c0-3 .4-5.5 1.1-7.6a9.7 9.7 0 0 1 3.5-4.8A9.9 9.9 0 0 1 172 17h.3c3.5 0 6 1.1 7.9 3.5 1.7 2.3 2.6 5.7 2.6 10v16.8h-6.4V29.6c0-2.1-.6-3.8-1.8-5a6.4 6.4 0 0 0-4.8-1.8c-2 0-3.7.7-5 2a7.8 7.8 0 0 0-1.9 5.5v17h-6.4Zm63.8 1a12.2 12.2 0 0 1-10.9-6.2 19 19 0 0 1-1.8-7.3h1.4v12.5h-5.1v-40h6.4v19.8l-2 3.5c.2-3.1.8-5.7 1.9-7.7a11 11 0 0 1 4.4-4.5c1.8-1 3.9-1.5 6.1-1.5a13.4 13.4 0 0 1 12.8 9.1c.7 1.9 1 3.8 1 6v1c0 2.2-.3 4.1-1 6a13.6 13.6 0 0 1-13.2 9.4Zm-1.2-5.5a8.4 8.4 0 0 0 7.9-5c.7-1.5 1.1-3.3 1.1-5.3s-.4-3.8-1.1-5.3a8.7 8.7 0 0 0-3.2-3.6 9.6 9.6 0 0 0-9.2-.2 8.5 8.5 0 0 0-3.3 3.2c-.8 1.4-1.3 3-1.3 5v2.3a9 9 0 0 0 1.3 4.8 9 9 0 0 0 3.4 3c1.4.7 2.8 1 4.4 1Zm27.3 3.9-10-28.9h6.5l9.5 28.9h-6Zm-7.5 12.2v-5.7h4.9c1 0 2-.1 2.9-.4a4 4 0 0 0 2-1.4c.4-.7.9-1.6 1.2-2.7l8.6-30.9h6.2l-9.3 32.4a14 14 0 0 1-2.5 5 8.9 8.9 0 0 1-4 2.8c-1.5.6-3.4.9-5.6.9h-4.4Zm9-12.2v-5.2h6.4v5.2H248Z"></path><path fill="#003DFF" d="M534.4 9.1H528a.8.8 0 0 1-.7-.7V1.8c0-.4.2-.7.6-.8l6.5-1c.4 0 .8.2.9.6v7.8c0 .4-.4.7-.8.7zM428 35.2V.8c0-.5-.3-.8-.7-.8h-.2l-6.4 1c-.4 0-.7.4-.7.8v35c0 1.6 0 11.8 12.3 12.2.5 0 .8-.4.8-.8V43c0-.4-.3-.7-.6-.8-4.5-.5-4.5-6-4.5-7zm106.5-21.8H528c-.4 0-.7.4-.7.8v34c0 .4.3.8.7.8h6.5c.4 0 .8-.4.8-.8v-34c0-.5-.4-.8-.8-.8zm-17.7 21.8V.8c0-.5-.3-.8-.8-.8l-6.5 1c-.4 0-.7.4-.7.8v35c0 1.6 0 11.8 12.3 12.2.4 0 .8-.4.8-.8V43c0-.4-.3-.7-.7-.8-4.4-.5-4.4-6-4.4-7zm-22.2-20.6a16.5 16.5 0 0 1 8.6 9.3c.8 2.2 1.3 4.8 1.3 7.5a19.4 19.4 0 0 1-4.6 12.6 14.8 14.8 0 0 1-5.2 3.6c-2 .9-5.2 1.4-6.8 1.4a21 21 0 0 1-6.7-1.4 15.4 15.4 0 0 1-8.6-9.3 21.3 21.3 0 0 1 0-14.4 15.2 15.2 0 0 1 8.6-9.3c2-.8 4.3-1.2 6.7-1.2s4.6.4 6.7 1.2zm-6.7 27.6c2.7 0 4.7-1 6.2-3s2.2-4.3 2.2-7.8-.7-6.3-2.2-8.3-3.5-3-6.2-3-4.7 1-6.1 3c-1.5 2-2.2 4.8-2.2 8.3s.7 5.8 2.2 7.8 3.5 3 6.2 3zm-88.8-28.8c-6.2 0-11.7 3.3-14.8 8.2a18.6 18.6 0 0 0 4.8 25.2c1.8 1.2 4 1.8 6.2 1.7s.1 0 .1 0h.9c4.2-.7 8-4 9.1-8.1v7.4c0 .4.3.7.8.7h6.4a.7.7 0 0 0 .7-.7V14.2c0-.5-.3-.8-.7-.8h-13.5zm6.3 26.5a9.8 9.8 0 0 1-5.7 2h-.5a10 10 0 0 1-9.2-14c1.4-3.7 5-6.3 9-6.3h6.4v18.3zm152.3-26.5h13.5c.5 0 .8.3.8.7v33.7c0 .4-.3.7-.8.7h-6.4a.7.7 0 0 1-.8-.7v-7.4c-1.2 4-4.8 7.4-9 8h-.1a4.2 4.2 0 0 1-.5.1h-.9a10.3 10.3 0 0 1-7-2.6c-4-3.3-6.5-8.4-6.5-14.2 0-3.7 1-7.2 3-10 3-5 8.5-8.3 14.7-8.3zm.6 28.4c2.2-.1 4.2-.6 5.7-2V21.7h-6.3a9.8 9.8 0 0 0-9 6.4 10.2 10.2 0 0 0 9.1 13.9h.5zM452.8 13.4c-6.2 0-11.7 3.3-14.8 8.2a18.5 18.5 0 0 0 3.6 24.3 10.4 10.4 0 0 0 13 .6c2.2-1.5 3.8-3.7 4.5-6.1v7.8c0 2.8-.8 5-2.2 6.3-1.5 1.5-4 2.2-7.5 2.2l-6-.3c-.3 0-.7.2-.8.5l-1.6 5.5c-.1.4.1.8.5 1h.1c2.8.4 5.5.6 7 .6 6.3 0 11-1.4 14-4.1 2.7-2.5 4.2-6.3 4.5-11.4V14.2c0-.5-.4-.8-.8-.8h-13.5zm6.3 8.2v18.3a9.6 9.6 0 0 1-5.6 2h-1a10.3 10.3 0 0 1-8.8-14c1.4-3.7 5-6.3 9-6.3h6.4zM291 31.5A32 32 0 0 1 322.8 0h30.8c.6 0 1.2.5 1.2 1.2v61.5c0 1.1-1.3 1.7-2.2 1l-19.2-17a18 18 0 0 1-11 3.4 18.1 18.1 0 1 1 18.2-14.8c-.1.4-.5.7-.9.6-.1 0-.3 0-.4-.2l-3.8-3.4c-.4-.3-.6-.8-.7-1.4a12 12 0 1 0-2.4 8.3c.4-.4 1-.5 1.6-.2l14.7 13.1v-46H323a26 26 0 1 0 10 49.7c.8-.4 1.6-.2 2.3.3l3 2.7c.3.2.3.7 0 1l-.2.2a32 32 0 0 1-47.2-28.6z"></path></svg>
			</a>
		</div>
	</div>


<script type="text/html" id="tmpl-autocomplete-empty">
	<div class="autocomplete-empty">
		クエリにマッチした結果はありません		<span class="empty-query">"{{ data.query }}"</span>
	</div>
</script>

<script type="text/javascript">
	window.addEventListener('load', function () {

		/* Initialize Algolia client */
		var client = algoliasearch( algolia.application_id, algolia.search_api_key );

		/**
		 * Algolia hits source method.
		 *
		 * This method defines a custom source to use with autocomplete.js.
		 *
		 * @param object $index Algolia index object.
		 * @param object $params Options object to use in search.
		 */
		var algoliaHitsSource = function( index, params ) {
			return function( query, callback ) {
				index
					.search( query, params )
					.then( function( response ) {
						callback( response.hits, response );
					})
					.catch( function( error ) {
						callback( [] );
					});
			}
		}

		/* Setup autocomplete.js sources */
		var sources = [];
		algolia.autocomplete.sources.forEach( function( config, i ) {
			var suggestion_template = wp.template( config[ 'tmpl_suggestion' ] );
			sources.push( {
				source: algoliaHitsSource( client.initIndex( config[ 'index_name' ] ), {
					hitsPerPage: config[ 'max_suggestions' ],
					attributesToSnippet: [
						'content:10'
					],
					highlightPreTag: '__ais-highlight__',
					highlightPostTag: '__/ais-highlight__'
				} ),
				templates: {
					header: function () {
						return wp.template( 'autocomplete-header' )( {
							label: _.escape( config[ 'label' ] )
						} );
					},
					suggestion: function ( hit ) {
						if ( hit.escaped === true ) {
							return suggestion_template( hit );
						}
						hit.escaped = true;

						for ( var key in hit._highlightResult ) {
							/* We do not deal with arrays. */
							if ( typeof hit._highlightResult[ key ].value !== 'string' ) {
								continue;
							}
							hit._highlightResult[ key ].value = _.escape( hit._highlightResult[ key ].value );
							hit._highlightResult[ key ].value = hit._highlightResult[ key ].value.replace( /__ais-highlight__/g, '<em>' ).replace( /__\/ais-highlight__/g, '<\/em>' );
						}

						for ( var key in hit._snippetResult ) {
							/* We do not deal with arrays. */
							if ( typeof hit._snippetResult[ key ].value !== 'string' ) {
								continue;
							}

							hit._snippetResult[ key ].value = _.escape( hit._snippetResult[ key ].value );
							hit._snippetResult[ key ].value = hit._snippetResult[ key ].value.replace( /__ais-highlight__/g, '<em>' ).replace( /__\/ais-highlight__/g, '<\/em>' );
						}

						return suggestion_template( hit );
					}
				}
			} );

		} );

		/* Setup dropdown menus */
		document.querySelectorAll( algolia.autocomplete.input_selector ).forEach( function( element ) {

			var config = {
				debug: algolia.debug,
				hint: false,
				openOnFocus: true,
				appendTo: 'body',
				templates: {
					empty: wp.template( 'autocomplete-empty' )
				}
			};

			if ( algolia.powered_by_enabled ) {
				config.templates.footer = wp.template( 'autocomplete-footer' );
			}

			/* Instantiate autocomplete.js */
			var autocomplete = algoliaAutocomplete( element, config, sources )
				.on( 'autocomplete:selected', function ( e, suggestion ) {
					/* Redirect the user when we detect a suggestion selection. */
					window.location.href = suggestion.permalink ?? suggestion.posts_url; // Users use the `posts_url` property instead of `permalink`.
				} );

			/* Force the dropdown to be re-drawn on scroll to handle fixed containers. */
			window.addEventListener( 'scroll', function() {
				if ( autocomplete.autocomplete.getWrapper().style.display === "block" ) {
					autocomplete.autocomplete.close();
					autocomplete.autocomplete.open();
				}
			} );
		} );

		var algoliaPoweredLink = document.querySelector( '.algolia-powered-by-link' );
		if ( algoliaPoweredLink ) {
			algoliaPoweredLink.addEventListener( 'click', function( e ) {
				e.preventDefault();
				window.location = "https://www.algolia.com/?utm_source=WordPress&utm_medium=extension&utm_content=" + window.location.hostname + "&utm_campaign=poweredby";
			} );
		}
	});
</script>
<link rel="stylesheet" id="lwptoc-main-css" href="/wp-content/plugins/luckywp-table-of-contents/front/assets/main.min.css?ver=2.1.4" type="text/css" media="all">
<script type="text/javascript" src="/wp-content/themes/jh-hew/js/JankHack-Hew.js?ver=20140909" id="JankHack-Hew-scripts-js"></script>
<script type="text/javascript" src="/wp-content/themes/jh-hew/js/navigation.js?ver=20120206" id="JankHack-Hew-navigation-js"></script>
<script type="text/javascript" src="/wp-content/themes/jh-hew/js/skip-link-focus-fix.js?ver=20130115" id="JankHack-Hew-skip-link-focus-fix-js"></script>
<script type="text/javascript" src="/wp-content/themes/jh-hew/js/contact.js?ver=20210612" id="sendmail-js"></script>
<script type="text/javascript" src="/wp-includes/js/underscore.min.js?ver=1.13.4" id="underscore-js"></script>
<script type="text/javascript" id="wp-util-js-extra">
/* <![CDATA[ */
var _wpUtilSettings = {"ajax":{"url":"\/wp-admin\/admin-ajax.php"}};
/* ]]> */
</script>
<script type="text/javascript" src="/wp-includes/js/wp-util.min.js?ver=6.6.2" id="wp-util-js"></script>
<script type="text/javascript" src="/wp-content/plugins/wp-search-with-algolia/js/algoliasearch/dist/algoliasearch-lite.umd.js?ver=2.8.1" id="algolia-search-js"></script>
<script type="text/javascript" src="/wp-content/plugins/wp-search-with-algolia/js/autocomplete.js/dist/autocomplete.min.js?ver=2.8.1" id="algolia-autocomplete-js"></script>
<script type="text/javascript" src="/wp-content/plugins/wp-search-with-algolia/js/autocomplete-noconflict.js?ver=2.8.1" id="algolia-autocomplete-noconflict-js"></script>
<script type="text/javascript" src="/wp-includes/js/clipboard.min.js?ver=2.0.11" id="clipboard-js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs//emojify.js/1.1.0/js/emojify.min.js?ver=1.1.0" id="emojify-js"></script>
<script type="text/javascript" id="wpfront-scroll-top-js-extra">
/* <![CDATA[ */
var wpfront_scroll_top_data = {"data":{"css":"#wpfront-scroll-top-container{display:none;position:fixed;cursor:pointer;z-index:9999;opacity:0}#wpfront-scroll-top-container div.text-holder{padding:3px 10px;border-radius:3px;-webkit-border-radius:3px;-webkit-box-shadow:4px 4px 5px 0 rgba(50,50,50,.5);-moz-box-shadow:4px 4px 5px 0 rgba(50,50,50,.5);box-shadow:4px 4px 5px 0 rgba(50,50,50,.5)}#wpfront-scroll-top-container a{outline-style:none;box-shadow:none;text-decoration:none}#wpfront-scroll-top-container {right: 20px;bottom: 20px;}        #wpfront-scroll-top-container img {\n            width: auto;\n            height: auto;\n        }\n        ","html":"<div id=\"wpfront-scroll-top-container\"><img src=\"\/wp-content\/plugins\/wpfront-scroll-top\/images\/icons\/1.png\" alt=\"\" title=\"\" \/><\/div>","data":{"hide_iframe":false,"button_fade_duration":200,"auto_hide":false,"auto_hide_after":2,"scroll_offset":100,"button_opacity":0.80000000000000004,"button_action":"top","button_action_element_selector":"","button_action_container_selector":"html, body","button_action_element_offset":"0","scroll_duration":400}}};
/* ]]> */
</script>
<script type="text/javascript" src="/wp-content/plugins/wpfront-scroll-top/js/wpfront-scroll-top.min.js?ver=2.2.10081" id="wpfront-scroll-top-js"></script>
<script type="text/javascript" src="/wp-content/plugins/luckywp-table-of-contents/front/assets/main.min.js?ver=2.1.4" id="lwptoc-main-js"></script>
  <script id="module-flowchart">(function($) { $(function() { if (typeof $.fn.flowChart !== "undefined") { if ($(".language-flow").length > 0) { $(".language-flow").parent("pre").attr("style", "text-align: center; background: none;"); $(".language-flow").addClass("flowchart").removeClass("language-flow"); $(".flowchart").flowChart(); } } }); })(jQuery);</script>  <script id="module-katex"> (function($) { $(function() { if (typeof katex !== "undefined") { if ($(".language-katex").length > 0) { $(".language-katex").parent("pre").attr("style", "text-align: center; background: none;"); $(".language-katex").addClass("katex-container").removeClass("language-katex"); $(".katex-container").each(function() { var katexText = $(this).text(); var el = $(this).get(0); if ($(this).parent("code").length == 0) { try { katex.render(katexText, el) } catch (err) { $(this).html("<span class='err'>" + err) } } }); } if ($(".katex-inline").length > 0) { $(".katex-inline").each(function() { var katexText = $(this).text(); var el = $(this).get(0); if ($(this).parent("code").length == 0) { try { katex.render(katexText, el) } catch (err) { $(this).html("<span class='err'>" + err) } } }); } } }); })(jQuery); </script>  <script id="module-sequence-diagram">(function($) { $(function() { if (typeof $.fn.sequenceDiagram !== "undefined") { $(".language-sequence").parent("pre").attr("style", "text-align: center; background: none;"); $(".language-seq").parent("pre").attr("style", "text-align: center; background: none;"); $(".language-sequence").addClass("sequence-diagram").removeClass("language-sequence"); $(".language-seq").addClass("sequence-diagram").removeClass("language-seq"); $(".sequence-diagram").sequenceDiagram({ theme: "simple" }); } }); })(jQuery);</script>  <script id="module-mermaid">(function($) { $(function() { if (typeof mermaid !== "undefined") { if ($(".language-mermaid").length > 0) { $(".language-mermaid").parent("pre").attr("style", "text-align: center; background: none;"); $(".language-mermaid").addClass("mermaid").removeClass("language-mermaid"); mermaid.init(); } } }); })(jQuery);</script>  <script id="module-mathjax">(function($) { $(function() { if (typeof MathJax !== "undefined") { var c = $(".language-mathjax").length; if (c > 0) { $(".language-mathjax").each(function(i) { var content = $(this).html(); if ($(this).hasClass("mathjax-inline")) { $(this).html("$ " + content + " $"); } else { $(this).html("$$" + "\n" + content + "\n" + "$$"); } if (i + 1 === c) { MathJax.Hub.Config({ showProcessingMessages: false, messageStyle: "none", extensions: [ "tex2jax.js", "TeX/mediawiki-texvc.js", "TeX/noUndefined.js", "TeX/autoload-all.js", "TeX/AMSmath.js", "TeX/AMSsymbols.js" ], jax: [ "input/TeX", "output/SVG" ], elements: document.getElementsByClassName("language-mathjax"), tex2jax: { skipTags: [ "script", "noscript", "style", "textarea" ], inlineMath: [ ['$', '$'] ], displayMath: [ ['$$', '$$'] ], processClass: "language-mathjax" } }); MathJax.Hub.Queue(["Typeset", MathJax.Hub]); $(".language-mathjax").attr("style", "background: transparent; border: 0;"); $(".language-mathjax").closest("pre").attr("style", "background: transparent; border: 0;"); } }); } else { console.log("[wp-githuber-md] MathJax code blocks not found."); } } else { console.log("[wp-githuber-md] MathJax is not loadded."); } }); })(jQuery);</script>  <script id="module-clipboard">(function($) { $(function() { var pre = document.getElementsByTagName("pre"); var pasteContent = document.getElementById("paste-content"); var hasLanguage = false; for (var i = 0; i < pre.length; i++) { var codeClass = pre[i].children[0].className; var isLanguage = codeClass.indexOf("language-"); var excludedCodeClassNames = [ "language-katex", "language-seq", "language-sequence", "language-flow", "language-flowchart", "language-mermaid", ]; var isExcluded = excludedCodeClassNames.indexOf(codeClass); if (isExcluded !== -1) { isLanguage = -1; } if (isLanguage !== -1) { var current_pre = pre[i]; var parent = current_pre.parentNode; var div = document.createElement("div"); div.style['position'] = 'relative'; parent.replaceChild(div, current_pre); var button = document.createElement("button"); button.className = "copy-button"; button.textContent = "Copy"; div.appendChild(current_pre); div.appendChild(button); hasLanguage = true; } }; if (hasLanguage) { var copyCode = new ClipboardJS(".copy-button", { target: function(trigger) { return trigger.previousElementSibling; } }); copyCode.on("success", function(event) { event.clearSelection(); event.trigger.textContent = "Copied"; window.setTimeout(function() { event.trigger.textContent = "Copy"; }, 2000); }); } }); })(jQuery);</script> 
			<script id="module-emojify">(function($) {
					$(function() {
						if (typeof emojify !== "undefined") {
							emojify.setConfig({
								img_dir: "https://cdnjs.cloudflare.com/ajax/libs//emojify.js/1.1.0/images/basic",
								blacklist: {
									"classes": ["no-emojify"],
									"elements": ["script", "textarea", "pre", "code"]
								}
							});
							emojify.run();
						} else {
							console.log("[wp-githuber-md] emogify is undefined.");
						}
					});
				})(jQuery);</script>
		<style>.lwptoc .lwptoc_i{border:1px solid #aaaaaa;}.lwptoc_header{color:#232323;}.lwptoc .lwptoc_i A{color:#3d3d3d;}.lwptoc .lwptoc_i A:hover,.lwptoc .lwptoc_i A:focus,.lwptoc .lwptoc_i A:active{color:#0a0a0a;border-color:#0a0a0a;}.lwptoc .lwptoc_i A:visited{color:#5b5b5b;}</style>
</body>
</html>