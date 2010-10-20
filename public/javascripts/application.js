// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function limiter() {
	// body...
	var count = 140 //document.getElementById('counter').innerHTML;
	var tex = document.getElementById('micropost_content').value;
	var len = tex.length;
	if (len > count) {
		tex = tex.substring(0,count);
		document.getElementById('micropost_content').value = tex;
		return false;
	};
	//count = count-len
 	//alert(count);
	document.getElementById('counter').innerHTML = count-len;
	
}