extends StaticBody2D
@onready var aki_bed_anim: AnimationPlayer = $aki_bed_anim


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%ending_trigger.monitorable = false
	%ending_trigger.monitoring = false
	PlayerManager.player.visible = false
	await get_tree().create_timer(.5).timeout
	await get_tree().process_frame
	aki_bed_anim.play("aki_wakeup")
	await aki_bed_anim.animation_finished
	PlayerManager.player.visible = true
	%ending_trigger.monitorable = true
	%ending_trigger.monitoring = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
