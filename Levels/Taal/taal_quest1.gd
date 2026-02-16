extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cutscene_move_spaniard_finished() -> void:
	%Spaniard_Move.queue_free()
	pass # Replace with function body.


func _on_dialog_interaction_finished() -> void:
	
	pass # Replace with function body.


func _on_npc_man_1_trigger_player_entered() -> void:
	
	pass # Replace with function body.


func _on_ermitanyo_1_interaction_finished() -> void:
	%taal_quest_Show.advance_quest()
	await get_tree().process_frame
	%ermitanyo1_interaction.queue_free()
	#await get_tree().process_frame
	#%Ermitanyo1.queue_free()
	pass # Replace with function body.


func _on_npc_man_1_interaction_finished() -> void:
	#%Spaniard_Camp.queue_free()
	#%Spaniard_NPC1.queue_free()
	%taal_quest1_advance.advance_quest()
	%Spaniard_enemy_Q2.process_mode = Node.PROCESS_MODE_INHERIT
	%Spaniard_enemy_Q2.visible = true
	#%npc_man1.queue_free()
	pass # Replace with function body.

func count_spaniards() :
	var cnt = %Spaniard_enemy_Q2.get_child_count()
	if %Spaniard_enemy_Q2.get_child_count():
		print("spaniard count on taal: ", cnt)
		if cnt == 1:
			print("All spaniards defeated.")
			%taal_Q1_QS2_advance.advance_quest()
			await get_tree().process_frame
			%Spaniard_enemy_Q2.queue_free()
		
	pass


func _on_spanish_soldier_enemy_destroyed(hurt_box: HurtBox) -> void:
	count_spaniards()
	pass # Replace with function body.


func _on_earthquake_1_player_entered() -> void:
	PlayerManager.shake_camera()
	pass # Replace with function body.


func _on_yes_selected() -> void:
	%taal_q2_show_advance2.advance_quest()
	await get_tree().process_frame
	%taal_q1_qs3_advance.advance_quest()
	pass # Replace with function body.
