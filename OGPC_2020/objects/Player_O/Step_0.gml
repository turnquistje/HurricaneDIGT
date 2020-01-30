switch(keyboard_key){
	case ord("W"):
		y -= spd  
		
		
		break
	case ord("S"):
		y += spd 
		
		
		break
	case ord("A"):
		x -= spd 
		
		break
	case ord("D"):
		
		x += spd 
		break
}


if (global.stamina < 0){
	draw_text(440, 0, "Not enough stamina");
}