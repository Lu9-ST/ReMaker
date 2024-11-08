/* combohit_silent()
//=====================================================//
Creates a points-text depending on how many enemies
killed mario while stomping.
//=====================================================*/
if (other.hitcombo <= 9)
{
    ID = instance_create(bbox_left,bbox_top,obj_pointstext)
        ID.image_index = other.hitcombo
}
else
{
    ID = instance_create(bbox_left,bbox_top,obj_pointstext)
        ID.image_index = 10
}
other.hitcombo += 1
