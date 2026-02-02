extends Node2D

var isQuest1Finished : bool = false
@onready var quest_1_cutscene_finished: PersistentDataHandler = $Quest_1_Cutscene_Finished

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#set_state()
	#if isQuest1Finished:
		#%LocalPriest.queue_free()
		#pass
	#
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#
#func set_state():
	#isQuest1Finished = quest_1_cutscene_finished.value
