show_debug_message("ALARM 1 FIRED")
var bullet_object
if(max_health<=75){
	bullet_object = objBossBullet2
}
else{
	bullet_object = objBossBullet1
}
for (var dir = 0; dir < 360; dir+=60){
	var bullet = instance_create_layer(x ,y ,"Instances",bullet_object)
	bullet.direction = dir
	bullet.speed = 6
}
alarm[1] = bullet_interval