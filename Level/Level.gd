extends Node

var PlayerScore = 0
var OpponentScore = 0


func _on_Left_body_entered(body: Node) -> void:
	score_achieved()
	OpponentScore += 1


func _on_Right_body_entered(body: Node) -> void:
	score_achieved()
	PlayerScore += 1
	

func _process(delta: float) -> void:
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)

func score_achieved():
	$Ball.position = Vector2(640, 360)
	get_tree().call_group("BallGroup", "stop_ball")
	$"CountdownTimer".start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
	#$Player.position.x = 35
	$Opponent.position.x = 1280 - 75

func _on_CountdownTimer_timeout() -> void:
	get_tree().call_group("BallGroup", "restart_ball")
	$CountdownLabel.visible = false
