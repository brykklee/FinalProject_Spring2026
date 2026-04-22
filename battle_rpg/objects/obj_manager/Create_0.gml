selectedNumber = 0;

wasPlayerTurn = false;;
//wasEnemyTurn = false;

global.playerHealth = 10;
global.enemyHealth = 5;
//playerAttack = false;
//playerBreath = false;
enemyAttack = true;
enemyWent = false;
number = 0;
dialouge = 10;
global.paranoia = 0;
change = true;
ongoing = false;
missrate =25;

draw_set_colour(c_white);

draw_set_font(Aseprite)


enum STATES
{
	PLAYERTURN,
	STATUSUPDATE,
	ENEMYTURN
}

global.state = STATES.PLAYERTURN