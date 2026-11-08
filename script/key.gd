extends Area2D
@onready var timer: Timer = $Timer
@onready var appearplat: Area2D = $"../appearplat"


func _on_body_entered(body):
	if body.name == ("player"):
		timer.start()

func _on_timer_timeout():
	appearplat.position = Vector2(528.333, 139.667)
	appearplat.visible = true
