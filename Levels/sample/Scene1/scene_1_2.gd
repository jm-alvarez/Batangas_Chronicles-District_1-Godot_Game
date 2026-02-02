class_name Scene_1_2 extends Level


func _on_fade_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://Levels/Scene1/void.tscn")




func _on_animation_player_animation_finished(anim_name = "aki_sleep"):
	pass


func _on_animation_player_animation_started(anim_name = "aki_sleep"):
	PlayerManager.player.queue_free()
