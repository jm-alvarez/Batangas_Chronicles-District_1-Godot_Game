extends Node2D

@onready var button_new: Button = %Button_New
@onready var button_continue: Button = %Button_Continue
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer

@export var music : AudioStream


const START_LEVEL : String = "res://Levels/sample/Scene1/scene_1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_audio( music )
	%Settings.visible = false
	set_fs_control_value()
	$PlayerSpawn.position = Vector2(47, 60)
	#get_tree().paused = true
	PlayerManager.player.visible = false
	PlayerManager.player.process_mode = Node.PROCESS_MODE_DISABLED
	PlayerHud.visible = false
	PauseMenu.visible = false
	PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
	TouchControl.process_mode = Node.PROCESS_MODE_DISABLED
	TouchControl.visible = false
	
	if SaveManager.get_save_file() == null:
		button_continue.disabled = true
		button_continue.visible = false
		button_new.grab_focus()
	setup_title_screen()
	
	LevelManager.level_load_started.connect( exit_title_screen )
	
	pass # Replace with function body.




func setup_title_screen() -> void:
	button_new.pressed.connect( start_game )
	button_continue.pressed.connect( load_game )
	button_continue.grab_focus()
	pass

func start_game() -> void:
	LevelManager.load_new_level( START_LEVEL, "", Vector2.ZERO )
	pass

func load_game() -> void:
	SaveManager.load_game()
	pass

func exit_title_screen() -> void:
	PlayerManager.player.visible = true
	PlayerManager.player.process_mode = Node.PROCESS_MODE_INHERIT
	PlayerHud.visible = true
	PauseMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	TouchControl.process_mode = Node.PROCESS_MODE_INHERIT
	TouchControl.visible = true
	self.queue_free()
	pass

func play_audio( _a : AudioStream) -> void:
	audio_stream_player.stream = _a
	audio_stream_player.play()


func _on_button_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_button_settings_pressed() -> void:
	%Settings.visible = true
	
	pass # Replace with function body.


func _on_button_continue_focus_entered() -> void:
	close_settings()
	pass # Replace with function body.

func close_settings() -> void:
	%Settings.visible = false
	pass
	


func _on_button_close_settings_pressed() -> void:
	close_settings()
	pass # Replace with function body.

func set_fs_control_value() -> void:
	if DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN:
		%FullscreenControl.toggle_mode = true
	else:
		%FullscreenControl.toggle_mode = false
	pass
