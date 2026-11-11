package com.zigron.gazuntite.logging
{
	public class MessageFormat
	{
		public static var HEADER_ENT:String		= "&lt;html&gt;&lt;head&gt;&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;/&gt;&lt;title&gt;Logs&lt;/title&gt;&lt;style type=&quot;text/css&quot;&gt;body, html {padding: 10px;margin: 0;font-family: Arial;font-size: 12px;}div {padding: 10px;margin: 5px 0;border: 1px solid #000000;white-space:normal;}div.warn {background: yellow;}div.error {background: orange;}div.debug {background: #C2EFE9;}div.info {background: #EFFFFD;}div.fatal {background: #ff0000;color: #ffffff;font-weight: bold;}&lt;/style&gt;&lt;script type=&quot;text/javascript&quot;&gt;function toggle(type) {var divs = document.getElementsByTagName(&quot;div&quot;);if (type == &quot;*&quot;) {for (var i=0; i&lt;divs.length; i++) {divs[i].style.display = &quot;block&quot;;}} else {for (var j=0; j&lt;divs.length; j++) {divs[j].style.display = &quot;none&quot;;}for (var k=0; k&lt;divs.length; k++) {if (divs[k].className.toLowerCase() == type) {divs[k].style.display = &quot;block&quot;;}}}}&lt;/script&gt;&lt;/head&gt;";
		public static var HEADER:String			= '<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/><title>Logs</title><style type="text/css">body, html {padding: 10px;margin: 0;font-family: Arial;font-size: 12px;}div {padding: 10px;margin: 5px 0;border: 1px solid #000000;white-space:normal; }div.warn {background: orange;}div.error {background: red;color:white;font-weight: bold;}div.debug {background: #ccffcc;}div.info {background: #66ccff;}div.fatal {background: #cc0033;color: #ffffff;font-weight: bold;}</style><script type="text/javascript">function toggle(type) {var divs = document.getElementsByTagName("div");if (type == "*") {for (var i=0; i<divs.length; i++) {divs[i].style.display = "block";}} else {for (var j=0; j<divs.length; j++) {divs[j].style.display = "none";}for (var k=0; k<divs.length; k++) {if (divs[k].className.toLowerCase() == type) {divs[k].style.display = "block";}}}}</script></head>';
		
		public static var BODY_ENT:String		= "&lt;body&gt;&lt;p&gt;Logging initialized on: {0} &lt;/p&gt;&lt;p&gt;Filter:&lt;select onchange=&quot;toggle(this.value)&quot;&gt;&lt;option value=&quot;*&quot;&gt;All Types&lt;/option&gt;&lt;option value=&quot;info&quot;&gt;Info&lt;/option&gt;&lt;option value=&quot;debug&quot;&gt;Debug&lt;/option&gt;&lt;option value=&quot;warn&quot;&gt;Warning&lt;/option&gt;&lt;option value=&quot;error&quot;&gt;Error&lt;/option&gt;&lt;option value=&quot;fatal&quot;&gt;Fatal&lt;/option&gt;&lt;/select&gt;&lt;/p&gt;";
		public static var BODY:String			= "<body><p>Logging initialized on: {0} </p><p>Filter:<select onchange='toggle(this.value)'><option value='*'>All Types</option><option value='info'>Info</option><option value='debug'>Debug</option><option value='warn'>Warning</option><option value='error'>Error</option><option value='fatal'>Fatal</option></select></p>";
		
		public static var CLOSING_ENT:String	= "&lt;/body&gt;&lt;/html&gt;"; 
		public static var CLOSING:String		= '</body></html>'; 
		
		public static var MESSAGE_ENT:String	= "&lt;div class=&quot;{1}&quot;&gt;{0}&lt;/div&gt;"
		public static var MESSAGE:String		= '<div class="{1}">{0}</div>'; 
		
	}
}