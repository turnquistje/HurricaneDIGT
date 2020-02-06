#region SELECT OPTION
  
  if(playerTurn) && (!showBattleText){
  
	  if (keyboard_check_pressed(vk_down)){
		  //if not at the last option, go down 1
		  if(selected_option + 1) <= (array_length_1d(a_text) - 1){
			  selected_option ++;
		  //else go back to the first option
		  }else{
			  selected_option = 0;
		  }
	  }
  
	  if (keyboard_check_pressed(vk_up)){
		  //if not at the topmost option, go up 1
		  if((selected_option - 1) >= 0){
			  selected_option --;
		  //else go back to the first option
		  }else{
			  selected_option = (array_length_1d(a_text) - 1);
		  }
	  }
	  if (keyboard_check_pressed(vk_space)){
		  messageCounter = 0;
		  if(!ds_exists(ds_messages, ds_type_list)){
			  ds_messages = ds_list_create();
		  }
	       
		  //Attack
		  if(selected_option == 0){
			  
			  //a_message[0] = "Player ATTACKS!";
			  ds_messages[| 0] = "Player ATTACKS!";
			  roll = choose("HIT", "MISS");
			  
			  if(roll = "MISS"){
				  ds_messages[| 1] = "But misses...";
			  }else{
				  dmg = irandom(1) + 1;
				  ds_messages[| 1] = "And hits for " + string(dmg) + " damage !";
			  }
			  battleOption = 0;
		  }  
		  //Defend
		  if(selected_option == 1){
			  
			  ds_messages[| 0] = "Player DEFENDS!";
			  battleOption = 1;
		  } 
		  
		  //Magic
		  if(selected_option == 2){
			  
			  ds_messages[| 0] = "Player tries to cast a spell, but doesn't know any!";
			  battleOption = 2;
		  } 
		  
		  //Item
		  if(selected_option == 3){
			  
			  ds_messages[| 0] = "Player has no items!";
			  battleOption = 3;
		  } 
		  
		  //Run
		  if(selected_option == 4){
			  ds_messages[| 0] = "Player flees!";
			  roll = choose("Fails", "Succeeds");
			  
			  if (roll = "Fails"){
				  ds_messages[| 1] = "But falls flat on their face";
			  }else{
				  ds_messages[| 1] = "And runs like the coward they are!";
			  }  
			  battleOption = 4;
		  } 
		  
		  showBattleText = true;
	  }
	  
			  
		  
  }
  #endregion
  
  #region MESSAGES
	//cycle through messages
	  if (showBattleText){
		  messageTimer ++;
		  
		  //wait before accepting input
		  if (messageTimer >= timeBeforeButtonAccepted){
			  if(keyboard_check_pressed(vk_space)){
				  //go to next massage if there is one
				  if (messageCounter + 1) <= (ds_list_size(ds_messages) - 1){
					  messageCounter ++;
				  //else next actor takes their turn
				  }else{
					  playerTurn = !playerTurn;
					  messageCounter = 0
					  if (ds_exists(ds_messages, ds_type_list)){
						  ds_list_destroy(ds_messages);
				      }
					  showBattleText = false;
				  }
				  messageTimer = 0;
				  
				  //If this is an attack
				  if (battleOption == 0){
					  
					  if (!playerTurn){
						  if (messageCounter == 1) && (roll == "Hits"){
							 
							  playerHP -= dmg;
							  screenShake = true;
						  }
					  }
					  
				  }
				  
			  }
		  }
	
	  }
  #endregion
  
  #region SHAKE
  if (screenShake == true){
	  shakeTimer ++;
	  
	  shakeX = irandom_range(-maxshakeX, maxshakeX);
	  shakeY = irandom_range(-maxshakeY, maxshakeY);
	  
	  if (shakeTimer >= timeTillShakeEnds){
		  screenShake = false;
		  shakeTimer = 0;
		  shakeX = 0;
		  shakeY = 0;
		  
	  }
  }
  #endregion
  
  #region ENEMY TURN
  if (!playerTurn) && (!showBattleText){
	  enemyTimer ++;
	  
	  if (enemyTimer >= timeTillEnemyAttacks){
		  if(!ds_exists(ds_messages, ds_type_list)){
			  ds_messages = ds_list_create();
		  }
		  messageCounter = 0;
		  showBattleText = true;
		  enemyTimer = 0;
		  
		  ds_messages[| 0] = "MONSTER attacks !";
		  battleOption = 0;
		  
		  roll = choose("Hits", "Misses");
		  
		  if(roll == "Hits"){
			  dmg = irandom(1) + 1;
			  ds_messages[| 1] = "And hits for " + string(dmg) + " damage!";
		  }else{
			  ds_messages[| 1] = "But misses, thankfully!";
		  }
	  }
  
  }
  
  
  
  #endregion