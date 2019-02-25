extends RigidBody2D

func _ready():
    set_process(true)

func _process(delta):
	$Sprite.look_at(get_global_mouse_position())
	
	var shoot = Input.is_action_just_pressed('ui_accept')
	if shoot:
		var projectile = preload("res://Projectile.tscn").instance()
		get_parent().add_child(projectile) #don't want bullet to move with me, so add it as child of parent
		projectile.shoot_at_mouse(self.global_position)
		projectile.position = self/Position2D.global_position #use node for shoot position
		projectile.add_collision_exception_with(self) # don't want player to collide with bullet


func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		$Tween.interpolate_property(self, "global_position", self.global_position, get_global_mouse_position(), 2,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		$Tween.start()
		
