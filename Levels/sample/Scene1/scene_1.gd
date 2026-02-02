class_name Scene1 extends Level

@onready var first = $first
@onready var fade = $Fade
@onready var bed_anim = $Bed/AnimationPlayer
@onready var first_collision_shape = $first/area_trigger/CollisionShape2D

var player : Player

func _ready():
	first_collision_shape.disabled = true
	PlayerManager.player.visible = false
	fade.play("black_2s")
	await fade.animation_finished
	fade.play("fade_to_normal")
	await fade.animation_finished
	first_collision_shape.disabled = false
	
	bed_anim.play( "aki_wakeup")
	await bed_anim.animation_finished
	PlayerManager.player.visible = true

func _on_fade_animation_finished(anim_name : String):
	anim_name = "black_2s"
	get_tree().change_scene_to_file("res://Levels/Scene1/void.tscn")


func _on_animation_player_animation_started(anim_name):
	pass # Replace with function body.
