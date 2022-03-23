var showconfi3 = false ,showstatusi3 = false ,showgrubconfig = false;

function showi3conf(){
	if(showconfi3 == false){
		var x = document.getElementById("i3conf");
		x.style.display = "block";
		showconfi3 = true;}
	else{
		var x = document.getElementById("i3conf");
		x.style.display = "none";
        showconfi3 = false;}
}

function showi3status(){
	if(showstatusi3 == false){
		var x = document.getElementById("i3status");
		x.style.display = "block";
		showstatusi3 = true;}
	else{
		var x = document.getElementById("i3status");
		x.style.display = "none";
		showstatusi3 = false;}
}

function showGRUB(){
	if(showgrubconfig == false){
		var x = document.getElementById("grubconfig");
		x.style.display = "block";
		showgrubconfig= true;}
	else{
		var x = document.getElementById("grubconfig");
		x.style.display = "none";
		showgrubconfig= false;}
}

function InstallArch() {
	showInstallArch();
	hideStartup();
	hideGit();
	hideBuild();
	hideCompile();}
		
function Startup() {
	hideInstallArch();
	showStartup();  
	hideGit();
	hideBuild();
	hideCompile();}
		
function Git() {
	hideInstallArch();
	hideStartup();
	showGit();
	hideBuild();
	hideCompile();}
		
function Build() {
	hideInstallArch();
	hideStartup();
	hideGit();
	showBuild();
	hideCompile();}

function Compile() {
	hideInstallArch();
	hideStartup();
	hideGit();
	hideBuild();
	showCompile();}
		
function hideInstallArch(){
	var x = document.getElementById("arch");
	x.style.display = "none";}
		
function showInstallArch(){
	var x = document.getElementById("arch");
	x.style.display = "block";}

function hideStartup(){
	var x = document.getElementById("startup");
	x.style.display = "none";}
	
function showStartup(){
	var x = document.getElementById("startup");
	x.style.display = "block";}

function hideGit(){
	var x = document.getElementById("git");
	x.style.display = "none";}
		
function showGit(){
	var x = document.getElementById("git");
	x.style.display = "block";}

function hideBuild(){
	var x = document.getElementById("build");
	x.style.display = "none";}
		
function showBuild(){
	var x = document.getElementById("build");
	x.style.display = "block";}

function hideCompile(){
    var x = document.getElementById("compile");
	x.style.display = "none";}
		
function showCompile(){
	var x = document.getElementById("compile");
	x.style.display = "block";}