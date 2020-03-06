//draw the options

optionX = 32;
optionY = 16;
draw_set_font(fnt_GUI);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);



fontSize = font_get_size(fnt_GUI);
var BUFFER = 4;

for (var i = 0; i < array_length_1d(a_text); i++){
	text = a_text[i];
	if (selected_option == i){
		if (playerTurn) && (!showBattleText){
			draw_sprite(Arrow_S, 0, optionX - sprite_get_width(Arrow_S), optionY + ((fontSize + BUFFER) * i) + 15);
		}
	}
	draw_text(optionX + shakeX, optionY + ((fontSize + BUFFER) * i) + shakeY, text);
}

guiX = surface_get_width(application_surface) / 2;
guiY = surface_get_height(application_surface);
draw_sprite(TextBox_S, 0, guiX, guiY);

if (showBattleText){
	textX = guiX - ((sprite_get_width(TextBox_S) / 2) - (BUFFER * 3));
	textY = guiY - (sprite_get_height(TextBox_S) - (BUFFER * 3));
	for (var a = 0; a <= messageCounter; a ++){
		
		draw_text_ext(textX + shakeX, textY + ((fontSize + BUFFER) * a) + shakeY, ds_messages[| a], (fontSize + BUFFER), sprite_get_width(TextBox_S) - (BUFFER * 6));
	}
}

//DRAW THE PLAYER'S HP
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
hpX = BUFFER;
hpY = surface_get_height(application_surface) - BUFFER;

draw_text(hpX + shakeX, hpY + shakeY, string(playerHP) + " / " + string(playerMAX_HP));

//DRAW MONSTER
mx = surface_get_width(application_surface) / 2;
my = surface_get_height(application_surface) / 2;

draw_sprite(global.BattleEnemy_S, 0, mx, my);
