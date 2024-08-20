package;

import openfl.filters.ShaderFilter;

class PlayState extends FlxState
{
	/** Reset (interval) timer for "re-shuffling". **/
	var resetTimer:Float = 2.0;

	override public function create()
	{
		super.create();

		bgColor = 0xFF000002;

		// generate stars.
		final padding:Int = 40;
		for (i in 0...250)
			add(new Star(FlxG.random.float(padding, FlxG.width - padding), FlxG.random.float(padding, FlxG.height - padding)));

		// apply bloom for awesomeness.
		FlxG.camera.filters = [new ShaderFilter(new BloomEffect().shader)];
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		resetTimer -= 1.0 * elapsed;

		if (resetTimer <= 0.0 && (FlxG.keys.justPressed.R || FlxG.mouse.justPressed))
			FlxG.resetState();

		#if !html5
		if (FlxG.keys.justPressed.F11)
			FlxG.fullscreen = !FlxG.fullscreen;
		#end
	}
}
