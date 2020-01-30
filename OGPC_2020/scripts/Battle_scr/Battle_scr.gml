switch (mpos)
{
	case 0:
	{
		//global.e_health -= 3;
		if (global.stamina - 4 <= 0){
			draw_text(450, 0, "Not Enough Stamina");
		} else {
			global.stamina -= 4;
		}
		
		break;
	}
	
	case 1:
	{
		break;
    
	}
	case 2: room_goto(0); break;
	
	default: break;
	
	
}