extends Area2D

@export var triggerable: Triggerable


func _on_body_entered(body):
	if triggerable != null:
		triggerable.trigger(self, body, 1)

func _on_body_exited(body):
	if triggerable != null:
		triggerable.trigger(self, body, -1)
