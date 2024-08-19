package;

import openfl.filters.ShaderFilter;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		// galaxy.
		add(new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0xFF000002));

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

		if (FlxG.keys.justPressed.R)
			FlxG.resetState();

		if (FlxG.keys.justPressed.F11)
			FlxG.fullscreen = !FlxG.fullscreen;
	}
}
