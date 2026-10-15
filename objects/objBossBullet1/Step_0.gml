var hit = instance_place(x,y,all)
if (hit!=noone){
	if(hit!=objBoss and hit.solid){
		instance_destroy()
	}
}