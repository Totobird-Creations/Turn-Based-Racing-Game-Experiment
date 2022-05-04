extends Spatial



var position        : Vector2 = Vector2.ZERO
var velocity        : Vector2 = Vector2.ZERO

var prev_position   : Vector2 = position
var source_position : Vector2 = position



func _physics_process(delta : float):
	if (prev_position != position):
		prev_position = position
		$position_tween.interpolate_property(
			self, "translation",
			translation, Vector3(position.x, 0.0, position.y),
			0.5,
			Tween.TRANS_LINEAR, 0
		)
		$position_tween.start()
	$arrow_pivot.rotation.y = PI / 2.0 - velocity.angle()
	$arrow_pivot.scale.z    = velocity.length()
	$target.translation     = Vector3(velocity.x, 0.0, velocity.y)
	$center.translation     = Vector3(velocity.x, 0.0, velocity.y) / 2.0
	var camera :         = get_node("../../camera")
	var source : Vector3 = camera.translation
	var target : Vector3 = $center.global_transform.origin
	camera.translation = source.move_toward(target, source.distance_to(target) * delta * 5.0)



func collision(area : Node):
	position = source_position
	$position_tween.stop_all()
	translation = Vector3(position.x, 0.0, position.y)
	velocity = Vector2.ZERO
