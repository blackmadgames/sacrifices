extends Node2D

signal checkout_item

func _on_AmmoCounter_checkout_item() -> void:
    emit_signal("checkout_item", Enum.ItemTypes.AMMO)

func _on_SkullCounter_checkout_item() -> void:
    emit_signal("checkout_item", Enum.ItemTypes.SKULL)
