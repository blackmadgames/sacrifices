extends Area2D
class_name Exit

func _on_Exit_body_entered(body: Node) -> void:
    if body.is_in_group("Player"):
        get_tree().change_scene("res://scenes/screens/GameOver.tscn")
