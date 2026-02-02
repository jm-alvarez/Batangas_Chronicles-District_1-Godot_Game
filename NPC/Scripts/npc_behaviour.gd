class_name NPCBehaviour extends Node2D

var npc : NPC

func _ready() -> void:
	var p = get_parent()
	if p is NPC:
		npc = p as NPC
		#Connect to signal
		npc.do_behaviour_enabled.connect(start)

func start() -> void:
	pass
