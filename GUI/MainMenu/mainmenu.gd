extends Control

@onready var main_buttons = $MainButtons
@onready var settings = $Settings


# Called when the node enters the scene tree for the first time.
func _ready():
	main_buttons.visible = true
	settings.visible = false

func _on_play_btn_pressed():
	get_tree().change_scene_to_file("res://Scenes/Introduction/aki_room.tscn")


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_settings_btn_pressed():
	print("Settings Pressed")
	main_buttons.visible = false
	settings.visible = true
	


func _on_close_btn_pressed():
	_ready()
