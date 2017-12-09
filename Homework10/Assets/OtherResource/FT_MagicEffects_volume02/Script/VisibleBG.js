var myCheck : boolean = true;
var BG : GameObject;

function OnMouseDown () {
	if(myCheck == true){
	BG.SetActiveRecursively(false); 
	myCheck = false;
	return myCheck;}
	if(myCheck == false){
	BG.SetActiveRecursively(true);
	myCheck = true; }
	return myCheck;}
