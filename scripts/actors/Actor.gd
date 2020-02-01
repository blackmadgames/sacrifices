extends KinematicBody2D
class_name Actor

export var speed = Vector2(10000, 10000)
var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
    velocity = move_and_slide(velocity * delta)
