extends KinematicBody2D
class_name Actor

signal die
signal hit

export var max_hp: int = 5
var velocity: = Vector2.ZERO

onready var hp: = max_hp

export var speed: = Vector2(20, 20)

func _physics_process(delta: float) -> void:
    velocity = move_and_slide(velocity * delta)

func hit() -> void:
    emit_signal("hit", hp)
    hp -= 1
    if hp == 0:
        emit_signal("die")
