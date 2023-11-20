extends Node
class_name HealthComponent

@export var health : int
@export var maxHealth : int
@onready var hitboxComp = $"../HitboxComponent"

signal deathSignal

func _ready():
	var damageSignal = hitboxComp
	damageSignal.takeDamage.connect(_on_damage)

func _on_damage(damage : int):
	health -= damage
	if health <= 0:
		emit_signal("deathSignal")
