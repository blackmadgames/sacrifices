extends Node2D

const SOUL_SCENE = preload("res://scenes/fx/Soul.tscn")

var souls = []
export var radius: int = 128
export var rotation_speed: float = 0.1

func start(initial_souls_count: int) -> void:
    for _i in range(initial_souls_count):
        var instance = SOUL_SCENE.instance()
        souls.append(instance)
        add_child(instance)

func _process(_delta: float) -> void:
    if souls.size() == 0:
        return

    rotation += rotation_speed

    var angle = 0
    var step = (2 * PI) / souls.size()
    for i in souls.size():
        souls[i].position = position + radius * Vector2.UP.rotated(angle)
        angle += step


func _on_Player_soul_lost(_souls_count: int) -> void:
    var instance = souls.pop_back()
    if instance != null:
        instance.queue_free()
