class_name Goblin extends Entity

var treasure: Treasure

func die(_damage):
	call_deferred("queue_free")
