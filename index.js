
function MenuButton1() {
	ShowMenuButton1();
	HideMenuButton2();
	HideMenuButton3();
	HideMenuButton4();
	HideMenuButton5();}
		
function MenuButton2() {
	HideMenuButton1();
	ShowMenuButton2();  
	HideMenuButton3();
	HideMenuButton4();
	HideMenuButton5();}
		
function MenuButton3() {
	HideMenuButton1();
	HideMenuButton2();
	ShowMenuButton3();
	HideMenuButton4();
	HideMenuButton5();}
		
function MenuButton4() {
	HideMenuButton1();
	HideMenuButton2();
	HideMenuButton3();
	ShowMenuButoon4();
	HideMenuButton5();}

function MenuButton5() {
	HideMenuButton1();
	HideMenuButton2();
	HideMenuButton3();
	HideMenuButton4();
	ShowMenuButton5();}
		
function HideMenuButton1(){
	var x = document.getElementById("menu1");
	x.style.display = "none";}
		
function ShowMenuButton1(){
	var x = document.getElementById("menu1");
	x.style.display = "block";}

function HideMenuButton2(){
	var x = document.getElementById("menu2");
	x.style.display = "none";}
	
function ShowMenuButton2(){
	var x = document.getElementById("menu2");
	x.style.display = "block";}

function HideMenuButto3(){
	var x = document.getElementById("menu3");
	x.style.display = "none";}
		
function ShowMenuButton3(){
	var x = document.getElementById("menu3");
	x.style.display = "block";}

function HideMenuButton4(){
	var x = document.getElementById("menu4");
	x.style.display = "none";}
		
function ShowMenuButoon4(){
	var x = document.getElementById("menu4");
	x.style.display = "block";}

function HideMenuButton5(){
    var x = document.getElementById("menu5");
	x.style.display = "none";}
		
function ShowMenuButton5(){
	var x = document.getElementById("menu5");
	x.style.display = "block";}