timer++

//reset timer when enemy limits have been reached
if instance_number(o_enemyParent) >= global.activeEnemyMax or global.totalEnemiesSpawned >= global.enemyRoomMax 
{
	timer = 0;
}	
	
	
	
	
if timer >= spawnTime && !place_meeting(x,y+16,o_enemyParent)
{
	//spawn enemy
	var _inst = instance_create_depth(x,y,depth-1,o_wolf)
	with(_inst)
	{
		//make enemy invisible
		image_alpha = 0
		state = -1
	}
	//reset the timer
	timer = 0;
}	