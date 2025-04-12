//code commands
var _wallcollisions = true;
var _getDamage = true;

//state machine
switch( state )
{
	//spawn in the spawner
	case -1:
	
		//fade in 
		if image_alpha < 1
		{
			spd = 0
			image_alpha += fadeSpd;
		}	
		//walk out
		_wallcollisions = false;
		_getDamage = false;
		if image_alpha >= 1
		{
			spd = emergeSpd;
			dir = 270;
		}	
	
		if !place_meeting(x,y,oWall_Original) //&& !place_meeting(x,y,o_enemyParent)
		{
			state = 0
		}	
	
	break;
	
	
	
	//chaze state
	case 0:
		//chase code
		//get player's dir
		if instance_exists(o_player)
		{
			dir = point_direction(x,y,o_player.x,o_player.y);
		}	
		spd = chaseSpd;
		
		//transition to shooting state
		var _camLeft = camera_get_view_x( view_camera[0] );
		var _camRight = _camLeft + camera_get_view_width( view_camera[0] );
		var _camTop = camera_get_view_y( view_camera[0] );
		var _camBottom = _camTop + camera_get_view_height( view_camera[0] );
		
		
		//get only if on screen
		if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
		{
			shootTimer++;
		}
		
		if shootTimer > cooldownTime
		{
			state = 1

			//reset timer
			shootTimer = 0;
		}	
			
	
	break;
	//pause and shoot
	case 1:
	#region
		if instance_exists(o_player)
		{
			dir = point_direction(x,y,o_player.x,o_player.y);
		}	
		
		//shoot the bullet
		shootTimer++;
		
		if shootTimer == 1
		{
			bulletInst = instance_create_depth(x+bulletXoff, y+bulletYoff,depth, o_enemy_bullet );
		}	
		
		//keep the bullet
		if shootTimer <= windupTime && instance_exists(bulletInst)
		{
			bulletInst.x = x + bulletXoff
			bulletInst.y = y + bulletYoff
		}	
			
		
		if shootTimer == windupTime && instance_exists( bulletInst )
		{
			//set bullet state
			bulletInst.state = 1;						
		}	
		
		//recover and return to chasing
		if shootTimer > windupTime + recoverTime
		{
			state = 0;
			//reset the timer
			shootTimer = 0;
		}
		
	break;
	#endregion
	break;
	
}	


//chase the player
	//getting speeds
	xspd = lengthdir_x( spd, dir);
	yspd = lengthdir_y( spd, dir);
	
	
	//wall collisions
	if _wallcollisions == true
		{
			if place_meeting(x + xspd, y, oWall_Original )
			{
				xspd = 0;
			}	
			if place_meeting(x, y + yspd, oWall_Original )
			{
				yspd = 0;
			}	
		}
	//enemy collisions
	
	if place_meeting(x + xspd, y, o_enemyParent )
		{
			xspd = 0;
		}	
		if place_meeting(x, y + yspd, o_enemyParent )
		{
			yspd = 0;
		}	
	
	//moving
	x += xspd
	y += yspd
	
	//set the depth
	depth = -y;
	
	if _getDamage == true
	{
		// get damage and dying
		event_inherited();
	}	


