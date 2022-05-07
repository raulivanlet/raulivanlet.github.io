
//Help make partitions
function Lsblk(){
	var1 = document.getElementById("textInput").value;
	if(var1 == "sda"){
		document.getElementById("cgdisk").innerHTML = "cgdisk /dev/" + var1;
		document.getElementById("cgdisk1").innerHTML = "mkfs.fat -F32 /dev/" + var1 + "1";
		document.getElementById("cgdisk2").innerHTML = "mkswap /dev/" + var1 + "2";
		document.getElementById("cgdisk3").innerHTML = "mkfs.ext4 /dev/" + var1 + "3";
		document.getElementById("cgdisk4").innerHTML = "mount /dev/" + var1 + "3 /mnt";
		document.getElementById("cgdisk5").innerHTML = "swapon /dev/" + var1 + "2";
		document.getElementById("cgdisk6").innerHTML = "mount /dev/" + var1 + "1 /mnt/boot";
	}
	else{
		document.getElementById("cgdisk").innerHTML = "cgdisk /dev/" + var1;
		document.getElementById("cgdisk1").innerHTML = "mkfs.fat -F32 /dev/" + var1 + "p1";
		document.getElementById("cgdisk2").innerHTML = "mkswap /dev/" + var1 + "p2";
		document.getElementById("cgdisk3").innerHTML = "mkfs.ext4 /dev/" + var1 + "p3";
		document.getElementById("cgdisk4").innerHTML = "mount /dev/" + var1 + "p3 /mnt";
		document.getElementById("cgdisk5").innerHTML = "swapon /dev/" + var1 + "p2";
		document.getElementById("cgdisk6").innerHTML = "mount /dev/" + var1 +"p1 /mnt/boot";
	}
}


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