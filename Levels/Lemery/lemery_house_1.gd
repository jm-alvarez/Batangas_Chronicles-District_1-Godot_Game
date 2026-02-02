extends Level
@onready var white_fade_anim = $CanvasLayer/white_fade_anim

func _ready():
	white_fade_anim.play("fade_to_normal")
