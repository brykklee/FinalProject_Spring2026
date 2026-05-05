//instance_deactivate_object(obj_slash);
if(obj_manager.playerHit)
{
	instance_activate_object(obj_slash);
	obj_manager.playerHit = false;
}

if (image_index > 9)
{
	instance_deactivate_object(obj_slash);
}