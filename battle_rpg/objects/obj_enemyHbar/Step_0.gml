// enemy health bar
if (global.enemyHealth = 5)
{
	obj_enemyHbar.image_index = 0;
}
if (global.enemyHealth = 4)
{
	obj_enemyHbar.image_index = 1;
}
if (global.enemyHealth = 3)
{
	obj_enemyHbar.image_index = 2;
}
if (global.enemyHealth = 2)
{
	obj_enemyHbar.image_index = 3;
}
if (global.enemyHealth = 1)
{
	obj_enemyHbar.image_index = 4;
}
if (global.enemyHealth < 1)
{
	obj_enemyHbar.image_index = 5;
}