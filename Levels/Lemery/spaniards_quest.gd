extends Node2D
signal defeated_spaniards

@onready var enemy_activated_switch: QuestActivatedSwitch = $Enemy_Activated_Switch


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	count_spaniards()
	defeated_spaniards.connect( count_spaniards )
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func count_spaniards() :
	var cnt = enemy_activated_switch.get_child_count()
	if enemy_activated_switch.get_child_count():
		print("spaniard count: ", cnt)
		if cnt == 1:
			print("All spaniards defeated.")
			$quest_advance_trigger.advance_quest()
			await get_tree().process_frame
			self.queue_free()
		
	pass

func _on_spanish_soldier_enemy_destroyed(hurt_box: HurtBox) -> void:
	count_spaniards()
	pass # Replace with function body.
