//drawing the player's weapon
function draw_my_weapon()
{
	//draw the weapon
	//get the weapon off the player's body
	var _xOffset = lengthdir_x( weaponOffsetDist, aimDir );
	var _yOffset = lengthdir_y( weaponOffsetDist, aimDir );
	
	//flip the weapon
	var _weaponYscl = 1;
	if aimDir > 90 and aimDir < 270
	{
		_weaponYscl = -1
		
	}	
	draw_sprite_ext(weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, image_alpha);
}	

//damage calc
	//damage create event
	function get_damaged_create( _hp = 10, _iframes = false)
	{
		maxHp = _hp;
		hp = _hp;
		
		//get the iframes
		if _iframes == true
		{
			iframeTimer = 0;
			iframeNumber = 140;
		}	
		
		//create the damage list
		if _iframes == false
		{
			damageList = ds_list_create();
		}
	}	
	
	//damage clean up event
	function get_damage_cleanup()
	{
		//DO NOT NEED IF WE ARE USING IFRAMES
		
		//delete our dmg list data to free memory
		ds_list_destroy(damageList);
	}	
	
	//damage step event
	function get_damaged( _damageObj, _iframes = false )
	{
		//special exit for iframe timer
		if _iframes == true && iframeTimer > 0
		{
			iframeTimer--;
			
			if iframeTimer mod 8 == 0
			{
				if image_alpha == 1
				{
					image_alpha = 0;
				} else {
					image_alpha = 1;
				}
			}	

			exit;
		}	
		
		//make sure the iframe blinking stops
		if _iframes == true
		{
			image_alpha = 1;
		}
		
		//receive damage
		if place_meeting( x, y, _damageObj )
		{
				//getting a list of the damage instances
				var _instList = ds_list_create();
				instance_place_list( x, y, _damageObj, _instList, false );
	
				//get the size of our list
				var _listSize = ds_list_size( _instList );
				
				//loop through the list
				var _hitConfirm = false;
	
				for( var i = 0; i < _listSize; i++ )
				{
					//get dmg obj from the list
					var _inst = ds_list_find_value( _instList, i )
				
					//check if this inst is already in dmg list
					if _iframes == true or ds_list_find_index( damageList, _inst ) == -1
					{
						//add the new dmg inst to the damage list
						if _iframes == false
						{
							ds_list_add( damageList, _inst);
						}
						
						//take dmg from spec inst
						hp -= _inst.damage;
						_hitConfirm = true
						//tell dmg inst to destroy it has impacted
						_inst.hitConfirm = true;
					}	
				}	
				
				//set iframes if we were hit
				if _iframes == true && _hitConfirm == true
				{
					iframeTimer = iframeNumber
				}	
			
				//free memory by destroying the list
				ds_list_destroy( _instList )
		}	
	
		//clear the damage list of obj that don't exist or aren't touching
		if _iframes == false
		{
			var _damageListSize = ds_list_size(damageList);
			for (var i = 0; i < _damageListSize; i++ )
			{
				var _inst = ds_list_find_value( damageList, i );
				if !instance_exists( _inst ) or !place_meeting(x,y,_inst)
				{
					ds_list_delete( damageList, i );
					i--;
					_damageListSize--;
				}
			}
		}
	}	