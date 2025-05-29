extends StaticBody3D

var initial_scale:Vector3
var speed = 3
var target_y = 2.5
var tween:Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_scale = scale
	tween = create_tween()
	tween.set_loops()
	
	if initial_scale.y!=2.5:
		tween.tween_property(self,"scale:y",target_y,speed)
		tween.tween_property(self,"scale:y",initial_scale.y,speed)

	else:
		tween.tween_property(self,"scale:y",1,speed)
		tween.tween_property(self,"scale:y",initial_scale.y,speed)
