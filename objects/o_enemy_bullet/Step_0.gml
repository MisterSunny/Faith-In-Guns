switch( state )
{
	//wait for enemy shoot state
	case 0:
		if instance_exists(o_player)
		{
			dir = point_direction(x,y,o_player.x,o_player.y);
		}	
		//set depth to make more visible
		depth = -y - 50;
		
	
	break;
	
	//shoot / travel
	case 1:
		xspd = lengthdir_x( spd, dir);
		yspd = lengthdir_y( spd, dir);
		x += xspd;
		y += yspd;
		
		depth = -y;
	break;	
	
}

	//hit confirm destroy
	if hitConfirm == true and playerDestroy == true { destroy = true; };
	//destroy
	if destroy == true { instance_destroy(); }	
	//collision
	if place_meeting(x ,y, oWall_Original ) { destroy = true;}
	//bullet out of range
	if point_distance( xstart, ystart, x, y ) > maxDist { destroy = true; }