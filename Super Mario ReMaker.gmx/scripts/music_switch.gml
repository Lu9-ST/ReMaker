if global.mode = mode_play
{
audio_sound_gain(obj_musicplayer.leveledit[0],0,0)
audio_sound_gain(obj_musicplayer.leveledit[1],0,0)
audio_sound_gain(obj_musicplayer.leveledit[2],0,0)
audio_sound_gain(obj_musicplayer.leveledit[3],0,0)
audio_sound_gain(obj_musicplayer.leveledit[4],0,0)
audio_sound_gain(obj_musicplayer.leveledit[5],0,0)
audio_sound_gain(obj_musicplayer.leveledit[6],0,0)
audio_sound_gain(obj_musicplayer.leveledit[7],0,0)
if global.moon = 1
audio_sound_gain(obj_musicplayer.levelmoon,0.8,0)
else
audio_sound_gain(obj_musicplayer.levelmusic,0.8,0)
audio_sound_gain(obj_musicplayer.levelplace,0,0)
}
if global.mode = mode_edit
{
audio_sound_gain(obj_musicplayer.leveledit[0],0.8,0)
audio_sound_gain(obj_musicplayer.leveledit[1],0,0)
audio_sound_gain(obj_musicplayer.leveledit[2],0,0)
audio_sound_gain(obj_musicplayer.leveledit[3],0,0)
audio_sound_gain(obj_musicplayer.leveledit[4],0,0)
audio_sound_gain(obj_musicplayer.leveledit[5],0,0)
audio_sound_gain(obj_musicplayer.leveledit[6],0,0)
audio_sound_gain(obj_musicplayer.leveledit[7],0.8,0)
audio_sound_gain(obj_musicplayer.levelmusic,0,0)
audio_sound_gain(obj_musicplayer.levelmoon,0,0)
audio_sound_gain(obj_musicplayer.levelplace,0,0)
}
