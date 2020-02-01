extends Actor

signal fire
signal soul_lost

var max_gun_ammo: int = 30
onready var gun_ammo = max_gun_ammo

var souls_count: int = 10

func _ready() -> void:
    $SoulsCircle.start(souls_count)

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
        emit_signal("fire", get_parent())
        spend_soul()

func spend_soul() -> void:
    souls_count -= 1
    emit_signal("soul_lost")

func _on_Player_die() -> void:
    print("You're dead'")
    hp = max_hp
