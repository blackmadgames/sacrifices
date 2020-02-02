extends Node2D

const Player = preload("res://scripts/actors/Player.gd")
const Enum = preload("res://scripts/data/Enum.gd")

func _on_AmmoCounter_checkout_item(customer: Player) -> void:
    customer.checkout_item(Enum.ItemTypes.AMMO)

func _on_SkullCounter_checkout_item(customer: Player) -> void:
    customer.checkout_item(Enum.ItemTypes.SKULL)
