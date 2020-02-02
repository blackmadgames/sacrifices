extends Node2D

const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_IN_OUT

var amplitude = 0
onready var camera = get_parent()

func start(duration: = 0.2, frequency: = 15, amplitude: = 16) -> void:
    self.amplitude = amplitude
    $Frequency.wait_time = 1 / float(frequency)
    $Duration.wait_time = duration
    
    $Duration.start()
    $Frequency.start()
    
    _new_shake()

func _ready() -> void:
    $Frequency.connect("timeout", self, "_on_Frequency_timeout")
    $Duration.connect("timeout", self, "_on_Duration_timeout")

func _new_shake() -> void:
    var rand = Vector2()
    rand.x = rand_range(-amplitude, amplitude)
    rand.y = rand_range(-amplitude, amplitude)

    $Tween.interpolate_property(
        camera,
        "offset",
        camera.offset,
        rand,
        $Frequency.wait_time,
        TRANS,
        EASE
    )
    $Tween.start()

func _reset() -> void:
    $Tween.interpolate_property(
        camera,
        "offset",
        camera.offset,
        Vector2(),
        $Frequency.wait_time,
        TRANS,
        EASE
    )
    $Tween.start()

func _on_Frequency_timeout() -> void:
    _new_shake()

func _on_Duration_timeout() -> void:
    _reset()
    $Frequency.stop()

func _on_Player_hit(_hp: int) -> void:
    start()
