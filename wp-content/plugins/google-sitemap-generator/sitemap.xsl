<?xml version="1.0" encoding="UTF-8"?><html><body><stylesheet version="1.0" xmlns:html="http://www.w3.org/TR/REC-html40" xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<output method="html" version="1.0" encoding="UTF-8" indent="yes"></output>
	<template match="/">
		
			
				<title>XML Sitemap</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
				<style type="text/css">body {
						font-family:"Lucida Grande","Lucida Sans Unicode",Tahoma,Verdana;
						font-size:13px;
					}
					
					#intro {
						background-color:#cfebf7;
						border:1px #2580B2 solid;
						padding:5px 13px 5px 13px;
						margin:10px;
					}
					
					#intro p {
						line-height:16.8667px;
					}
					#intro strong {
						font-weight:normal;
					}
					
					td {
						font-size:11px;
					}
					
					th {
						text-align:left;
						padding-right:30px;
						font-size:11px;
					}
					
					tr.high {
						background-color:whitesmoke;
					}
					
					#footer {
						padding:2px;
						margin-top:10px;
						font-size:8pt;
						color:gray;
					}
					
					#footer a {
						color:gray;
					}
					
					a {
						color:black;
					}</style>
			
			
				<apply-templates></apply-templates>
				<div id="footer">
					<p>
						Dynamically generated with <a rel="external nofollow" href="https://auctollo.com/products/google-xml-sitemap-generator/" title="XML Sitemap Generator for Google">XML Sitemap Generator for Google</a> by <a rel="external nofollow" href="https://auctollo.com/">Auctollo</a>. This XSLT template is released under the GPL and free to use.
            		</p>
            		<p>
	                    If you have problems with your sitemap please visit the <a rel="external nofollow" href="https://auctollo.com/products/google-xml-sitemap-generator/help/" title="Frequently Asked Questions">FAQ</a> or the <a rel="external nofollow" href="https://wordpress.org/support/plugin/google-sitemap-generator">support forum</a>.
            		</p>
				</div>
			
		
	</template>
	
	
	<template match="sitemap:urlset">
        <h1>XML Sitemap</h1>
        <div id="intro">
            <p>
                This XML sitemap is used by search engines which follow the <a rel="external nofollow" href="https://sitemaps.org/">XML sitemap standard</a>.
            </p>
            <p>
                This file was dynamically generated using the <a rel="external nofollow" href="https://wordpress.org/">WordPress</a> content management system and <strong><a rel="external nofollow" href="https://auctollo.com/" title="XML Sitemap Generator for Google">XML Sitemap Generator for Google</a></strong> by <a rel="external nofollow" href="https://auctollo.com/">Auctollo</a>.
            </p>
            <p>
                
            </p>
        </div>
		<div id="content">
			<table cellpadding="5">
				<tr style="border-bottom:1px black solid;">
					<th>URL</th>
					<th>Priority</th>
					<th>Change frequency</th>
					<th>Last modified (GMT)</th>
				</tr>
				<variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"></variable>
				<variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"></variable>
				<for-each select="./sitemap:url">
					<tr>
						<if test="position() mod 2 != 1">
							<attribute name="class">high</attribute>
						</if>
						<td>
							<variable name="itemURL">
								<value-of select="sitemap:loc"></value-of>
							</variable>
							<a href="/wp-content/plugins/google-sitemap-generator/{$itemURL}">
								<value-of select="sitemap:loc"></value-of>
							</a>
						</td>
						<td>
							<value-of select="concat(sitemap:priority*100,'%')"></value-of>
						</td>
						<td>
							<value-of select="concat(translate(substring(sitemap:changefreq, 1, 1),concat($lower, $upper),concat($upper, $lower)),substring(sitemap:changefreq, 2))"></value-of>
						</td>
						<td>
							<value-of select="sitemap:lastmod"></value-of>
						</td>
					</tr>
				</for-each>
			</table>
		</div>
	</template>
	
	
	<template match="sitemap:sitemapindex">
        <h1>XML Sitemap Index</h1>
        <div id="intro">
            <p>
                This XML sitemap is used by search engines which follow the <a rel="external nofollow" href="https://sitemaps.org/">XML sitemap standard</a>. This file contains links to sub-sitemaps, follow them to see the actual sitemap content.
            </p>
            <p>
                This file was dynamically generated using the <a rel="external nofollow" href="https://wordpress.org/">WordPress</a> content management system and <strong><a rel="external nofollow" href="https://auctollo.com/products/google-xml-sitemap-generator/" title="XML Sitemap Generator for Google">XML Sitemap Generator for Google</a></strong> by <a rel="external nofollow" href="https://auctollo.com/">Auctollo</a>.
            </p>
        </div>
		<div id="content">
			<table cellpadding="5">
				<tr style="border-bottom:1px black solid;">
					<th>URL of sub-sitemap</th>
					<th>Last modified (GMT)</th>
				</tr>
				<for-each select="./sitemap:sitemap">
					<tr>
						<if test="position() mod 2 != 1">
							<attribute name="class">high</attribute>
						</if>
						<td>
							<variable name="itemURL">
								<value-of select="sitemap:loc"></value-of>
							</variable>
							<a href="/wp-content/plugins/google-sitemap-generator/{$itemURL}">
								<value-of select="sitemap:loc"></value-of>
							</a>
						</td>
						<td>
							<value-of select="sitemap:lastmod"></value-of>
						</td>
					</tr>
				</for-each>
			</table>
		</div>
	</template>
</stylesheet></body></html>