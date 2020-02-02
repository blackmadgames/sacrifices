extends Actor

var Enum = preload("res://scripts/data/Enum.gd")

signal fire
signal soul_lost
signal recharged_ammo
signal healed
signal shield_up

var max_gun_ammo: int = 20
onready var gun_ammo = max_gun_ammo

var shield_cost: int = 2
var shield_up: bool = false

func _ready() -> void:
    Game.initialize()
    $SoulsCircle.start(Game.souls_count)
    $".."/CanvasLayer/GUI.initialize(gun_ammo, Game.souls_count, hp)

func _process(_delta: float) -> void:
    look_at(get_global_mouse_position())
    _process_attack_input()

func _physics_process(delta: float) -> void:
    var movement: Vector2 = _get_movement_from_input()

    velocity = (speed / Game.souls_count) * movement * delta * 1000
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
    if Input.is_action_just_pressed("shield_up") && Game.souls_count != 0 && \
        !shield_up && $ShieldCooldownTimer.get_time_left() == 0:
        _shield_up()

func _shield_up() -> void:
    spend_soul()
    shield_up = true
    $Sprite.modulate = Color(0, .5, .9)
    $ShieldUpTimer.start()
    emit_signal("shield_up")

func spend_soul() -> void:
    Game.souls_count -= 1
    emit_signal("soul_lost", Game.souls_count)
    if Game.souls_count == 0:
        _game_over()

func _on_Player_die() -> void:
    Game.souls_count = 0
    _game_over()

func checkout_item(item_type) -> void:
    if Game.souls_count != 0:
        spend_soul()

        if item_type == Enum.ItemTypes.AMMO:
            _recharge_ammo()
        elif item_type == Enum.ItemTypes.SKULL:
            _heal()

func _recharge_ammo() -> void:
    gun_ammo = max_gun_ammo
    emit_signal("recharged_ammo", gun_ammo)

func _heal() -> void:
    hp = min(max_hp, hp + 1)
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

func _game_over() -> void:
    get_tree().change_scene("res://scenes/screens/GameOver.tscn")
