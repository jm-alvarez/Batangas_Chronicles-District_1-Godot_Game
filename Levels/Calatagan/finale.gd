extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cutscene_action_animation_2_finished() -> void:
	PlayerManager.player.global_position = Vector2(47, 60)
	self.queue_free()
	LevelManager.load_new_level("res://Levels/sample/Scene1/scene_2.tscn", "", Vector2.ZERO)
	pass # Replace with function body.
