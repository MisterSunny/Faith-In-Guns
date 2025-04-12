
enum cammode {
	follow_object,
	follow_mouse_peek,
}	


global.camera_mode = cammode.follow_mouse_peek
following = o_player;

view_w = camera_get_view_width(view_camera[0])
view_h = camera_get_view_height(view_camera[0])