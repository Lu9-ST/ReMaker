   global.mode = mode_edit
   global.powerup = 0
   instance_create(x,y,obj_plusbutton)
   instance_create(x,y,obj_themes)
   instance_create(x,y,obj_selection)
   instance_create(x,y,obj_savefd)
   instance_create(x,y,obj_loadfd)
   instance_create(x,y,obj_home)
   instance_create(x,y,obj_resize)
   instance_create(x,y,obj_clock)
   instance_create(x,y,obj_trash)
   instance_create(x,y,obj_cursor)
   with (obj_respawner) instance_destroy()
   with (obj_parenemy) 
   {
   x = lastx
   y = lasty
   move_snap(16,16)
   }
   with (obj_paritem) 
   {
   x = lastx
   y = lasty
   move_snap(16,16)
   }
   with (obj_springboard) 
   {
   x = lastx
   y = lasty
   move_snap(16,16)
   }
   obj_cursor.alarm[2]=5
   global.time = obj_musicplayer.leveltime
   global.redcoins = 0
   global.coins = 0
   score = 0
   sound_ps(snd_edit_exit)
