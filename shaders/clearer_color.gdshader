shader_type canvas_item;

void fragment() {
	// Called for every pixel the material is visible on.
	COLOR = texture(TEXTURE, UV);
    COLOR.r = clamp(COLOR.r, 0.8, 1.0);
	COLOR.g = clamp(COLOR.r, 0.8, 1.0);
	COLOR.b = clamp(COLOR.b, 0.8, 1.0);
}