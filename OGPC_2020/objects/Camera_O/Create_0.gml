global.Camera_x = .5;
global.Camera_y = .5
cam = view_camera[0];
follow = Player_O;
view_w_half = camera_get_view_width(cam) * global.Camera_x;
view_h_half = camera_get_view_height(cam) * global.Camera_y;
xTo = xstart;
yTo = ystart;

