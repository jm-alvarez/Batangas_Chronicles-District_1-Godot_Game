extends Node

const PLAYER = preload("res://Player/player_1.tscn")
const INVENTORY_DATA : InventoryData = preload("res://GUI/PauseMenu/Inventory/player_inventory.tres")


signal camera_shook( trauma : float )
signal interact_pressed

var player : Player
var player_spawned : bool = false
var isTutorialCompleted : bool = false

var xp : int = 0

func _ready() -> void:
	add_player_instance()
	await get_tree().create_timer(0.5).timeout
	player_spawned = true

func add_player_instance() -> void:
	player = PLAYER.instantiate()
	add_child(player)
	pass

func set_health( hp : int, max_hp : int ) -> void:
	player.max_hp = max_hp
	player.hp = hp
	player.update_hp( 0 )

func reward_xp( _xp : int ) -> void:
	xp += _xp
	print("XP = ", str( xp ) )

func set_player_position(_new_pos : Vector2) -> void:
	player.global_position = _new_pos
	
	pass


func set_as_parent(_p : Node2D) -> void:
	if player.get_parent():
		player.get_parent().remove_child(player)
		
	_p.add_child(player)

func unparent_player(_p : Node2D) -> void:
	_p.remove_child(player)

func shake_camera( trauma : float = 1 ) -> void:
	camera_shook.emit( trauma )

func reset_camera_on_player() -> void:
	var camera : Camera2D = get_viewport().get_camera_2d()
	if camera:
		if camera.get_parent() == player:
			print("Camera already in Player")
			return
		camera.reparent(player)
		camera.position = Vector2.ZERO
	pass
