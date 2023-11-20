extends CharacterBody2D
class_name Player

var movSpeed := 500.0
var rocketScene = preload("res://scenes/rocket.tscn")
var shotTimer := .75
@export var shotCD := .75
@export var damage := 1
@onready var rocketSpawn = $RocketSpawn
@onready var projectileContainer = $ProjectileContainer

func _process(delta):
	if shotTimer < shotCD:
		shotTimer += delta
	if Input.is_action_just_pressed("shoot") and shotTimer >= shotCD:
		shoot()

func _physics_process(delta):
	var dir : Vector2
	dir.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	velocity = dir * movSpeed
	move_and_slide()
	position.y = clampf(global_position.y, 20, get_viewport_rect().size.y - 20)

func shoot():
	var rocket = rocketScene.instantiate()
	projectileContainer.add_child(rocket)
	rocket.global_position = rocketSpawn.global_position
	shotTimer = 0.0
