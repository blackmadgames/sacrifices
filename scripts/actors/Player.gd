extends Actor

var Enum = preload("res://scripts/data/Enum.gd")

signal fire
signal soul_lost
signal recharged_ammo
signal healed

var max_gun_ammo: int = 30
onready var gun_ammo = max_gun_ammo

var souls_count: int = 10
var shield_cost: int = 3
var shield_up: bool = false

func _ready() -> void:
    $SoulsCircle.start(souls_count)
    $".."/CanvasLayer/GUI.initialize(gun_ammo, souls_count, hp)

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
        emit_signal("fire", get_parent(), gun_ammo)
    if (Input.is_action_just_pressed("shield_up") && souls_count >= 3 &&
        not shield_up && $ShieldCooldownTimer.get_time_left() == 0):
        for _i in range(shield_cost):
            spend_soul()
        shield_up = true
        $Sprite.modulate = Color(0, .5, .9)
        $ShieldUpTimer.start()

func spend_soul() -> void:
    souls_count -= 1
    emit_signal("soul_lost", souls_count)

func _on_Player_die() -> void:
    print("You're dead'")
    # For Debug purpose: restarting the scene
    get_tree().change_scene(get_tree().get_current_scene().get_filename())

func _on_Shop_checkout_item(item_type) -> void:
    if souls_count != 0:
        spend_soul()

        if item_type == Enum.ItemTypes.AMMO:
            _recharge_ammo()
        elif item_type == Enum.ItemTypes.SKULL:
            _heal()

func _recharge_ammo() -> void:
    gun_ammo = max_gun_ammo
    emit_signal("recharged_ammo", gun_ammo)

func _heal() -> void:
    hp = max(max_hp, hp + 1)
    emit_signal("healed", hp)

func hit() -> void:
    if shield_up:
        return

    $Sprite.modulate = Color(1, 0, 0)  # red shade
    $HpLostTimer.start()
    .hit()

func _on_HpLostTimer_timeout() -> void:
    $Sprite.modulate = Color(1, 1, 1)  # Back to normal

func _on_ShieldUpTimer_timeout() -> void:
    shield_up = false
    $Sprite.modulate = Color(1, 1, 1)
    $ShieldCooldownTimer.start()
