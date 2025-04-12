//get the player's hp info
if instance_exists(o_player)
{
	playerHp = o_player.hp;
	playerMaxHp = o_player.maxHp;
} else {
	playerHp = 0;
}	