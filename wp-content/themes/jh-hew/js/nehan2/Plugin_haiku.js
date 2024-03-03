/*
 source : haiku.js
 about : add <haiku> element to nehan parser.
 version : 1.0
 site : http://tatebu.com/
 blog : http://tatebu.com/haiku

 Copyright (c) 2012, Takehiko Ishizaka <take@tatebu.com>
 licenced under MIT licence.
*/
var Nehan = Nehan || {};

if(!Nehan.Plugin){
  Nehan.Plugin_haiku = {};
}

(function(){
  var Plugin = {
	defineHaikuElement : function(provider){
		//  <haiku>を読み込んだ時の処理
		provider.setElementHandler("haiku", function(proxy, tag){
			proxy.startFont({
			  scale:5,
			  bgcolor:"#F8F4E6",
			  "border-radius":3,
			  "border-style":"solid",
			  "border-width":"4px",
			  "border-color":"#E6B422"
			});
			proxy.startFont({
			  scale:1.4,
			  family:"BIZUDMincho",
			  color:"#595857",
			  weight:"normal"
			});
			// 半角スペース抽入（上方向の余白）
			proxy.pushChar("&nbsp;");
		});
		// define </haiku>.
		provider.setElementHandler("/haiku", function(proxy, tag){
			proxy.endFont();
			proxy.pushChar("&nbsp;");
			proxy.endFont();
			proxy.skipCRLF();
			proxy.pushLine();
			proxy.pushSpaceLine(Math.floor(proxy.getLayout().baseExtraLineSize * 1.4));
		});
	}
  };

  Nehan.Plugin_haiku = Plugin;
})();
