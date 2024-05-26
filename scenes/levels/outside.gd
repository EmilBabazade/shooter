extends BaseLevel

func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, 'speed', 0, .5)

func _on_house_player_entered():
	camera_zoom_tween(Vector2(1, 1))

func _on_house_player_exited():
	camera_zoom_tween(Vector2(.6, .6))

func camera_zoom_tween(zoom: Vector2, duration: int = 1):
	var tween = create_tween()
	tween.tween_property($Player/Camera2D, 'zoom', zoom, duration).set_trans(Tween.TRANS_SPRING)
