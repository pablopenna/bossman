shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
  	VERTEX.x *= 1.0 + abs(sin(TIME))*0.5;
	VERTEX.y *= 1.0 + abs(cos(TIME))*0.2;
}

void fragment() {
	// Called for every pixel the material is visible on.
	COLOR = texture(TEXTURE, UV);
    COLOR.r = clamp(COLOR.r, 0.8, 1.0);
	COLOR.g = clamp(COLOR.r, 0.8, 1.0);
	COLOR.b = clamp(COLOR.b, 0.8, 1.0);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
