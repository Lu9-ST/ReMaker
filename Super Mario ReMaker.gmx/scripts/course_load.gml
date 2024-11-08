var file,n0,n1,inst,xx,yy,;
file = argument0
ini_open(file)
n0 = 0
n1 = 0
inst = 0
xx = 0
yy = 0
while ini_key_exists("course",string(n0)+string(n1))
{
inst = ini_read_real("course",string(n0)+string(n1),0)
n1 += 1
xx = ini_read_real("course",string(n0)+string(n1),0)
n1 += 1
yy = ini_read_real("course",string(n0)+string(n1),0)
if ini_key_exists("course",string(n0)+"C")
{
mycostume = ini_read_real("course",string(n0)+"C",0)
ID = instance_create(xx,yy,inst)
ID.costume = mycostume
ID.lastx = xx
ID.lasty = yy
}
else
{
ID = instance_create(xx,yy,inst)
ID.lastx = xx
ID.lasty = yy
}
n0 += 1
n1 = 0
}
room_set_width(room,ini_read_real("misc","width",426))
global.leveltheme = ini_read_real("misc","type",0)
obj_arrow.x = ini_read_real("misc","xarrow",0)
obj_arrow.y = ini_read_real("misc","yarrow",0)
global.time = ini_read_real("misc","time",0)
if global.mode = mode_play
{
if instance_exists(obj_player_main)
{
obj_player_main.x = ini_read_real("misc","xarrow",64)+32
obj_player_main.y = ini_read_real("misc","yarrow",986)-16
}
}
else
{
if instance_exists(obj_player_edit)
{
obj_player_edit.x = ini_read_real("misc","xarrow",64)+32
obj_player_edit.y = ini_read_real("misc","yarrow",986)-16
}
}
ini_close()
