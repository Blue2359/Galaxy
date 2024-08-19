package;

import flixel.system.FlxAssets.FlxShader;

class BloomEffect
{
	/** The shader instance. **/
	public var shader(default, null):Shader = new Shader();

	/** How much to intensify the blur amount. **/
	public var intensity(default, set):Float = 0.0;

	function set_intensity(val:Float):Float
	{
		shader.intensity.value = [val];
		return val;
	}

	/** How big the blur size should be. **/
	public var blurSize(default, set):Float = 0.0;

	function set_blurSize(val:Float):Float
	{
		shader.blurSize.value = [val];
		return val;
	}

	/** Initializes this effect instance. **/
	public function new(intensity = 0.50, blurSize = 1.0 / 300.0)
	{
		this.intensity = intensity;
		this.blurSize = blurSize;
	}
}

/** The primary shader class. **/
class Shader extends FlxShader
{
	// This source code could be better...
	@:glFragmentSource("
        #pragma header

        uniform float intensity; 
        uniform float blurSize;

        void main()
        {
            vec4 sum = vec4(0);
            vec2 texCoord = openfl_TextureCoordv;

            // 1.
            sum = flixel_texture2D(bitmap, vec2(texCoord.x - (6.0*blurSize), texCoord.y)) * 0.05;
            sum += flixel_texture2D(bitmap, vec2(texCoord.x - (4.0*blurSize), texCoord.y)) * 0.10;
            sum += flixel_texture2D(bitmap, vec2(texCoord.x - (2.0*blurSize), texCoord.y)) * 0.15;
            sum += flixel_texture2D(bitmap, vec2(texCoord.x - blurSize, texCoord.y)) * 0.5;
            sum += flixel_texture2D(bitmap, vec2(texCoord.x, texCoord.y)) * 0.20;
            sum += flixel_texture2D(bitmap, vec2(texCoord.x + blurSize, texCoord.y)) * 0.25;

            // 2.
            sum += flixel_texture2D(bitmap, vec2(texCoord.x, texCoord.y - (6.0*blurSize))) * 0.05;
            sum += flixel_texture2D(bitmap, vec2(texCoord.x, texCoord.y - (4.0*blurSize))) * 0.10;
            sum += flixel_texture2D(bitmap, vec2(texCoord.x, texCoord.y - (2.0*blurSize))) * 0.15;
            sum += flixel_texture2D(bitmap, vec2(texCoord.x, texCoord.y - blurSize)) * 0.5;
            sum += flixel_texture2D(bitmap, vec2(texCoord.x, texCoord.y)) * 0.20;
            sum += flixel_texture2D(bitmap, vec2(texCoord.x, texCoord.y + blurSize)) * 0.25;

            // increase blur with intensity.
            gl_FragColor = (sum*intensity) + flixel_texture2D(bitmap, texCoord);
        }
    ")
	public function new()
	{
		super();
	}
}
