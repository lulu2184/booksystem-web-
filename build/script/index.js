function books_page(){
	document.getElementById("embed_page").src="jsp/books.jsp"
}

function orders_page(){

}

function summary_page() {

}

function login_page(){
	//console.log("login");
	document.getElementById("embed_page").src="html/login.html";
}

function logout(){
	document.getElementById("embed_page").src="jsp/logout.jsp";
}

function register_page(){
	document.getElementById("embed_page").src="jsp/register.jsp";
}

function users_page(){
	console.log("a");
	document.getElementById("embed_page").src="jsp/users.jsp";
}