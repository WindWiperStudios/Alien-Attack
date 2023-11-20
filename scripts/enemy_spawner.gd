extends Node2D

@onready var enemyScene := preload("res://scenes/enemy_formation.tscn")
@onready var random = RandomNumberGenerator.new()
@export var timeToSpawn := 2.5
var timer := 0.0

func _process(delta):
	timer += delta
	if timer >= timeToSpawn:
		spawnEnemies()
		timer = 0.0


func spawnEnemies():
	var enemy = enemyScene.instantiate()
	self.add_child(enemy)
	enemy.global_position = self.global_position
	enemy.global_position.y = random.randf_range(175, get_viewport_rect().size.y - 175.0)

