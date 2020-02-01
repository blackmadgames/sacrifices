extends KinematicBody2D
class_name Actor

export var speed = Vector2(20, 20)
var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
    velocity = move_and_slide(velocity * delta)
    pass
