var camera = camera_get_active()

camera_set_view_mat(camera, matrix_build_lookat(room_width / 2, 3000, 1300, room_width / 2, 2250, 0, 0, 0, -1));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(59, 16 / 9, 1, 99999));
camera_apply(camera)