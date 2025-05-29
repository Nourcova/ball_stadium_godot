extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$game_over_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_pressed():
	get_tree().quit()


func _on_rematch_pressed():
	PlayerStats.lives = 3
	EventBus.start_game.emit()
