extends Control
class_name GUI

onready var ammo_label: = $Counters/AmmoCounter/Label
onready var souls_label: =  $Counters/SoulsCounter/Label

const HP_ICON_SCENE = preload("res://scenes/gui/HPIcon.tscn")

func initialize(ammo_count: int, souls_count: int, hp: int) -> void:
    souls_label.text = str(souls_count)
    ammo_label.text = str(ammo_count)
    for _i in range(hp):
        var hp_icon = HP_ICON_SCENE.instance()
        $Counters/HPCounter.add_child(hp_icon)

func _on_Player_fire(_attach_to: Node2D, ammo_count: int) -> void:
    ammo_label.text = str(ammo_count)

func _on_Player_soul_lost(souls_count: int) -> void:
    souls_label.text = str(souls_count)

func _on_Player_recharged_ammo(ammo_count: int) -> void:
    ammo_label.text = str(ammo_count)

func _on_Player_hit() -> void:
    $Counters/HPCounter.remove_child($Counters/HPCounter.get_child(0))
