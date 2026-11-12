extends Area2D
@onready var timer: Timer = $Timer
@onready var appearplat: Area2D = $"../appearplat"
@onready var key: Area2D = $"."


func _on_body_entered(body):
	if body.name == ("player"):
		key.visible = false
		timer.start()

func _on_timer_timeout():
	appearplat.position = Vector2(528.333, 139.667)
	appearplat.visible = true
