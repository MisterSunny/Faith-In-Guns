

//get inputs
rightKey = global.rightKey;
leftKey = global.leftKey;
upKey = global.upKey;
downKey = global.downKey;
shootKey = global.shootKey;


//player movement
#region
	//get the direction-------------------------------------------------------
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	moveDir = point_direction( 0, 0, _horizKey, _vertKey );
	
	//get the x and y speeds--------------------------------------------------
	var _spd = 0;
	var _inputLevel = point_distance(0, 0, _horizKey, _vertKey);
	_inputLevel = clamp( _inputLevel, 0, 1);
	_spd = moveSpd * _inputLevel;
	
	xspd = lengthdir_x(_spd, moveDir);
	yspd = lengthdir_y(_spd, moveDir);
	
	//collision---------------------------------------------------------------
	if place_meeting(x + xspd, y, oWall_Original) == true
	{
		xspd = 0;
	}	
	if place_meeting(x, y + yspd, oWall_Original) == true
	{
		yspd = 0;
	}
	
	
	//move the player---------------------------------------------------------
	x += xspd
	y += yspd
#endregion

//get damaged
get_damaged(oDamagePlayer, true);


//sprite control
#region
	//player aiming
		centerY = y + centerYOffset;
	//aim
		aimDir = point_direction(x, centerY, mouse_x, mouse_y);
	//check if player facing the correct direction
		if stand == true
		{
			face = round(aimDir/45);
			if face == 8 { face = 0; };	
		}	

	//animate
		if xspd == 0 && yspd == 0
		{
			stand = true
			face = round(aimDir/45)+8;
			if face == 16 { face = 8; };
		}	

	//set the player sprite
	sprite_index = sprite[face];
#endregion	


//shoot weapon
if shootTimer > 0 { shootTimer--; };
if shootKey && shootTimer <= 0
{
	//reset the timer
		shootTimer = weapon.cooldown;
	
	
	//shooting
	//create the bullet
		var _xOffset = lengthdir_x( weapon.length + weaponOffsetDist, aimDir );
		var _yOffset = lengthdir_y( weapon.length + weaponOffsetDist, aimDir );
		var _spread = weapon.spread;
		var _spreadDiv = _spread / max( weapon.bulletNum-1, 1); 
		
		//create the correct number of bullets
		for ( var i = 0; i < weapon.bulletNum; i++ )
		{
			var _bulletInst = instance_create_depth( x + _xOffset + i, centerY + _yOffset - 3 ,depth, weapon.bulletObj )
	
			//change the bullet's dir
			with( _bulletInst )
			{
				dir = other.aimDir - _spread/2 + _spreadDiv*i; 
				
				//turn the bullet in correct dir
				if dirFix == true
				{
					image_angle = dir;
				}
			}
		}	
}	


//death / game over
if hp <= 0
{
	//destroy self
	global.camera_mode = cammode.follow_object;
	instance_create_depth(x,y,depth,o_gameover_screen)
	instance_destroy(self);
	exit;
}	
	
