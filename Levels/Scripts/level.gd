class_name Level extends Node2D



@export var FirstTextString : String 
@export var FirstTextAnim : AnimationPlayer
@export var music : AudioStream


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.y_sort_enabled = true
	PlayerManager.set_as_parent( self )
	LevelManager.level_load_started.connect( _free_level )
	AudioManager.play_music( music )
	PlayerHud.hide_game_over_screen()
	setFirstText()
	FirstTextAnim.play()

func _free_level()-> void:
	PlayerManager.unparent_player( self )
	queue_free()


#func _on_static_body_2d_body_entered(body : NPC):
#
		#body.queue_free()

func setFirstText():
	%FirstTextLabel.text = FirstTextString


#CALATAGAN
#Q1

func _on_q_1a_selected() -> void:
	pass # Replace with function body.

func _on_q_1b_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

func _on_q_1c_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

func _on_q_1d_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

#Q2
func _on_q_2a_selected() -> void:
	await get_tree().create_timer(1.5).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

func _on_q_2b_selected() -> void:
	await get_tree().create_timer(4.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

func _on_q_2d_selected() -> void:
	await get_tree().create_timer(2.6).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

#LIAN
#Q1
func _on_lq_1b_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

func _on_lq_1c_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

#Q2
func _on_lq_2a_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

func _on_lq_2b_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

#NASUGBU
#Q1

func _on_nq_1a_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

func _on_nq_1c_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

#Q2
func _on_nq_2a_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

func _on_nq_2b_selected() -> void:
	await get_tree().create_timer(2.0).timeout
	PlayerManager.player.end_game()
	pass # Replace with function body.

#TUY
#Q1
