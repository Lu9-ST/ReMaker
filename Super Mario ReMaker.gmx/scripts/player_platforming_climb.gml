/* player_platforming_climb()
//=====================================================//
This script handles the main movement of the player 
object while is climbing.
//=====================================================*/

firing = 0; //This will stop the firing animation.
isrun = 0; //Makes the player stop from running.
crouch = 0
taunt = 0

//Makes the player able to run.
if (bugfix2 > 0)
    bugfix2 -= 1

//Makes the player hang out of the vine.
if (hangout >= 19)
{
    canhang = 2;
    state = 2;
    alarm[6] = 1;
    alarm[7] = 12;
}
//Makes the player face left.
if (keyboard_check(vk_right)
&& bugfix2 = 0)
{
    hangout += 1;
    xscale2 = -1;
}
//Makes the player face right.
else if (keyboard_check(vk_left)
&& bugfix2 = 0)
{
    hangout += 1;
    xscale2 = 1;
}
else
    hangout = 0;
//Handles movement upwards.
if (keyboard_check(vk_up)
&& collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_vine,0,0))
    vspeed += -0.5
//Handles movement downwards.
else if (keyboard_check(vk_down))
    vspeed += 0.5
//Stops the player.
else
    vspeed = 0
//Prevents the player for climbing too fast.
if (vspeed >= 1)
    vspeed = 1;
if (vspeed <= -1)
    vspeed = -1;
//Makes the player jump.
if (keyboard_check_pressed(vk_shift))
{
    vspeed = jumpstrength
    if global.powerup = 0
    sound_ps(snd_jump);
    else if global.powerup = 3
    sound_ps(global.costume_jump);
    else if global.powerup = 1.5
    {
    sound_ps(snd_jump3);
    alarm[2]=50
    }
    else
    sound_ps(snd_jump2);
    state = 2
    canjump = 1;
    alarm[6] = 1;
    alarm[7] = 12;
}
//Makes the player move down when there's not a climbable surface above
if (!collision_rectangle(bbox_left,bbox_top+sizze,bbox_right,bbox_top+sizze,obj_vine,1,0))
    y += 1;
