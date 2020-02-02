extends Node2D

var Enum = preload("res://scripts/data/Enum.gd")

signal checkout_item

func _on_AmmoCounter_checkout_item() -> void:
    emit_signal("checkout_item", Enum.ItemTypes.AMMO)

func _on_SkullCounter_checkout_item() -> void:
    emit_signal("checkout_item", Enum.ItemTypes.SKULL)
