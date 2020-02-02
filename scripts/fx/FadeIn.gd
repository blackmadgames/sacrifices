extends ColorRect

signal fade_in_over

const FADE_IN_ANIM_KEY = "FadeIn"

func fade_in():
    $AnimationPlayer.play(FADE_IN_ANIM_KEY)

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
    if anim_name == FADE_IN_ANIM_KEY:
        emit_signal("fade_in_over")
