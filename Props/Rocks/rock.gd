class_name Rock extends Node2D

@onready var is_destroyed: PersistentDataHandler = $isDestroyed

@export var hp : int = 5

var isDestroyed : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_state()
	$hit_box.damaged.connect(TakeDamage)
	if isDestroyed:
		queue_free()
	pass # Replace with function body.


func TakeDamage ( _damage : HurtBox ) -> void:
	if hp <= 0:
		queue_free()
		isDestroyed = true
		is_destroyed.set_value()
	else: 
		hp -= 1
		%crack_anim.play("rock_hp" + str(hp))
		PlayerManager.shake_camera(.8)
	pass

func set_state():
	isDestroyed = is_destroyed.value
