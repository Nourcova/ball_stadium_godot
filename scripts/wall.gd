extends Area3D

func _on_body_entered(body):
	if body is RigidBody3D:
		EventBus.hit_wall.emit()
