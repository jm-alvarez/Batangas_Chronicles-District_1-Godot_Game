class_name Bridge extends Node
signal check_both_plates
signal both_plates_activated
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var is_open_data: PersistentDataHandler = $isOpenData

var opened : bool = false
var plate1_activated : bool = false
var plate2_activated : bool = false
var bridge_activated : bool = false
func _ready() -> void:
	if opened:
		animation_player.play("opened")
	else:
		animation_player.play("closed")
	
	%PressurePlate1.activated.connect( check_plates )
	%PressurePlate2.activated.connect(check_plates )
	
	both_plates_activated.connect( activate_bridge )
func open_bridge() -> void:
	animation_player.play("open_bridge")
	pass
	
	
func close_bridge() -> void:
	animation_player.play("close_bridge")
	pass

func _on_pressure_plate_activated():
	plate1_activated = true
	check_both_plates.emit( check_plates )
	print("Plate 1 Activated")
	pass # Replace with function body.


func _on_pressure_plate_deactivated():
	animation_player.play("close_bridge")
	pass # Replace with function body.


func _on_pressure_plate_2_activated():
	plate2_activated = true
	check_both_plates.emit( check_plates )
	print("Plate 2 Activated")
	pass # Replace with function body.


func _on_pressure_plate_2_deactivated():
	animation_player.play("close_bridge")
	pass # Replace with function body.


func _on_pressure_plate_3_activated():
	
	pass # Replace with function body.


func _on_pressure_plate_3_deactivated():
	animation_player.play("close_bridge")
	pass # Replace with function body.

func check_plates():
	if plate1_activated == true and plate2_activated == true:
		print("Both plates activated.")
		if bridge_activated == false:
			both_plates_activated.emit()
	else:
		print("Not Yet")

#func _on_both_plates_activated() -> void:
	#print("Bridge Opened")
	#animation_player.play("open_bridge")
	#%pansipit_bridge_advance.advance_quest()

func activate_bridge():
	print("Bridge Opened")
	animation_player.play("opened")
	bridge_activated = true
