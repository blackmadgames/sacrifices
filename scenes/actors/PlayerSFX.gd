extends Node2D

func _on_Player_soul_lost(_souls_count: int) -> void:
    _play($LostSoul)

func _on_Player_shield_up() -> void:
    _play($ShieldUp)

func _play(audio: AudioStreamPlayer) -> void:
    if audio.playing:
        audio.stop()
    audio.play()
