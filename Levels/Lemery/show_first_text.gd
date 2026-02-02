extends Node2D

var is_finished : bool = false

@onready var isFinishedData: PersistentDataHandler = $isFinished

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_state()
	
	if is_finished:
		pass
		self.queue_free()
	else:
		$DialogCutscene.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cutscene_action_animation_3_finished() -> void:
	self.queue_free()
	is_finished = true
	isFinishedData.set_value()
	pass # Replace with function body.

func set_state():
	is_finished = isFinishedData.value
