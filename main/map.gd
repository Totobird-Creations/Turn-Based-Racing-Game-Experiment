extends Spatial



func _input(event : InputEvent):
	if (event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT && event.pressed):
			$camera_raycast.global_transform.origin = $camera/camera.project_ray_origin(event.global_position)
			$camera_raycast.cast_to                 = $camera/camera.project_ray_normal(event.global_position) * 100.0
			$camera_raycast.force_update_transform()
			$camera_raycast.force_raycast_update()
			if ($camera_raycast.is_colliding()):
				var target : Spatial = $camera_raycast.get_collider()
				if (target is Target):
					target.clicked()
