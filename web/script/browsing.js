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
		var c_info=document.createElement("input");
		c_info.setAttribute("type","hidden");
		c_info.setAttribute("name","columns_" + row.toString());
		c_info.setAttribute("value",col.toString());
		array[cnt++]=c_info;
		array[cnt++]=document.createElement("br");
		var bracket=document.createElement("span");
		bracket.innerHTML="(";
		array[cnt++]=bracket;
		row++;
		col=1;
	}else{
		col++;
	}
	var select=document.createElement("select");
	select.setAttribute("type","option");
	select.setAttribute("name", "condition_left_" + row.toString() + "_" + col.toString());
	select.innerHTML="<option value=\"0\">author</option>"
					+"<option value=\"1\">publisher</option>"
					+"<option value=\"2\">title word</option>"
					+"<option value=\"3\">subject</option>";
	array[cnt++]=select;
	var eq=document.createElement("span");
	eq.innerHTML="<p>=</p>";
	array[cnt++]=eq;
	var input=document.createElement("input");
	input.setAttribute("type", "text");
	input.setAttribute("name", "condition_right_" + row.toString() + "_" + col.toString());
	input.setAttribute("class", "browsing-input");
	array[cnt++]=input;
	return array;
}

function add_and(){
	if (check_notnull() == false){
		return false;
	}
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
	var c_info=document.createElement("input");
	c_info.setAttribute("type","hidden");
	c_info.setAttribute("name","columns_" + row.toString());
	c_info.setAttribute("value",col.toString());
	form.appendChild(c_info);
	var word=document.createElement("span");
	word.innerHTML="<p>Order by:</p>";
	form.appendChild(word);
	var select=document.createElement("select");
	select.setAttribute("type","option");
	select.setAttribute("name","order_type");
	select.innerHTML="<option value=\"1\">publish year</option>"
					+"<option value=\"2\">average score of feedbacks</option>"
					+"<option value=\"3\">average score of feedbacks of trusted users</option>";
	form.appendChild(select);
	form.appendChild(document.createElement("br"));
	var button=document.createElement("input");
	button.setAttribute("type", "submit");
	form.appendChild(button);
	var info=document.createElement("input");
	info.setAttribute("type", "hidden");
	info.setAttribute("name", "rows");
	info.setAttribute("value", row.toString());
	form.appendChild(info);
}