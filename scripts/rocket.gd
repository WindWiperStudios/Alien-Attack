extends Area2D
class_name Rocket

@export var movSpeed : float
var damage := 1

func _physics_process(delta):
	global_position.x += movSpeed * delta

func _on_visibility_screen_exited():
	queue_free()



func _on_area_entered(area):
	area.takeDamage(damage)
	queue_free()
