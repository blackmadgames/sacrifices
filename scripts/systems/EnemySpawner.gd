extends Node2D
class_name EnemySpawner

const ENEMY_SCENE = preload("res://scenes/actors/Enemy.tscn")

export var delay_between_spawn: float = 20
export var spawn_on_ready: bool = true

func _ready() -> void:
    if spawn_on_ready:
        _spawn()
    if delay_between_spawn != 0:
        $Timer.connect("timeout", self, "_spawn")

func _spawn() -> void:
    var instance = ENEMY_SCENE.instance()
    instance.rotation = global_rotation
    instance.position = position
    get_parent().call_deferred("add_child", instance)
    
    if delay_between_spawn != 0:
        $Timer.set_wait_time(delay_between_spawn)
        $Timer.start()
