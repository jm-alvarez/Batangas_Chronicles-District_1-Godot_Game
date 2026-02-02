@tool
class_name TreasureChest extends Node2D

@export var item_data : ItemData : set = _set_item_data
@export var quantity : int  =  1 : set = _set_quantity

#@export var item_data : String = "Fish"
#@export var quantity : int = 2

var is_opened : bool = false

@onready var item_sprite = $ItemSprite
@onready var label = $ItemSprite/Label
@onready var animation_player = $AnimationPlayer
@onready var interact_area = $Area2D
@onready var is_open_data : PersistentDataHandler = $isOpen


func _ready() -> void:
	_update_texture()
	_update_label()
	
	if Engine.is_editor_hint():
		return
	
	interact_area.area_entered.connect( _on_area_enter )
	interact_area.area_exited.connect( _on_area_exit )
	is_open_data.data_loaded.connect( set_chest_state )
	set_chest_state()
	pass

func set_chest_state() -> void:
	is_opened = is_open_data.value
	if is_opened:
		animation_player.play("opened")
	else:
		animation_player.play("closed")

func player_interact() -> void:
	if is_opened == true:
		return
	is_opened = true
	is_open_data.set_value()
	animation_player.play("opened_chest")
	
	if item_data and quantity > 0:
		PlayerManager.INVENTORY_DATA.add_item( item_data, quantity )
		pass
	else:
		printerr("No Items in Chest")
		push_error("No Items in Chest! Chest Name: ", name)
	
	pass

func _on_area_enter( _a : Area2D ) -> void:
	PlayerManager.interact_pressed.connect( player_interact )
	
	pass


func _on_area_exit( _a : Area2D ) -> void:
	PlayerManager.interact_pressed.disconnect( player_interact )
	pass


func _set_item_data( value : ItemData ) -> void:
	item_data = value
	pass

func _set_quantity( value : int) -> void:
	quantity = value
	pass


func _update_texture() -> void:
	if item_data and item_sprite: 
		item_sprite.texture = item_data.texture
		pass


func _update_label() -> void:
	if label:
		if quantity < 1:
			label.text = ""
		else:
			label.text = "x"+ str(quantity)
