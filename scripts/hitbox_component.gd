extends CollisionPolygon2D
class_name HitboxComponent

signal takeDamage

@onready var healthComp = $"../HealthComponent"
@export var damageCD := 1.0
var damageTimer := 1.0

func _process(delta):
	if damageTimer < damageCD:
		damageTimer += delta

func _on_area_entered(area):
	if area == Rocket and damageTimer >= damageCD:
		emit_signal("takeDamage", area.damage)
		damageTimer = 0.0
		area.queue_free()
		if healthComp.health > 0:
			pass #Animate flashing until damageTimer = damageCD
