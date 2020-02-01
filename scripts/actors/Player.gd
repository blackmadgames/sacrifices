extends Actor

signal fire
signal soul_lost
signal hit
signal hp_lost

var max_gun_ammo: int = 30
onready var gun_ammo = max_gun_ammo

var souls_count: int = 10
var hp_lost_timer

func _ready() -> void:
    $SoulsCircle.start(souls_count)
    hp_lost_timer = get_node("Timer")
    hp_lost_timer.set_wait_time(.1)

    hp_lost_timer.connect("timeout", self, "_on_Timer_hp_lost_timeout")

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
    if Input.is_action_just_pressed("fire") && gun_ammo != 0:
        gun_ammo -= 1
        emit_signal("fire", get_parent())

func spend_soul() -> void:
    souls_count -= 1
    emit_signal("soul_lost")

func _on_Player_die() -> void:
    print("You're dead'")
    hp = max_hp

func _on_Shop_checkout_item(item_type) -> void:
    if souls_count != 0:
        spend_soul()

        if item_type == Enum.ItemTypes.AMMO:
            _recharge_ammo()
        elif item_type == Enum.ItemTypes.SKULL:
            _heal()

func _recharge_ammo() -> void:
    gun_ammo = max_gun_ammo

func _heal() -> void:
    hp = max(max_hp, hp + 1)

func _on_Player_hit() -> void:
    hp -= 1
    emit_signal("hp_lost")
    if hp == 0:
        emit_signal('die')

func _on_Player_hp_lost() -> void:
    $Sprite.modulate = Color(1, 0, 0)  # red shade
    hp_lost_timer.start()

func _on_Timer_hp_lost_timeout() -> void:
    $Sprite.modulate = Color(1, 1, 1)  # Back to normal
