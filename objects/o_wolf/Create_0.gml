
// get damage and dying
event_inherited();

get_damaged_create(5);

spd = 0.1;
chaseSpd = 0.3
dir = 0;
xspd = 0;
yspd = 0;


face = 1
//state machine
state = 0;

	//spawn from spawner state
	fadeSpd = 1/5;
	emergeSpd = 0.3;

	//shooting state
	cooldownTime = 7*60;
	shootTimer = irandom(cooldownTime);
	windupTime = 120;
	recoverTime = 60;
	bulletInst = noone;
	
	bulletXoff = 5;
	bulletYoff = -8;
	

