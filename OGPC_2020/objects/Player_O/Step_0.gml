switch(keyboard_key){
	case ord("W"):
		y -= global.p_spd 
		
		
		break
	case ord("S"):
		y += global.p_spd 
		
		
		break
	case ord("A"):
		x -= global.p_spd 
		
		break
	case ord("D"):
		
		x += global.p_spd
		break
}


if (global.stamina < 0){
	draw_text(440, 0, "Not enough stamina");
}