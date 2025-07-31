class_name SacModule extends Area2D

@onready var amount_carrying: int = 0
signal sacked(amount_sacked: int)

func _ready() -> void:
	self.area_entered.connect(on_collision)

func on_collision(area: Area2D):
	var treasure: Treasure = area as Treasure
	if treasure != null:
		var amount_sacked = treasure.sac(10)
		amount_carrying += amount_sacked
		sacked.emit(amount_sacked)
	
func enable():
	self.set_deferred("monitoring", true)
	self.set_deferred("monitorable", true)

func disable():
	self.set_deferred("monitoring", false)
	self.set_deferred("monitorable", false)
