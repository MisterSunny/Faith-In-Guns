if instance_exists(o_player)
{
	cx = camera_get_view_x(view_camera[0])
	cy = camera_get_view_y(view_camera[0])

	switch(global.camera_mode){
		case cammode.follow_object:
			if(!instance_exists(following)) break;
			cx = following.x - (view_w/2);
			cy = following.y - (view_h/2);
		break;
	
		case cammode.follow_mouse_peek:
			cx = lerp(following.x, mouse_x, 0.25)-(view_w/2);
			cy = lerp(following.y, mouse_y, 0.25)-(view_h/2);

	}


	camera_set_view_pos(view_camera[0], cx, cy);
}