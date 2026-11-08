extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -930
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	#animation
	if velocity.x >1 or velocity.x <-1:
		animated_sprite_2d.animation = "walking"
	else:
		animated_sprite_2d.animation = "idle"
		
	#gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#input direction
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	#flip player
	if direction == 1.0:
		animated_sprite_2d.flip_h = false
	elif direction == -1.0:
		animated_sprite_2d.flip_h = true
