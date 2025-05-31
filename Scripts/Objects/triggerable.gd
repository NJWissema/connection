class_name Triggerable extends Node2D

signal on_state_changed(new_state:int)
@export var state: int = 0

func trigger(_triggered_by, _triggered_with, change):
	state += change
	on_state_changed.emit(state)
