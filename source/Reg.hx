package ;

import flixel.util.FlxSave;

/**
 * Handy, pre-built Registry class that can be used to store
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	static public var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	static public var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	static public var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	static public var score:Int = 0;
	/**
	 * Generic bucket for storing different <code>FlxSaves</code>.
	 * Especially useful for setting up multiple save slots.
	 */
	static public var saves:Array<FlxSave> = [];
	
	public static var textfont : String = "assets/data/wendy.ttf";
	
	public static var car_red : String = "assets/images/car_red.png";
	public static var car_blue : String = "assets/images/car_blue.png";
	public static var car_green : String = "assets/images/car_green.png";
	public static var car_yellow : String = "assets/images/car_yellow.png";
	public static var car_colors : Array<String> = [car_red,car_blue,car_green,car_yellow];
}