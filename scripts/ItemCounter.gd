extends Node2D
class_name ItemCounter

signal checkout_item

const ROTATION_SPEED: = 10
const UNZOOM_SCALE: = 0.8
const ZOOM_SCALE: = 1.1

export var texture: Texture = null

var focused: = false

func _ready() -> void:
    $Sprite.texture = texture
    _unfocus_item()

func _process(delta: float) -> void:
    $Sprite.rotation += ROTATION_SPEED * delta
    _process_input()

func _process_input() -> void:
    if focused && Input.is_action_just_pressed("interact"):
        emit_signal("checkout_item")

func _on_Area2D_body_entered(body: Node) -> void:
    if body.is_in_group("Player"):
        focus_item()

func _on_Area2D_body_exited(body: Node) -> void:
    if body.is_in_group("Player"):
        _unfocus_item()

func _unfocus_item() -> void:
    focused = false
    $Sprite.scale = Vector2(UNZOOM_SCALE, UNZOOM_SCALE)

func focus_item() -> void:
    focused = true
    $Sprite.scale = Vector2(ZOOM_SCALE, ZOOM_SCALE)
