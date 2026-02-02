class_name AreaTrigger extends Area2D

signal player_entered

var dialog : DialogInteraction
var dialog_cutscene : DialogCutscene
var cutscene_action_animation : CutsceneActionAnimation
var triggered : bool = false


func _ready() -> void:
	body_entered.connect( _on_body_entered )
	for c in get_children():
		if c is DialogInteraction:
			dialog = c
			break
	pass


func _on_body_entered( _body : Player ) -> void:
	if triggered == true:
		return
	player_entered.emit()
	if dialog:
		triggered = true
		dialog.player_interact()
		
	pass
