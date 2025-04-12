draw_self()
if instance_exists(o_player) == true
{
	if o_player.y > y and place_meeting(x,y,o_player) == true
	{
		depth = o_player.depth + 1
	}	

	if o_player.y < y and place_meeting(x,y,o_player) == true
	{
		depth = o_player.depth - 1
	}	
}

