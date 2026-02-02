extends StaticBody2D

@export var raw_fish_item_data : ItemData
@export var dried_fish_item_data : ItemData

@onready var fish_grill_anim: AnimationPlayer = $fish_grill_anim
@onready var dry_fish_timer: Timer = $DryFishTimer

var quantity : int = 5
var isDrying : bool = false
var grillEmpty : bool = true
var fishDried : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if grillEmpty == true:
		$DryFishDialog.enabled = true
		$DryFishDialog.monitoring = true
		$CollectDriedFishDialog.enabled = false
		$CollectDriedFishDialog.monitoring = false
	elif grillEmpty == false:
		$DryFishDialog.enabled = false
		$DryFishDialog.monitoring = false
		$CollectDriedFishDialog.enabled = true
		$CollectDriedFishDialog.monitoring = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_yes_selected() -> void:
	PlayerManager.INVENTORY_DATA.dry_all_fishes(raw_fish_item_data)
	fish_grill_anim.play("raw_fish_9")
	dry_fish_timer.start()
	grillEmpty = false
	$DryFishDialog.monitoring = false
	$DryFishDialog/put_fishes_switch/put_fishes_advance.advance_quest()
	$DryFishDialog/put_fishes_switch.is_activated = true
	pass # Replace with function body.


func _on_dry_fish_timer_timeout() -> void:
	fish_grill_anim.play("dried_fish_9")
	$DryFishDialog.enabled = false
	$CollectDriedFishDialog.enabled = true
	$CollectDriedFishDialog.monitoring = true
	
	pass # Replace with function body.


func _on_dry_fish_dialog_body_entered(body: Player) -> void:
		
	pass # Replace with function body.


func _on_yes_collect_selected() -> void:
	PlayerManager.INVENTORY_DATA.collect_dried_fishes(dried_fish_item_data)
	fish_grill_anim.play("default")
	grillEmpty = true
	$DryFishDialog.enabled = false
	$DryFishDialog.monitoring = false
	$CollectDriedFishDialog.enabled = false
	$CollectDriedFishDialog.monitoring = false
	$CollectDriedFishDialog/collect_fish_switch/collect_fish_advance.advance_quest()
	$CollectDriedFishDialog/collect_fish_switch.is_activated = true
	pass # Replace with function body.
