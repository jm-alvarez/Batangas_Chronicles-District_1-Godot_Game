extends Node2D

var isQuest1CutsceneFinished : bool = false

@onready var quest_1_cutscene_finished: PersistentDataHandler = $Quest_1_Cutscene_Finished

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_state()
	
	if isQuest1CutsceneFinished == true:
		$area_trigger.queue_free()
		%LocalPriest.queue_free()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#%EndActionMove.position = PlayerManager.player.global_position
	#%EndActionMove.target_location = %EndActionMove.position
	pass


func _on_area_trigger_player_entered() -> void:
	$area_trigger/DialogCutscene.play()
	%LocalPriest.scale = Vector2(0, 0)
	#PlayerManager.player.process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


func _on_fade_to_normal_finished() -> void:
	#PlayerManager.player.process_mode = Node.PROCESS_MODE_INHERIT
	pass # Replace with function body.


func _on_fade_to_black_finished() -> void:
	PlayerManager.set_player_position( %PlayerSpawn.global_position )
	%EndActionMove.reparent(PlayerManager.player)
	%EndActionMove.object_to_move = %CaptainLemery
	pass # Replace with function body.

func _on_yes_selected() -> void:
	$CaptainLemery/CL_Dialog_1/CaptainLemeryDialog/DialogChoice/Yes/quest_advance_trigger.advance_quest()
	pass # Replace with function body.


func _on_end_action_move_finished() -> void:
	$CaptainLemery/CL_Dialog_1/CaptainLemeryDialog.player_interact()
	$area_trigger.queue_free()
	isQuest1CutsceneFinished = true
	quest_1_cutscene_finished.set_value()
	pass # Replace with function body.

func set_state():
	isQuest1CutsceneFinished = quest_1_cutscene_finished.value
