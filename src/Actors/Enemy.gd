extends Actor
export var enemySpeed = -60.0
export var facing_right = false
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if !$floorCheck.is_colliding() && is_on_floor() || $wallCheck.is_colliding():
		flip()
	
	velocity.x = enemySpeed
	move_and_slide(velocity, Vector2.UP)

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		enemySpeed = abs(enemySpeed)
	else:
		enemySpeed = abs(enemySpeed) * -1

func _on_HitboxKill_body_entered(body):
	if body.get_name() == "Player":
		body.respawn()


func _on_HitboxDie_body_entered(body):
	if body.get_name() == "Player":
		queue_free()
