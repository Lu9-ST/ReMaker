/* player_fiery()
//=====================================================//
This script handles the fiery player animation
//=====================================================*/
//Start Fire Animation
if (firing > 0)
    firing -= 1
//End Fire Animation
//Idle State
if (state == 0)
{
    image_speed = 0
    if (!firing)
        image_index = 11
    else
        image_index = 13
}
//Walk State
if (state == 1)
{
    image_speed = 0.1+speed/8
    //Skid State
    if (xscale = 1 && hspeed < -0.001)
        image_index = 4;
    else if (xscale = -1 && hspeed > 0.001)
        image_index = 4;
    else
    {
        if (!sprite_ready)
        {
            sprite_ready = 1
            if (image_index < 1 || image_index > 1)
                image_index = 1
        }
        if image_index >= 2.9
            image_index = 0;
    }
}
//Jump / Swim State
if (state == 2)
{
    if (!global.water)
    {
        image_speed = 0
        if canjump = 0
        {
            if image_index = 0
            {
             if (image_index < 0 || image_index > 0)
                image_index = 0;
            }
            else if image_index = 1
            {
             if (image_index < 1 || image_index > 1)
                image_index = 1;
            }
            else if image_index = 2
            {
             if (image_index < 2 || image_index > 2)
                image_index = 2;
            }
        }
        else
        {
            if (image_index < 3 || image_index > 3)
                image_index = 3;
        }
    }
    else
    {
        if (vspeed <= 0)
        {
            image_speed = 0.225;
            if (!sprite_ready2)
            {
                sprite_ready2 = 1;
                if (image_index < 7 || image_index > 7)
                    image_index = 7;
            }
            if image_index >= 9.9
                image_index = 7;
        }
        else
        {
            image_speed = 0
            if (image_index < 7 || image_index > 7)
                image_index = 7;
        }
    }
}
//Climb State
if (state == 3)
{
    if (vspeed == 0)
        image_speed = 0
    else
        image_speed = 0.15
    if (!sprite_ready3)
    {
        sprite_ready3 = 1;
        if (image_index < 5 || image_index > 5)
            image_index = 5;
    }
    if (image_index >= 6.9)
        image_index = 5;
}
//Mask and jump mode
if (state == 2)
    cj = 1;
else
    cj = 0;
if (state <= 3)
    mask_index = spr_largemask;   
else
    mask_index = spr_largemask_climb;
