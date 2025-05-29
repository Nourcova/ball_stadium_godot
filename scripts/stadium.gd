extends StaticBody3D

var rotation_speed = 2.5
var original_rotation:Vector3
var should_return:bool = false
var return_speed = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	original_rotation = rotation
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	should_return = true
	if(Input.is_action_pressed("ui_up")):
		rotate_z(-rotation_speed*delta)
		should_return = false
	if(Input.is_action_pressed("ui_down")):
		rotate_z(rotation_speed*delta)
		should_return = false
	if(Input.is_action_pressed("ui_left")):
		rotate_x(-rotation_speed*delta)
		should_return = false
	if(Input.is_action_pressed("ui_right")):
		rotate_x(rotation_speed*delta)
		should_return = false
	if (should_return==true):
		rotation = lerp(rotation, original_rotation, return_speed*delta)
