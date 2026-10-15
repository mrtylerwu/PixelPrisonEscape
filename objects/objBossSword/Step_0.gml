if(!instance_exists(owner)){
	instance_destroy()
	exit
}
orbit_angle+=spin_speed
x=owner.x + lengthdir_x(orbit_distance,orbit_angle)
y=owner.y + lengthdir_y(orbit_distance,orbit_angle)
image_angle = -orbit_angle