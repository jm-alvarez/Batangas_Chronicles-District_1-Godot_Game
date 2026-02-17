extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lc_cutscene_2_finished() -> void:
	
	pass # Replace with function body.


func _on_trigger_strong_eq_player_entered() -> void:
	PlayerManager.shake_camera(3)
	await get_tree().process_frame
	pass # Replace with function body.


func _on_lc_cutscene_3_finished() -> void:
	%taal_q2_qs2_advance.advance_quest()
	pass # Replace with function body.
