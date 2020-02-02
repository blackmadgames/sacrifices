extends Node2D

export var projectile_scene: PackedScene = null
export var strength: = 30

func _on_Player_fire(attach_to: Node2D, _new_ammo_count: int) -> void:
    var projectile: = projectile_scene.instance()
    attach_to.add_child(projectile)
    projectile.fire(global_position, global_rotation, strength)
