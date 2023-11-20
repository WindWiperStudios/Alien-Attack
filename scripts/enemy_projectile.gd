extends Area2D
class_name EnemyProjectile

@export var movSpeed := 75.0
var damage := 1

func _physics_process(delta):
	global_position.x -= movSpeed * delta


func _on_screen_exited():
	queue_free()
