extends RigidBody2D

@export var speed = 750

func explode():
	var animation_player = $AnimationPlayer as AnimationPlayer
	animation_player.play('Explosion')
