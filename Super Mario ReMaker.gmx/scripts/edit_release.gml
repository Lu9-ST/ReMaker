if global.mode = mode_edit
{
if hold = 1
{
if place_meeting(x,y,obj_solidtop)
or place_meeting(x,y,obj_parenemy)
or place_meeting(x,y,obj_paritem)
or place_meeting(x,y,obj_coin)
or place_meeting(x,y,obj_redcoin)
or place_meeting(x,y,obj_springboard)
{
x = lastx
y = lasty
}
}
lastx = x
lasty = y
hold = 0
move_snap(16,16)
}
