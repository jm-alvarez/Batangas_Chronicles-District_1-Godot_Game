extends Level

@onready var animation_player = $Bed/AnimationPlayer
@onready var fade = $Fade
@onready var area_col = $area_trigger/area_col
@onready var white_fade = $white_fade
@onready var white_fade_anim = $CanvasLayer/white_fade_anim

func _ready():
	pass

func _on_queue_npc_body_entered(body : NPC):
	body.queue_free()

func _on_area_2d_body_entered(body : Player):
	pass
