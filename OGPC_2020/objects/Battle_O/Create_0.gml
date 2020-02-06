a_text[0] = "ATK";
a_text[1] = "DEF";
a_text[2] = "MGK";
a_text[3] = "ITE";
a_text[4] = "RUN";


playerMAX_HP = 10;
playerHP = 10;

monsterHP = 3;


//which option is arrow on
selected_option = 0;
playerTurn = true;
ds_messages = ds_list_create();
messageCounter = 0;
showBattleText = false;

messageTimer = 0;
timeBeforeButtonAccepted = 15;

enemyTimer = 0;
timeTillEnemyAttacks = 15;
battleOption = 0;

screenShake = false;
maxshakeX = 5;
maxshakeY = 5;
shakeX = 0;
shakeY = 0;
shakeTimer = 0;
timeTillShakeEnds = 30;
