extends Node2D


@export var first_level: PackedScene = null
@export var playground: PackedScene = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_start_button_pressed():
	if first_level != null:
		get_tree().change_scene_to_packed(first_level)

func _on_quit_button_pressed():
	get_tree().quit()


func _on_button_pressed():
	if playground != null:
		get_tree().change_scene_to_packed(playground)
