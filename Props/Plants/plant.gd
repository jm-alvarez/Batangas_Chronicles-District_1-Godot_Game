class_name Plant extends Node2D

@onready var is_destroyed: PersistentDataHandler = $isDestroyed

var isDestroyed : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	set_state()
	$hit_box.damaged.connect(TakeDamage)
	if isDestroyed:
		queue_free()
	pass # Replace with function body.


func TakeDamage ( _damage : HurtBox ) -> void:
	queue_free()
	isDestroyed = true
	is_destroyed.set_value()
	pass

func set_state():
	isDestroyed = is_destroyed.value
