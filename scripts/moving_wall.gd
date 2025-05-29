extends StaticBody3D

var initial_position:Vector3
var speed = 2.5
var target_z = 0.2
var tween:Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_position = position
	tween = create_tween()
	tween.set_loops()
	
	tween.tween_property(self,"position:z",target_z,speed)
	tween.tween_property(self,"position:z",initial_position.z,speed)
