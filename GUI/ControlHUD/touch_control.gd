extends CanvasLayer

#func _input(event):
	#if event.is_action_pressed("inventory"):
		#$Inventory.visible = !$Inventory.visible
# Called when the node enters the scene tree for the first time.
func _ready():
	if Input.get_connected_joypads():
		print("Joypads Connected")
		%r_btn.visible = false
		%pause_node.visible = false
		%"d-pad_node".visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
