package;

import flixel.util.FlxColor;

class Star extends FlxSprite
{
	/** List of star colors to pick from. **/
	final colors:Array<String> = ["0xFFffffff", "0xFFa075ff", "0xFFb55bcf", "0xffa7b5e4", "0xfffffea8"];

	/** Flicker (interval) timer. **/
	var time:Float = 0.0;

	public function new(x = 0.0, y = 0.0)
	{
		super(x, y);
		makeGraphic(1, 1, FlxColor.fromString('${colors[FlxG.random.int(0, colors.length - 1)]}'));
	}

	override public function update(_:Float)
	{
		super.update(_);

		time += (0.01 / 0.06); // flicker.

		if (time >= FlxG.random.int(0, 2))
		{
			alpha = 0.5;
			time = 0.0; // reset.
		}
		else
			alpha = 1.0;
	}
}
