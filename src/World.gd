extends Node2D

var enemy = preload("res://src/Enemy.tscn")
var enemy_counter = 0
var is_enemy_maxed = false

func _ready():
	Global.node_creation_parent = self

func _exit_tree():
	Global.node_creation_parent = null

func _on_Enemy_spawn_timer_timeout():
	var enemy_position = Vector2(rand_range(-100,2000), rand_range(-100, 1250))
	
	while enemy_position.x > -20 and enemy_position.x < 1950 or enemy_position.y > -20 and enemy_position.y < 1230:
		enemy_position = Vector2(rand_range(-100,2000), rand_range(-100, 1250))
	
	check_enemy_counter()
	if (is_enemy_maxed == false):
		Global.instance_node(enemy, enemy_position, self)
		enemy_counter += 1

func check_enemy_counter():
	if(enemy_counter >= 7):
		is_enemy_maxed = true
	else:
		is_enemy_maxed = false
	
