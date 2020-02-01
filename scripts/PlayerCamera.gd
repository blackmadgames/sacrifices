extends Position2D

const LOOK_AHEAD_DISTANCE = 500
var initial_offset_x: = 0

func _ready() -> void:
    initial_offset_x = position.x

func _process(delta: float) -> void:
    if Input.is_action_just_pressed("look_ahead"):
        position.x += LOOK_AHEAD_DISTANCE
    elif Input.is_action_just_released("look_ahead"):
        position.x = initial_offset_x
