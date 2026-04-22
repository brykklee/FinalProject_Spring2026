if (playerHealth <1 or enemyHealth <1)
{
	room_goto(gameover)
}



if (keyboard_check_pressed(vk_space))
{
	audio_play_sound(select, 5, false);
}

// eye 
if (paranoia = 0)
{
	obj_eye.image_index = 0
}
if (paranoia = 1)
{
	obj_eye.image_index = 1
}
if (paranoia = 2)
{
	obj_eye.image_index = 2
}
if (paranoia = 3)
{
	obj_eye.image_index = 3
}
if (paranoia >3)
{
	paranoia = 3;
}
if (paranoia <0)
{
	paranoia = 0;
}

// enemy health bar
if (enemyHealth = 5)
{
	obj_enemyHbar.image_index = 0;
}
if (enemyHealth = 4)
{
	obj_enemyHbar.image_index = 1;
}
if (enemyHealth = 3)
{
	obj_enemyHbar.image_index = 2;
}
if (enemyHealth = 2)
{
	obj_enemyHbar.image_index = 3;
}
if (enemyHealth = 1)
{
	obj_enemyHbar.image_index = 4;
}
if (enemyHealth < 1)
{
	obj_enemyHbar.image_index = 5;
}

//player health car
if (playerHealth = 10)
{
	obj_playerHbar.image_index = 0
}
if (playerHealth = 9)
{
	obj_playerHbar.image_index = 1
}
if (playerHealth = 8)
{
	obj_playerHbar.image_index = 2
}
if (playerHealth = 7)
{
	obj_playerHbar.image_index = 3
}
if (playerHealth = 6)
{
	obj_playerHbar.image_index = 4
}
if (playerHealth = 5)
{
	obj_playerHbar.image_index = 5
}
if (playerHealth = 4)
{
	obj_playerHbar.image_index = 6
}
if (playerHealth = 3)
{
	obj_playerHbar.image_index = 7
}
if (playerHealth = 2)
{
	obj_playerHbar.image_index = 8
}
if (playerHealth = 1)
{
	obj_playerHbar.image_index = 9
}
if (playerHealth  < 1)
{
	obj_playerHbar.image_index = 10
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

if (playerHealth <5 && selectedNumber = 0)
{
	obj_vinnie.image_index = 3;
}
if (playerHealth >4 && selectedNumber = 0)
{
	obj_vinnie.image_index = 0;
}

if (wasPlayerTurn)
{
	if (selectedNumber = 0 && change = true)
	{
		if (paranoia < 3)
		{
		dialouge = 0
		obj_enemy.image_index = 1;
		if (change)
			{
			enemyHealth = enemyHealth - 1;
				audio_play_sound(playerattack, 5, false);
			}
			change = false;
		}
		if (paranoia = 3)
		{
		dialouge = 5
		}
	}

	if (selectedNumber = 1 && change = true)
	{	
		obj_vinnie.image_index = 2
		//change = true;
		if (paranoia >0)
		{
		dialouge = 1
			if (change)
			{
			paranoia = 0
			}
			change = false
		}
		
		if (paranoia = 0 && change = true)
		{
			dialouge = 7
			if (change)
			{
			playerHealth = playerHealth +1;
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
	if (playerHealth <5)
{
	obj_vinnie.image_index = 3;
}
if (playerHealth >4)
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
if (enemyHealth <3)
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
	playerHealth = playerHealth - 2;
			audio_play_sound(wolfattack, 5, false);
	obj_vinnie.image_index = 1;
	paranoia = paranoia +1;
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
