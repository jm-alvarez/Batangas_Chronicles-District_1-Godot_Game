extends Node2D

@onready var animation_player = $AnimationPlayer

func _on_area_trigger_body_entered(body):
	animation_player.play("triggered")


func _on_area_trigger_body_exited(body):
	animation_player.play("default")
