@tool
class_name DialogBranch extends DialogItem

signal selected

@export var text : String = "ok..."

var dialog_items : Array[DialogItem]

func _ready() -> void:
	if Engine.is_editor_hint():
		return
	
	for c in get_children():
		if c is DialogItem:
			dialog_items.append(c)
	
	pass


func _on_selected():
	pass # Replace with function body.
