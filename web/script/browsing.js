var row=1;
var col=1;

function check_notnull(){
	//console.log("check");
	var form = document.getElementById("condition_form").elements;
	//console.log(form.length);
	for (var i=0;i<form.length;i++){
		var element=form[i];
		if (element.value==""){
			console.log(element);
			alert("Empty feild is not valid.");
			return false;
		}
	}
	return true;
}

function getElements(type){
	var array=new Array();
	var aa=document.createElement("span");
	var cnt=0;
	if (type==0){
		aa.innerHTML="<p>AND</p>";
	}else{
		aa.innerHTML="<p>OR</p>";
	}
	array[cnt++]=aa;
	if (type==1){
		var br=document.createElement("br");
		array[cnt++]=br;
		var bracket=document.createElement("span");
		bracket.innerHTML="(";
		array[cnt++]=bracket;
	}
	var select=document.createElement("select");
	select.setAttribute("type","option");
	select.setAttribute("name", "condition_left" + row.toString() + col.toString());
	select.innerHTML="<option value=\"author\">author</option>"
					+"<option value=\"publisher\">publisher</option>"
					+"<option value=\"title\">title word</option>"
					+"<option value=\"subject\">subject</option>";
	array[cnt++]=select;
	var eq=document.createElement("span");
	eq.innerHTML="<p>=</p>";
	array[cnt++]=eq;
	var input=document.createElement("input");
	input.setAttribute("type", "text");
	input.setAttribute("name", "condition_right" + row.toString() + col.toString());
	input.setAttribute("class", "browsing-input");
	array[cnt++]=input;
	return array;
}

function add_and(){
	if (check_notnull() == false){
		return false;
	}
	col++;
	var pos=document.getElementById("and_button");
	var addElement = getElements(0);
	for (var i=0;i<addElement.length;i++){
		var ele=addElement[i];
		pos.parentNode.insertBefore(ele ,pos);
	}
}

function add_or(){
	if (check_notnull()==false){
		return false;
	}
	col=1;
	row=row+1;
	var pos=document.getElementById("or_button");
	var addElement = getElements(1);
	for (var i=0;i<addElement.length;i++){
		var ele=addElement[i];
		pos.parentNode.insertBefore(ele ,pos);
	}	
	var oldAnd = document.getElementById("and_button");
	var newAnd = oldAnd.cloneNode(true);
	document.getElementById("condition_form").removeChild(oldAnd);
	pos.parentNode.insertBefore(newAnd, pos);
	var bracket=document.createElement("span");
	bracket.innerHTML=")";
	pos.parentNode.insertBefore(bracket, pos);
	var br=document.createElement("br");
	pos.parentNode.insertBefore(br, pos);
}

function finish_action(){
	if (check_notnull() == false){
		return false;
	}
	var form=document.getElementById("condition_form");
	form.removeChild(document.getElementById("and_button"));
	//var oldOr = document.getElementById("or_button");
	form.removeChild(document.getElementById("or_button"));
	form.removeChild(document.getElementById("finish"));
	for (var i=0;i<form.length;i++){
		var e=form[i];
		e.setAttribute("readonly", "true");
	}
	var word=document.createElement("span");
	word.innerHTML="<p>Order by:</p>";
	form.appendChild(word);
	var select=document.createElement("select");
	select.setAttribute("type","option");
	select.setAttribute("name","order_type");
	select.innerHTML="<option value=\"author\">author</option>"
					+"<option value=\"score\">average score of feedbacks</option>"
					+"<option value=\"trusted\">average score of feedbacks of trusted users</option>";
	form.appendChild(select);
	form.appendChild(document.createElement("br"));
	var button=document.createElement("input");
	button.setAttribute("type", "submit");
	form.appendChild(button);
}