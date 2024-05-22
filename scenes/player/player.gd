extends CharacterBody2D

signal laser_shot(laser_pos: Vector2, direction: Vector2)
signal grenade_shot(grenade_pos: Vector2, direction: Vector2)

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
# movement input
	var direction = Input.get_vector('left', 'right', 'up', 'down');
	velocity = direction * 500
	move_and_slide()
	
# rotation
	look_at(get_global_mouse_position())
	
# laser 
	if Input.is_action_pressed('primary_action') and can_laser:
		$GPUParticles2D.emitting = true
		can_laser = false
		position
		$LaserTimer.start()
		laser_shot.emit(get_projectile_position(), get_player_direction())
# grenade
	if Input.is_action_pressed('secondary_action') and can_grenade:
		can_grenade = false
		$GrenadeTimer.start()
		grenade_shot.emit(get_projectile_position(), get_player_direction())
	
func get_player_direction() -> Vector2:
	var player_direction = get_global_mouse_position() - position
	return player_direction.normalized()

func get_projectile_position() -> Vector2:
	var markers = $ProjectileStartPositions.get_children()
	var selected_marker = markers[randi() % markers.size()]
	return selected_marker.global_position

func _on_laser_timer_timeout():
	can_laser = true

func _on_grenade_timer_timeout():
	can_grenade = true
