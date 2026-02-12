extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_punta_selected() -> void:
	%TaalAdvanceTrigger.advance_quest()
	%CalacaAdvanceTrigger2.advance_quest()
	pass # Replace with function body.


func _on_dialog_interaction_finished() -> void:
	#%Ermitanyo.queue_free()
	pass # Replace with function body.
