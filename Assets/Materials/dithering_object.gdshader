// Adapted from stephanbogner/1-pico8-godot-shader.shader
// By Rank1
// very bad

// Type of shader https://docs.godotengine.org/en/3.0/tutorials/shading/shading_language.html#shader-types
shader_type canvas_item;



//How Pixelated it is
uniform int u_dither_size;
//What colors this chooses from
uniform sampler2D u_dither_color: filter_nearest;
//How many colors there are in u_dither_color
uniform int color_amount;
//How much dither
uniform float u_dither_amount = 1;
//
uniform sampler2D u_dither_type: filter_nearest, repeat_enable;


void fragment(){

	//Rescales the screen basically and grab the individual pixel cord and color
	vec2 screen_size = vec2(textureSize(TEXTURE, 0)) / float(u_dither_size);
	vec2 uv_cord = floor(UV * screen_size);
	vec2 screen_sample_uv = uv_cord / screen_size;
	vec3 current_color = texture(TEXTURE, screen_sample_uv).rgb;
	
	
	

	float min_diff = 1000.0;
	vec3 shader_color = vec3(0.0, 0.0, 0.0);


	//Grabs the closet color to the actual color on screen
	for(int i=0; i < color_amount; i++){
		vec3 focused_color = texture(u_dither_color, vec2(float(i)/float(color_amount),0.5)).rgb;
		float curr_dist = distance(focused_color, current_color);
		if(curr_dist < min_diff){
			min_diff = curr_dist;
			shader_color = focused_color;
		}
	}
	
	//Grab the second closet color 
	vec3 before_color = vec3(0.0, 0.0, 0.0);
	float new_diff = 1000.0;
	for(int i=0; i <  color_amount; i++){
		vec3 focused_color = texture(u_dither_color, vec2(float(i)/float(color_amount), 0.5)).rgb;
		float curr_dist = distance(focused_color, current_color);
		if(curr_dist < new_diff){
			if(curr_dist > min_diff){
				new_diff = curr_dist;
				before_color = focused_color;
			}
		}
	}
	
	//If the distance between the first color and actual color is greater then the distance between the first and second, starts to dither
	
	
	vec2 egg = screen_size/ vec2(textureSize(u_dither_type,0));
	if(distance(current_color, shader_color)*u_dither_amount > distance(before_color, shader_color)){
	
		if(texture(u_dither_type, screen_sample_uv * egg).r >= 0.5){
			shader_color = before_color;
		}
	}


	COLOR.rgb = shader_color.rgb;
}