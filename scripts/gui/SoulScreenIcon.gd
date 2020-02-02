extends TextureRect

export var rotation_speed = 200

func _process(delta: float) -> void:
    if rotation_speed != 0:
        rect_rotation += delta * rotation_speed
