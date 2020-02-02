extends Control
class_name GUI

onready var ammo_label: = $Counters/AmmoCounter/Label
onready var souls_label: =  $Counters/SoulsCounter/Label

func initialize(ammo_count: int, souls_count: int) -> void:
    souls_label.text = str(souls_count)
    ammo_label.text = str(ammo_count)

func _on_Player_fire(_attach_to: Node2D, ammo_count: int) -> void:
    ammo_label.text = str(ammo_count)

func _on_Player_soul_lost(souls_count: int) -> void:
    souls_label.text = str(souls_count)

func _on_Player_recharged_ammo(ammo_count: int) -> void:
    ammo_label.text = str(ammo_count)
