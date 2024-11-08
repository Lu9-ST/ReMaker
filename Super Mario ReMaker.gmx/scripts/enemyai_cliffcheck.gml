/*========  enemyai_cliffcheck(hspeed,object)  ========//

Makes the object change it's horizontal speed when it's 
next to a cliff, preventing it from falling.
//=====================================================*/
if (hspeed > 0 && (!collision_line(bbox_right,bbox_bottom-1,bbox_right,bbox_bottom+15,argument1,1,0)))
    hspeed = -argument0
if (hspeed < 0 && (!collision_line(bbox_left,bbox_bottom-1,bbox_left,bbox_bottom+15,argument1,1,0)))
    hspeed = argument0
