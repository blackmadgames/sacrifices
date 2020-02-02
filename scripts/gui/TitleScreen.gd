extends Control

func _ready() -> void:
    $FadeIn.show()
    $FadeIn.fade_in()

func _on_FadeIn_fade_in_over() -> void:
    $FadeIn.hide()

func _on_StartGameMenuButton_button_up() -> void:
    get_tree().change_scene(Game.GAME_SCENE)

func _on_QuitMenuButton_button_up() -> void:
    get_tree().quit()
