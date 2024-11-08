var file,inst_num,n0,n1,inst;
file = argument0
if file_exists(file)
{
file_delete(file)
}
ini_open(file)
inst_num = instance_number(par_object)
n0 = 0
n1 = 0
while inst_num > 0
{
inst = instance_find(par_object,inst_num-1)
if inst.object_index = obj_costume
ini_write_real("course",string(n0)+"C",inst.costume)
ini_write_real("course",string(n0)+string(n1),inst.object_index)
n1 += 1
ini_write_real("course",string(n0)+string(n1),inst.x)
n1 += 1
ini_write_real("course",string(n0)+string(n1),inst.y)
inst_num -=1
n0 +=1
n1 = 0
}
ini_write_real("misc","width",new_width)
ini_write_real("misc","type",global.leveltheme)
ini_write_real("misc","xarrow",obj_arrow.x)
ini_write_real("misc","yarrow",obj_arrow.y)
ini_write_real("misc","time",global.time)
ini_close()
