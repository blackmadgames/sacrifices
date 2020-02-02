extends HBoxContainer

const SOUL_ICON_SCENE = preload("res://scenes/gui/SoulScreenIcon.tscn")

func initialize(souls_count: int) -> void:
    for _i in range(souls_count):
        var instance = SOUL_ICON_SCENE.instance()
        add_child(instance)
