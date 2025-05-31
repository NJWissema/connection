extends Triggerable


@onready var collider : StaticBody2D = $StaticBody2D
@onready var shape = $Polygon2D


func _on_on_state_changed(new_state):
	shape.visible = new_state <= 0
	$StaticBody2D/CollisionShape2D.set_deferred("disabled", new_state > 0)
