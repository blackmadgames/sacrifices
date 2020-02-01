extends KinematicBody2D
class_name Projectile

export var speed: = Vector2(0, 0)

func fire(origin: Vector2, direction: float, force: float) -> void:
    speed = Vector2.UP.rotated(direction) * force
    position = origin
    rotation = direction

func _physics_process(delta: float) -> void:
    var velocity = speed * delta * 1000
    velocity = move_and_slide(velocity)
    _check_collisions()

func _check_collisions() -> void:
    for i in get_slide_count():
        var collision = get_slide_collision(i)
        _on_collide(collision)
        return

func _on_collide(collision: KinematicCollision2D) -> void:
    if collision.collider.has_method("hit"):
        collision.collider.hit()
    queue_free()
