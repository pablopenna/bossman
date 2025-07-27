shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
  	VERTEX.x *= 1.0 + abs(sin(TIME))*0.5;
	VERTEX.y *= 1.0 + abs(cos(TIME))*0.2;
}