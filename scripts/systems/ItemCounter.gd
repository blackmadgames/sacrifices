extends Node2D
class_name ItemCounter

signal checkout_item

const ROTATION_SPEED: = 5
const UNZOOM_SCALE: = 0.8
const ZOOM_SCALE: = 1.1

export var texture: Texture = null

var customer_body: Node = null

func _ready() -> void:
    $Sprite.texture = texture
    _unfocus_item()

func _process(delta: float) -> void:
    $Sprite.rotation += ROTATION_SPEED * delta
    _process_input()

func _process_input() -> void:
    if customer_body && Input.is_action_just_pressed("interact"):
        emit_signal("checkout_item", customer_body)

func _unfocus_item() -> void:
    customer_body = null
    $Sprite.scale = Vector2(UNZOOM_SCALE, UNZOOM_SCALE)

func focus_item(customer: Node) -> void:
    customer_body = customer
    $Sprite.scale = Vector2(ZOOM_SCALE, ZOOM_SCALE)

func _on_Area2D_body_entered(body: Node) -> void:
    if body.is_in_group("Player"):
        focus_item(body)

func _on_Area2D_body_exited(body: Node) -> void:
    if body.is_in_group("Player"):
        _unfocus_item()
