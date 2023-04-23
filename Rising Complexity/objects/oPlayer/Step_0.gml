// get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x, y + 1, oWall)) && (key_jump)
{
	vsp = -8;
}

// horizontal collision
if (place_meeting(x + hsp, y, oWall))
{
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// vertical collision
if (place_meeting(x, y + vsp, oWall))
{
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// level changing
if (place_meeting(x, y, oDoor)) && (place_meeting(x, y + 1, oWall))
{
	level = level + 1;
	room_goto_next()
}

// animations
/**if (vsp != 0) {
	if (hsp < 0) {
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}
	sprite_index = sPlayerA;
	image_speed = 1;
} else if (hsp != 0) {
	if (hsp < 0) {
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}
	sprite_index = sPlayerR;
	image_speed = 2;
} else {
	image_xscale = 1;
	sprite_index = sPlayer;
	image_speed = 1;
}
**/

if (vsp != 0) {
	/**if (hsp < 0) {
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}**/
	sprite_index = sPlayerA;
	image_speed = 1;
}
else if (hsp > 0) {
	image_xscale = 1;
	sprite_index = sPlayerR;
	image_speed = 2;
} else if (hsp < 0) {
	image_xscale = -1;
	sprite_index = sPlayerR;
	image_speed = 2;
} else {
	image_xscale = 1;
	sprite_index = sPlayer;
	image_speed = 1;
}

