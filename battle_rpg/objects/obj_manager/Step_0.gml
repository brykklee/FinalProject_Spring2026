if (global.playerHealth <1 or global.enemyHealth <1)
{
	room_goto(gameover)
}



if (keyboard_check_pressed(vk_space))
{
	audio_play_sound(select, 5, false);
}


// state machine
switch (global.state)
{
	
	case STATES.PLAYERTURN:
		dialouge = 10;
	
	obj_textbox.image_index = 0;
// highlighting selected option
if (selectedNumber = 0) //attack
{
	obj_breathbutton.sprite_index = spr_breathbutton
	obj_attackbutton.sprite_index = spr_selectedattack
}
else if (selectedNumber = 1) // breath
{
	obj_attackbutton.sprite_index = spr_attackbutton
	obj_breathbutton.sprite_index = spr_selectedbreath
	//obj_vinnie.image_index = 2;
}

// selecting fr
if (keyboard_check_pressed(vk_space))
{
	wasPlayerTurn = true;
	global.state = STATES.STATUSUPDATE;
}

break;

case STATES.STATUSUPDATE:
obj_textbox.image_index = 1;

if (global.playerHealth <5 && selectedNumber = 0)
{
	obj_vinnie.image_index = 3;
}
if (global.playerHealth >4 && selectedNumber = 0)
{
	obj_vinnie.image_index = 0;
}

if (wasPlayerTurn)
{
	if (selectedNumber = 0 && change = true)
	{
		if (global.paranoia < 3)
		{
		dialouge = 0
		obj_enemy.image_index = 1;
		if (change)
			{
			global.enemyHealth = global.enemyHealth - 1;
				audio_play_sound(playerattack, 5, false);
			}
			change = false;
		}
		if (global.paranoia = 3)
		{
		dialouge = 5
		}
	}

	if (selectedNumber = 1 && change = true)
	{	
		obj_vinnie.image_index = 2
		//change = true;
		if (global.paranoia >0)
		{
		dialouge = 1
			if (change)
			{
			global.paranoia = 0
			}
			change = false
		}
		
		if (global.paranoia = 0 && change = true)
		{
			dialouge = 7
			if (change)
			{
			global.playerHealth = global.playerHealth +1;
					audio_play_sound(heal, 5, false);
			}
			change = false;
		}
		
		
	}
}

if (!wasPlayerTurn)
{
	dialouge = 6
}

if (keyboard_check_pressed(vk_space))
{
	obj_enemy.image_index = 0;
	if (global.playerHealth <5)
{
	obj_vinnie.image_index = 3;
}
if (global.playerHealth >4)
{
	obj_vinnie.image_index = 0;
}

	if (wasPlayerTurn)
	{
	global.state = STATES.ENEMYTURN;
	}
	if (!wasPlayerTurn)
	{
		change = true;
		global.state = STATES.PLAYERTURN;
	}
}
break;

case STATES.ENEMYTURN:

number = irandom(100)
if (global.enemyHealth <3)
{
	missrate = 30
}
else 
{
	missrate = 20
}

if (number < missrate && enemyWent = false)
{
	dialouge = 4;
	enemyWent = true;
}
else if (number > missrate && enemyWent = false)
{
	global.playerHealth = global.playerHealth - 2;
			audio_play_sound(wolfattack, 5, false);
	obj_vinnie.image_index = 1;
	global.paranoia = global.paranoia +1;
	dialouge =3;
	number = 0;
	enemyWent = true;
}



if (enemyWent && keyboard_check_pressed(vk_space))
{
	global.state = STATES.STATUSUPDATE;
	wasPlayerTurn = false
	enemyWent = false;
}
break;

}
