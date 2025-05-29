extends Button


func _on_pressed():
	EventBus.start_game.emit()
	
