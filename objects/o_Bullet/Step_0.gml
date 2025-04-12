
//move
	xspd = lengthdir_x( spd, dir )
	yspd = lengthdir_y( spd, dir )
	


if destroy == false
{
	x += xspd;
	y += yspd;
}

//cleanup
	
	//hit confirm destroy
		if hitConfirm == true and enemyDestroy == true { destroy = true; };

	//destroy
		if destroy == true { instance_destroy(); };
		
	//collision
		if place_meeting(x ,y, oWall_Original ) { destroy = true;}
		
	//bullet out of range
		if point_distance( xstart, ystart, x, y ) > maxDist
		{
			destroy = true;
		}

