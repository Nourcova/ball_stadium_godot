extends Node

signal next_level
signal game_over
signal start_game
signal hit_wall

var whistle_player: AudioStreamPlayer
var crowd_player: AudioStreamPlayer
var net_in: AudioStreamPlayer

var levels = ["res://scenes/level1.tscn","res://scenes/level2.tscn","res://scenes/level3.tscn"]
var current_level = 0
func _ready():
	whistle_player = AudioStreamPlayer.new()
	whistle_player.stream = preload("res://assets/whistle-sound.mp3")
	whistle_player.volume_db = -5
	crowd_player = AudioStreamPlayer.new()
	crowd_player.stream = preload("res://assets/football-party-people-in-the-streets-24170.mp3")
	net_in = AudioStreamPlayer.new()
	net_in.stream = preload("res://assets/goal_sound.mp3")

	add_child(whistle_player)
	add_child(crowd_player)
	add_child(net_in)
	
	EventBus.next_level.connect(go_to_next_level)
	EventBus.start_game.connect(on_game_start)
	EventBus.game_over.connect(on_game_over)
	
func on_game_start():
	whistle_player.play()
	crowd_player.play()
	current_level = 0
	get_tree().change_scene_to_file.bind("res://scenes/level1.tscn").call_deferred()
	
	
func go_to_next_level():
	if(current_level < 2):
		current_level+=1
		net_in.play()
		get_tree().change_scene_to_file.bind(levels[current_level]).call_deferred()
	else:
		crowd_player.stop()
		get_tree().change_scene_to_file.bind("res://scenes/congrats.tscn").call_deferred()

func on_game_over():
	crowd_player.stop()
	get_tree().change_scene_to_file.bind("res://scenes/game_over.tscn").call_deferred()
