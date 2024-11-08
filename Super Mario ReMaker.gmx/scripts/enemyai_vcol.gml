/*========  enemyai_vcol(object)  ========//

Makes the object bump down when collides 
with a block while is moving up.
//========================================*/
if (vspeed < 0 && collision_rectangle(bbox_left,bbox_top-2,bbox_right,bbox_top-2,argument0,1,0))
{
    vspeed = 1
    while (collision_rectangle(bbox_left,bbox_top-2,bbox_right,bbox_top-2,argument0,1,0))
        y += 1
}
