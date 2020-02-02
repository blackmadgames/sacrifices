extends Actor
class_name Enemy

const DEATH_PARTICLES_SCENE = preload("res://scenes/particules/Mist.tscn")

export var projectile_scene: PackedScene = null
export var projectile_strength: = 30

var target: Node = null
var direction_before_interruption: = 0.0

func fire() -> void:
    if target == null:
        return

    var projectile: = projectile_scene.instance()
    get_parent().add_child(projectile)
    projectile.fire(global_position, global_rotation, projectile_strength)

func _ready() -> void:
    $Timer.connect("timeout", self, "fire")
    $Timer.set_wait_time(1)
    $Timer.start()

func hit() -> void:
    .hit()
    _die()

func _die():
    var particles = DEATH_PARTICLES_SCENE.instance()
    particles.position = position
    get_parent().add_child(particles)
    particles.emitting = true
    queue_free()

func _physics_process(delta: float) -> void:
    if target:
        look_at(target.global_position)
        # look_at considers Vector2.UP to be 0 rad rotation,
        # so we need to add a 90 deg angle:
        rotation += PI / 2
        return

    var movement = Vector2.UP.rotated(rotation) * speed * delta * 1000
    velocity = move_and_slide(movement)
    _check_collisions()

func _check_collisions() -> void:
    for i in get_slide_count():
        var collision = get_slide_collision(i)
        _on_collide(collision)
        return

func _on_collide(collision: KinematicCollision2D) -> void:
    if collision.collider.is_in_group("Player") && collision.collider.has_method("hit"):
        collision.collider.hit()
    else:
        rotate(PI)

func _on_DetectionRange_body_entered(body: Node) -> void:
    if body.is_in_group("Player"):
        var space_state = get_world_2d().direct_space_state
        var result = space_state.intersect_ray(
            global_position,
            body.global_position,
            [self],
            $RayCast2D.collision_mask
        )
        if result && result.collider.is_in_group("Player"):
            target = body
            direction_before_interruption = rotation

func _on_DetectionRange_body_exited(body: Node) -> void:
    if body.is_in_group("Player"):
        target = null
        rotation = direction_before_interruption
