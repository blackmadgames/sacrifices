extends RigidBody2D

export var lifetime_ms: float = 800

func fire(origin: Vector2, direction: float, force: float) -> void:
    position = origin
    apply_central_impulse((Vector2.UP * force).rotated(direction))
