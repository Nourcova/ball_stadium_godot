extends RigidBody3D

var original_position:Vector3
var fell:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.hit_wall.connect(on_hit_wall)
	original_position = position
	update_ui()
	$GPUParticles3D.emitting = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y<-5 && !fell:
		fell = true
		die()
		
func die():
	if PlayerStats.lives > 1:
		PlayerStats.lives-=1
		respawn()
		update_ui()
	else:
		PlayerStats.lives -= 1
		EventBus.game_over.emit()		
		update_ui()
	
func respawn():
	position = original_position
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3(0,0,0)
	fell = false
	$GPUParticles3D.emitting = true
	$ball_hit_ground_sound.play()
	
func update_ui():
	$CanvasLayer/Control/Label.text ="Lives: " + str(PlayerStats.lives)

func on_hit_wall():
	PlayerStats.lives-=1
	respawn()
	update_ui()
