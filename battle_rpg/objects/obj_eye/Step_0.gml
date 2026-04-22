// eye 
if (global.paranoia = 0)
{
	obj_eye.image_index = 0
}
if (global.paranoia = 1)
{
	obj_eye.image_index = 1
}
if (global.paranoia = 2)
{
	obj_eye.image_index = 2
}
if (global.paranoia = 3)
{
	obj_eye.image_index = 3
}
if (global.paranoia >3)
{
	global.paranoia = 3;
}
if (global.paranoia <0)
{
	global.paranoia = 0;
}