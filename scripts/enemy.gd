extends Area2D
class_name Enemy

@export var movSpeed : float
@export var damage := 1
@onready var healthComp = $HealthComponent
var projectileContainer
var projectileScene = preload("res://scenes/enemy_projectile.tscn")
var shootTime := 1.5
var timeToShoot := 0.0

func _ready():
	movSpeed = randf_range(250.0, 350.0) 
	if healthComp != null:
		healthComp.deathSignal.connect(_on_death)
	shootTime = randf_range(.25, 2.5)
	projectileContainer = get_tree().root
		
func _process(delta):
	timeToShoot += delta
	if timeToShoot >= shootTime:
		shoot()

func _physics_process(delta):
	global_position.x -= movSpeed * delta
	
func shoot():
	var projectile = projectileScene.instantiate()
	projectileContainer.add_child(projectile)
	projectile.movSpeed += self.movSpeed
	projectile.global_position = self.global_position
	projectile.global_position.x -= 20
	timeToShoot = 0.0
	shootTime = randf_range(1, 3)
	
func _on_death():
	queue_free()


func _on_screen_exited():
	queue_free()

func takeDamage(takenDamage : int):
	healthComp._on_damage(takenDamage)
