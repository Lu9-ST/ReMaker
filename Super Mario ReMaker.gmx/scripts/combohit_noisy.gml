/* combohit_noisy()
//=====================================================//
Creates a points-text depending on how many enemies
were killed with a shell.
//=====================================================*/
if (other.hitcombo == 0)
{
    sound_ps(snd_kick)
    ID = instance_create(x,y,obj_pointstext)
        with (ID) image_index = 3       
}
else if (other.hitcombo == 1)
{
    sound_ps(snd_kick)
    ID = instance_create(x,y,obj_pointstext)
        with (ID) image_index = 4       
}
else if (other.hitcombo == 2)
{
    sound_ps(snd_kick)
    ID = instance_create(x,y,obj_pointstext)
        with (ID) image_index = 5      
}
else if (other.hitcombo == 3)
{
    sound_ps(snd_kick)
    ID = instance_create(x,y,obj_pointstext)
        with (ID) image_index = 6       
}
else if (other.hitcombo == 4)
{
    sound_ps(snd_kick)
    ID = instance_create(x,y,obj_pointstext)
        with (ID) image_index = 7       
}
else if (other.hitcombo == 5)
{
    sound_ps(snd_kick)
    ID = instance_create(x,y,obj_pointstext)
        with (ID) image_index = 8       
}
else if (other.hitcombo == 6)
{
    sound_ps(snd_kick)
    ID = instance_create(x,y,obj_pointstext)
        with (ID) image_index = 9       
}
else if (other.hitcombo >= 6)
{
    sound_ps(snd_kick)
    ID = instance_create(x,y,obj_pointstext)
        with (ID) image_index = 10       
}
other.hitcombo += 1
