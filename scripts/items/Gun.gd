extends Node2D

export var projectile_scene: PackedScene = null
export var strength: = 300.0

func fire(attach_to: Node2D) -> void:
    var projectile: = projectile_scene.instance()
    attach_to.add_child(projectile)
    projectile.fire(global_position, global_rotation, strength)
