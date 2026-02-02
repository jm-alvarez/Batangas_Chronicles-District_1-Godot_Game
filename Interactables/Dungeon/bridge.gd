class_name Bridge extends Node


@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var is_open_data: PersistentDataHandler = $isOpenData

var opened : bool = false

func _ready() -> void:
	if opened:
		animation_player.play("opened")
	else:
		animation_player.play("closed")
	
	
func open_bridge() -> void:
	animation_player.play("open_bridge")
	pass
	
	
func close_bridge() -> void:
	animation_player.play("close_bridge")
	pass

func _on_pressure_plate_activated():
	animation_player.play("opened")
	pass # Replace with function body.


func _on_pressure_plate_deactivated():
	animation_player.play("close_bridge")
	pass # Replace with function body.


func _on_pressure_plate_2_activated():
	animation_player.play("opened")
	pass # Replace with function body.


func _on_pressure_plate_2_deactivated():
	animation_player.play("close_bridge")
	pass # Replace with function body.


func _on_pressure_plate_3_activated():
	animation_player.play("open_bridge")
	pass # Replace with function body.


func _on_pressure_plate_3_deactivated():
	animation_player.play("close_bridge")
	pass # Replace with function body.
