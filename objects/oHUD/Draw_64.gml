draw_set_font( Font1 );

var _camX = camera_get_view_x( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );

//draw health bar
draw_sprite(Sprite33,0,health_x,health_y);
draw_sprite_stretched(Sprite32,0,health_x,health_y,(playerHp/playerMaxHp) * healthbar_width, healthbar_height)

//draw health numver
var _hpString = string(playerHp) + "|" + string(playerMaxHp);
draw_text( 53, 5, _hpString );

//draw score
var _enemyCountStr = "score:" + string(global.enemyKillCount*10)
draw_text(8,25, _enemyCountStr);