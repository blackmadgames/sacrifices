extends Actor

func _process(_delta: float) -> void:
    look_at(get_global_mouse_position())
    _process_attack_input()

func _physics_process(delta: float) -> void:
    var movement: Vector2 = _get_movement_from_input()

    velocity = speed * movement * delta * 1000
    velocity = move_and_slide(velocity)

func _get_movement_from_input() -> Vector2:
    return Vector2(
        Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
        # Origin is top-left (so positive Y is down), so we must invest up and down here
        Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
    )

func _process_attack_input() -> void:
    if Input.is_action_just_pressed("fire"):
        $Gun.fire(get_parent())
