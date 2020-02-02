extends ColorRect

const FADE_IN_ANIM_KEY = "FadeIn"

func _ready() -> void:
    fade_in()

func fade_in():
    $AnimationPlayer.stop()
    $AnimationPlayer.play(FADE_IN_ANIM_KEY)

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
    if anim_name == FADE_IN_ANIM_KEY:
        hide()
