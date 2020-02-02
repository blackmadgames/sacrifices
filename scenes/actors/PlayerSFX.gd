extends Node2D

func _on_Player_soul_lost(_souls_count: int) -> void:
    if $LostSoul.playing:
        $LostSoul.stop()
    $LostSoul.play()
