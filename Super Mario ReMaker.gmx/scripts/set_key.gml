//REDO CODE
draw_text(x,y,argument0)
io_clear()
if keyboard_key=vk_escape or keyboard_key=vk_enter 
or keyboard_key=vk_shift or keyboard_key=vk_control
or keyboard_key=vk_up or keyboard_key=vk_down
or keyboard_key=vk_left or keyboard_key=vk_right
 {
  draw_text(x,y,'Cannot use default key')
  io_clear()
 }
else keyboard_set_map(keyboard_key,argument1)
