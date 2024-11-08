if hold = 1
exit;
if global.mode = mode_edit
{
instance_create(x,y,obj_smoke)
instance_destroy()
}
