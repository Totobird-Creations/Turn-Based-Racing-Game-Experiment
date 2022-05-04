extends Area
class_name Target


func clicked():
	var player             := get_parent().get_parent().get_parent()
	player.velocity        += Vector2(translation.x, translation.z)
	player.source_position  = player.position
	player.position        += player.velocity
