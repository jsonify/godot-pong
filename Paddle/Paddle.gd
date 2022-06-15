extends KinematicBody2D

var speed := 100.0

func _physics_process(delta: float) -> void:
	position = get_global_mouse_position()
