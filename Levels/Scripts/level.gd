class_name Level extends Node2D

@export var FirstTextString : String 
@export var FirstTextAnim : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.y_sort_enabled = true
	PlayerManager.set_as_parent( self )
	LevelManager.level_load_started.connect( _free_level )
	FirstTextAnim.play()

func _free_level()-> void:
	PlayerManager.unparent_player( self )
	queue_free()


func _on_static_body_2d_body_entered(body : NPC):

		body.queue_free()
