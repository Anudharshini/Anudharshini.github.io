function userSession() {
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var status = parseInt(xhttp.responseText);
			/*
			 * if (status == 0) { window.location.href = "index.jsp"; }
			 */

			if (status == 1)
				window.location.href = "admin.jsp";
			else if(status == 2)
				window.location.href = "userhome.jsp";
			else if(status == 3)
				window.location.href = "nomineehome.jsp";
		}
	};
	xhttp.open("GET", "CheckLogin", true);
	xhttp.send();
}

function sessionvalidate() {
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var status = parseInt(xhttp.responseText);
			if (status == 0) {
				window.location.href = "index.jsp";
			}
			/*
			 * else { if(status==1) window.location.href="admin.jsp"; else
			 * window.location.href="userhome.jsp"; }}
			 */
		}
	};
	xhttp.open("GET", "CheckLogin", true);
	xhttp.send();
}
