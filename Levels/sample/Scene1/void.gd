extends Level


@onready var animation_player = $Bed/AnimationPlayer
@onready var fade = $Fade
@onready var area_col = $area_trigger/area_col
@onready var white_fade = $white_fade
@onready var white_fade_anim = $CanvasLayer/white_fade_anim

func _ready():
	#PlayerManager.add_player_instance()
	#PlayerManager.player.visible = false
	#area_col.disabled = true
	#fade.play("black_2s")
	#await fade.animation_finished
	#fade.play("fade_to_normal")
	#await fade.animation_finished
	#animation_player.play("aki_wakeup")
	#await animation_player.animation_finished
	#await get_tree().process_frame
	#await get_tree().process_frame
	#area_col.disabled = false
	#PlayerManager.player.visible = true
	#PlayerManager.player.add_child( Camera2D.new() )
	
	pass
	

func _on_queue_npc_body_entered(body : NPC):
	body.queue_free()



func _on_area_2d_body_entered(body : Player):
	#white_fade.play("fade_to_white")
	#await white_fade.animation_finished
	#white_fade_anim.play("fade_to_white")
	#await white_fade_anim.animation_finished
	#get_tree().change_scene_to_file("res://Levels/Lemery/lemery_house_1.tscn")
	
	pass
