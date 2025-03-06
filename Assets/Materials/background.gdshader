shader_type canvas_item;

uniform float effect = -1.1; // -1.0 is BARREL, 0.1 is PINCUSHION. For planets, ideally -1.1 to -4.
uniform float effect_scale = 1.1; // Play with this to slightly vary the results.
uniform bool dynamic_crop = false; // Guesses the crop amount with an admittedly badly inaccurate formula.
uniform bool manual_crop = false; // Cut out the junk outside the sphere.
uniform float manual_amount = 0.95; // Higher value = more crop.

uniform vec2 scroll = vec2(0.05, 0.025);

uniform int pixel_size : hint_range(1, 100) = 1;

vec2 distort(vec2 p) {

	float d = length(p);
	float z = sqrt(1.0 + d * d * effect);
	float r = atan(d, z) / 3.14159;
	r *= effect_scale;
	float phi = atan(p.y, p.x);
	return vec2(r*cos(phi)+.5,r*sin(phi)+.5);
}

void fragment() {
	
	vec2 pos = UV / TEXTURE_PIXEL_SIZE;
	vec2 square = vec2(float(pixel_size), float(pixel_size));
	vec2 top_left = floor(pos / square) * square;
	vec4 total = vec4(0., 0., 0., 0.);
	for (int x = int(top_left.x); x < int(top_left.x) + pixel_size; x++){
		for (int y = int(top_left.y); y < int(top_left.y) + pixel_size; y++){
			total += texture(TEXTURE, vec2(float(x), float(y)) * TEXTURE_PIXEL_SIZE);
		}
	}
	COLOR = total / float(pixel_size * pixel_size);
	
	//Pincushion
	vec2 xy = (2.0 * UV);
	xy.x = xy.x - 1.0;
	xy.y = xy.y - 1.0;

	// Dynamic crop adjustment. -0.5 is equavalent to 'none'.
	float d_adjust = -0.5;
	if (dynamic_crop) {
		d_adjust = (effect/4.0) * -0.6;
	}

	// Perform distortion if needed.
	vec4 tex;
	float d = length(xy);
	if (d < 1.0 - d_adjust) {
		xy = distort(xy);
		tex = texture(TEXTURE, xy + scroll * TIME);
		COLOR = tex;
	}
	else {
		COLOR.a = 0.0;
	}

	// Apply manual crop.
	if (manual_crop && d > manual_amount) {
		COLOR.a = 0.0;
	}
}
