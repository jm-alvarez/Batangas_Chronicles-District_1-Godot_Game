extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_final_cs_trigger_player_entered() -> void:
	%FinalCSCutscene.play()
	pass # Replace with function body.


func _on_cutscene_action_animation_finished() -> void:
	self.queue_free()
	
	pass # Replace with function body.
