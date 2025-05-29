extends StaticBody3D

var initial_position:Vector3
var speed = 2.5
var target_x = 3
var tween:Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_position = position
	tween = create_tween()
	tween.set_loops()
	
	if(initial_position.x != 3):
		tween.tween_property(self,"position:x",target_x,speed)
		tween.tween_property(self,"position:x",initial_position.x,speed)
	else:
		tween.tween_property(self,"position:x",0,speed)
		tween.tween_property(self,"position:x",initial_position.x,speed)
