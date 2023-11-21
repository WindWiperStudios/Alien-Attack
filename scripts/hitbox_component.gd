extends CollisionPolygon2D
class_name HitboxComponent

signal takeDamage

@onready var healthComp = $"../HealthComponent"
@export var damageCD := 1.0
var damageTimer := 1.0

func _process(delta):
	if damageTimer < damageCD:
		damageTimer += delta
