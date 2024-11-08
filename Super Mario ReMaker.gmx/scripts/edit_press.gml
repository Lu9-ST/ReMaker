if global.mode = mode_edit
and obj_cursor.mode = 0
{
if place_meeting(x,y,obj_cursor)
{
lastx = x
lasty = y
sound_ps(snd_drag)
hold = 1
}
}
