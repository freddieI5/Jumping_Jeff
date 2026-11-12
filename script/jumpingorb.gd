extends Area2D

@onready var player: CharacterBody2D = null

func _on_body_entered(body):
	player = body

func _on_body_exited(body):
	player = null

func _physics_process(delta):
	if player != null and Input.is_action_just_pressed("jump"):
		player.velocity.y = -1500
