/* player_platforming()
//=====================================================//
This script handles the main movement of the player 
object while is not climbing or swimming.
//=====================================================*/

//Sets the animation of the player.
if (collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+2,obj_solidtop,0,0) 
|| (collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+2,obj_parmoving,0,0)))
{
    if (vspeed == 0)
    {
        if (hspeed == 0)
            state = 0;
        else
            state = 1;
    }
}
else state = 2;
//Prevents the player from going to high in the screen.
if (y <= -48 && !springjump)
    y = -48;
//Prevents the player from falling too fast.
if (vspeed >= 4)
    vspeed = 4
//Makes the player run.
if (keyboard_check(vk_control))
    hspmax = 2.5;
else if (!isrun)
    hspmax = 1.5;
//Makes the player jump.
if (keyboard_check_pressed(vk_shift) && (!canjump) && (!cj) && (!vspeed >= 0) && (!taunt) && (!instance_exists(obj_countdown)))
{
    y -=1
    if global.powerup = 1.5
    vspeed = (jumpstrength-(jumpadd/2))*1.3
    else
    vspeed = jumpstrength-(jumpadd/2)
    canjump = 1
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
    //Moving Platform Glitch
    if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_parmoving,0,0))
        y -= 2;
}
//Makes the player fall while it's jumping and the player releases the 'jump' key.
if (keyboard_check_released(vk_shift) && (canjump = 1))
{
    vspeed += -0.1-vspeed/2.4
    canjump = 2; 
}
//Makes the player move.
enable_movement();
//Handles movement to the right.
if (keyboard_check(vk_right) && (canmove) && (!bugfix) && (!keyboard_check(vk_left)))
{
    if (hspeed <= 0)
        hspeed += 0.1
    else
        hspeed += 0.05
    if canjump = 0
    xscale = 1;
}
//Handles movement to the left.
else if (keyboard_check(vk_left) && (canmove) && (!bugfix) && (!keyboard_check(vk_right)))
{
    if (hspeed >= 0)
        hspeed += -0.1
    else
        hspeed += -0.05
    if canjump = 0
    xscale = -1;
}
//Makes the player move slower until it stops when is landed on the floor.
else if (!cj)
{
    hspeed = max(0,abs(hspeed)-0.15)*sign(hspeed);
    if (hspeed < 0.15 && hspeed > -0.15)
    hspeed = 0;
}
//Prevents the player from moving too fast.
if(abs(hspeed) > hspmax)
    hspeed = hspmax * sign(hspeed);
//Floor detection.
if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_solidtop,0,0)
|| (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_parmoving,0,0)) 
&& (!vspeed < 0))
{
    gravity = 0;
    vspeed = 0;
    if (state == 2)
    {
        if (hspeed == 0)
            state = 0;
        else 
            state = 1;
    }
    if (canjump > 0)
        canjump = 0;
    hitcombo = 0;
}
else if (state == 2)
{
    gravity = 0.25;
    if (vspeed <= 0)
        gravity = 0.25/1.8;
}
//Horizontal collision.
if (hspeed > 0 
&& (collision_rectangle(bbox_right,bbox_top+4,bbox_right+1+hspeed,bbox_bottom-1,obj_solidblock,1,0)
|| collision_rectangle(bbox_right,bbox_top+4,bbox_right+1+hspeed,bbox_bottom-1,obj_parmoving,1,0)))
    hspeed = 0;
if (hspeed < 0 
&& (collision_rectangle(bbox_left-1+hspeed,bbox_top+4,bbox_left,bbox_bottom-1,obj_solidblock,1,0)
|| collision_rectangle(bbox_left-1+hspeed,bbox_top+4,bbox_left,bbox_bottom-1,obj_parmoving,1,0)))
    hspeed = 0;
//Vertical collision.
if ((collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom-1,obj_solidblock,1,0) 
|| collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom-1,obj_parmoving,1,0))
&& vspeed < 0)
{
    sound_ps(snd_bump);
    vspeed = 1;
    canjump = 2;
    //Vertical collision fix.
    while (collision_rectangle(bbox_left,bbox_top+1,bbox_right,bbox_top+1,obj_solidblock,1,0))
        y += 1
}
//Jumpstrength control.
if (hspeed >= 2.4 || hspeed <= -2.4)
{
    jumpadd = 1;
    isrun = 1;
}
else
{
    jumpadd = 0;
    isrun = 0;
}
//Makes the player get up if the 'down' key is not pressed.
if ((crouch) && (!cj) && !keyboard_check(vk_down))
    crouch = 0;
if ((taunt) && (!cj) && !keyboard_check(vk_up))
    taunt = 0;
//Wall control.
if (!vspeed && !crouch)
{
    if (xscale = 1 && collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_solidblock,1,0))
    {
        x -= 1
        if (!bugfix)
            bugfix = 1
    }
    if (xscale = -1 && collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_solidblock,1,0))
    {
        x += 1
        if (!bugfix)
            bugfix = 1
    }    
    else if (!collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_solidblock,1,0))
        bugfix = 0
}
//Horizontal speed fix.
hspeed = round(hspeed*1000)/1000
x = round(x*1000)/1000
