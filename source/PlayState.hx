package ;

import entities.Car;
import entities.Player;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import flixel.FlxCamera;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var player : Player;
	var map : FlxTilemap;
	
	var cars : FlxTypedGroup<Car>;
	var carsCount : Int = 30;
	
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;

		map = new FlxTilemap();
		map.loadMap(Assets.getText("assets/data/mapCSV_City_background.csv"), "assets/images/tileset1.png",8,8);
		add(map);
		
		cars = new FlxTypedGroup<Car>();
		for (c in 0...carsCount) {
			MakeCar();
		}
		add(cars);
		
		player = new Player(50, 50);
		add(player);
		
		FlxG.worldBounds.set(0, 0, map.width, map.height);
		
		FlxG.camera.follow(player);
		FlxG.camera.followAdjust(player.acceleration.x / 100, player.acceleration.y / 100);
		
		super.create();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		FlxG.collide(player, cars, CarHit);
		FlxG.collide(cars, cars, CarHit);
	}
	
	function MakeCar():Void {
		cars.add(new Car(Math.random() * map.width, Math.random() * map.height, Reg.car_colors[Std.random(Reg.car_colors.length)]));
	}
	
	function CarHit(player : FlxObject, car : Car):Void {
		car.Explode(player.velocity);
	}
}