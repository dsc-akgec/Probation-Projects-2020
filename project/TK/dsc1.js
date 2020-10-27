/*/function myFunction() {
  var x = document.getElementById("mytopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
document.querySelector(".icon").addEventListener("click", myFunction);/*/
$(document).ready(function(){
	$('.icon').click(function(){
		$('.topnav ul li').toggleClass('responsive')
	})
})


var index=0;
show();
function show(){
	var i;
	var slides=document.getElementsByClassName("slide");
	for(i=0;i<slides.length;i++){
		slides[i].style.display="none";
	}
	index=index+1;
	if(index>slides.length){
		index=1;
	}
	slides[index-1].style.display="block";
	setTimeout(show,3000);
}
var index1=0;
show1();
function show1(){
	var j;
	var slides1=document.getElementsByClassName("slide1");
	for(j=0;j<slides1.length;j++){
		slides1[j].style.display="none";
	}
	index1=index1+1;
	if(index1>slides1.length){
		index1=1;
	}
	slides1[index1-1].style.display="block";
	setTimeout(show1,1000);
}
var index2=0;
show2();
function show2(){
	var j;
	var slides2=document.getElementsByClassName("slide2");
	for(j=0;j<slides2.length;j++){
		slides2[j].style.display="none";
	}
	index2=index2+1;
	if(index2>slides2.length){
		index2=1;
	}
	slides2[index1-1].style.display="block";
	setTimeout(show2,1000);
}

function appdev() {
  var x = document.getElementById("app");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
function webdev() {
  var x = document.getElementById("web");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
function machinelearning() {
  var x = document.getElementById("machine");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
function management() {
  var x = document.getElementById("manage");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

