/* player_platforming_water()
//=====================================================//
This script handles the main movement of the player 
object while is swimming.
//=====================================================*/

crouch = 0; //Makes the player un-crouch.
isrun = 0; //Makes the player stop from running.

//Sets the animation of the player.
if (collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+2,obj_solidblock,0,0) 
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
if (y <= -48)
    y = -48;
//Prevents the player from falling too fast.
if (vspeed >= 1.25)
    vspeed = 1.25;
//Makes the player run.
if (cj)
    hspmax = 1;
else
    hspmax = 0.5;
//Makes the player jump.
if (keyboard_check_pressed(vk_shift) && (!instance_exists(obj_countdown)))
{
    y -=1
    vspeed = -2
    canjump = 1
    sound_ps(snd_swim);
    //Moving Platform Glitch
    if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_parmoving,0,0))
        y -= 4;
}
//Handles movement to the right.
if (keyboard_check(vk_right) && (!bugfix) && (!keyboard_check(vk_left)))
{
    hspeed += 0.03
    xscale = 1;
}
//Handles movement to the left.
else if (keyboard_check(vk_left) && (!bugfix) && (!keyboard_check(vk_right)))
{
    hspeed -= 0.03
    xscale = -1;
}
//Makes the player move slower until it stops when is landed on the floor.
else if (!cj)
{
    hspeed = max(0,abs(hspeed)-0.03)*sign(hspeed);
    if (hspeed < 0.03 && hspeed > -0.03)
    hspeed = 0;
}
if ((taunt) && (!cj) && !keyboard_check(vk_up))
    taunt = 0;
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
    gravity = 0.075;
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
if ((collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_solidblock,1,0) 
|| collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_parmoving,1,0))
&& vspeed <= 0)
{
    sound_ps(snd_bump);
    vspeed = 1;
    canjump = 2;
    //Vertical collision fix.
    while (collision_rectangle(bbox_left,bbox_top+1,bbox_right,bbox_top+1,obj_solidblock,1,0) && (!bugfix))
        y += 1
}
//Wall control.
if ((!vspeed) && (!crouch))
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
