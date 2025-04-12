//damage setup
	get_damaged_create(15, true); //хп + iframes



//variables for movement-------------------------------------------------
	moveDir = 0;
	moveSpd = 1.5;
	xspd = 0;
	yspd = 0;
	stand = false


//sprite control---------------------------------------------------------
	centerYOffset = 0;
	centerY = y + centerYOffset; //set in step event
	
	weaponOffsetDist = 12;
	aimDir = 0;

	face = 15;
	sprite[0] = move_right
	sprite[1] = move_upright
	sprite[2] = move_up
	sprite[3] = move_upleft
	sprite[4] = move_left
	sprite[5] = move_downleft
	sprite[6] = move_down
	sprite[7] = move_downright
	sprite[8] = stand_right
	sprite[9] = stand_upright
	sprite[10] = stand_up
	sprite[11] = stand_upleft
	sprite[12] = stand_left
	sprite[13] = stand_downleft
	sprite[14] = stand_down
	sprite[15] = stand_downright


	


//weapon info
	shootTimer = 0;

		
	weapon = global.WeaponList.revolver

	
	
	
	

