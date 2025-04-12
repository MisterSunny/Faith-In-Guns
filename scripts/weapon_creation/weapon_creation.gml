//constructor template for weapons
function create_weapon( _sprite = s_revolver, _weaponlength, _bulletObj, _cooldown, _bulletNum = 1, _spread = 0,_maxammo ) constructor
{
	sprite = _sprite;
	length = _weaponlength;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	maxammo = _maxammo;
}	

//the weapons

global.WeaponList = {
	
	revolver : new create_weapon(
		s_revolver,
		sprite_get_bbox_left( s_revolver ) - sprite_get_xoffset( s_revolver ),
		o_Bullet,
		60,
		1,
		0,
		6
		),
	
	winchester : new create_weapon(
		s_revolver,
		sprite_get_bbox_left( s_revolver ) - sprite_get_xoffset( s_revolver ),
		o_Bullet,
		60*2,
		1,
		0,
		8
		),
		
	shootgun : new create_weapon(
		s_revolver,
		sprite_get_bbox_left( s_revolver ) - sprite_get_xoffset( s_revolver ),
		o_Bullet,
		60*2.5,
		5,
		45,
		4
		),
	
	}

