extends RigidBody2D

export var speed = 300

func shoot_at_mouse(start_pos):
    self.global_position = start_pos
    var direction = (get_global_mouse_position() - start_pos).normalized()
    self.linear_velocity = direction * speed


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()