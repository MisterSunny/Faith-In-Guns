get_damaged( oDamageParent, false );

if hp <= 0
{
	instance_destroy(self);
}

image_index = (hp-1)

depth = -bbox_top