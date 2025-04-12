//receive damage
get_damaged(oDamageEnemy)


//death
if hp <= 0
{
	//add to the total amount of enemies killed
	global.enemyKillCount++;
	
	instance_destroy(self);
}	
