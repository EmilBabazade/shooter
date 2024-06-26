extends Node2D
class_name BaseLevel

var laser_scene: PackedScene = preload('res://scenes/projectiles/laser.tscn')
var grenade_scene: PackedScene = preload('res://scenes/projectiles/grenade.tscn')

func _on_player_laser_shot(pos: Vector2, direction: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos + direction * 120
	laser.rotation_degrees = rad_to_deg(direction.angle())
	laser.direction = direction 
	$Projectiles.add_child(laser)

func _on_player_grenade_shot(pos: Vector2, direction: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
