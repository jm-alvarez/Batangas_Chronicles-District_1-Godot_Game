extends Node2D

var lc1_talked : bool = false
var lc2_talked : bool = false
var lc3_talked : bool = false
var lc4_talked : bool = false
var all_lc_talked : bool = false

@onready var is_talked_to_all_citizens: PersistentDataHandler = $is_talked_to_all_citizens

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_state()
	check_lc_status()
	if all_lc_talked == true:
		print("All lc talked")
		%taal_q2_qs1_advance.advance_quest()
		self.queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_lc_status() -> void:
	if lc1_talked == true:
		print("Talked to LC1")
	if lc2_talked == true:
		print("Talked to LC2")
	if lc3_talked == true:
		print("Talked to LC3")
	if lc4_talked == true:
		print("Talked to LC4")
		
	if lc1_talked == true and lc2_talked == true and lc3_talked == true and lc4_talked == true:
		all_lc_talked = true
		is_talked_to_all_citizens.set_value()
		%taal_q2_qs1_advance.advance_quest()
		print("All Local Citizens Talked")
	else:
		print("There are Local Citizens you need to talk to")
	pass


func _on_lc_1_d_2_interaction_finished() -> void:
	lc1_talked = true
	await get_tree().process_frame
	check_lc_status()
	pass # Replace with function body.


func _on_lc_2_d_2_interaction_finished() -> void:
	lc2_talked = true
	await get_tree().process_frame
	check_lc_status()
	pass # Replace with function body.


func _on_lc_3_d_2_interaction_finished() -> void:
	lc3_talked = true
	await get_tree().process_frame
	check_lc_status()
	pass # Replace with function body.


func _on_lc_4_d_2_interaction_finished() -> void:
	lc4_talked = true
	await get_tree().process_frame
	check_lc_status()
	pass # Replace with function body.

func set_state():
	all_lc_talked = is_talked_to_all_citizens.value
