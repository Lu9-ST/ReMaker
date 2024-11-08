/*========  enemyai_hcol_enemy(hspeed,object)  ========//

Makes the object change it's horizontal speed when
collides with the object mentioned in 'argument1'.
//=====================================================*/
if (hspeed > 0 && (collision_rectangle(bbox_right,bbox_top,bbox_right+hspeed,bbox_bottom-1,argument1,1,0)))
{
    enemy = collision_rectangle(bbox_right,bbox_top,bbox_right+hspeed,bbox_bottom-1,argument1,1,0)
    hspeed = -argument0
    with (enemy) hspeed = -hspeed
}
if (hspeed < 0 && (collision_rectangle(bbox_left-hspeed,bbox_top,bbox_left,bbox_bottom-1,argument1,1,0)))
{
    enemy = collision_rectangle(bbox_left-hspeed,bbox_top,bbox_left,bbox_bottom-1,argument1,1,0)
    hspeed = argument0
    with (enemy) hspeed = -hspeed
}
