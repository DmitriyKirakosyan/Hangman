/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 5/12/12
 * Time: 6:34 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import flash.display.DisplayObject;
import flash.display.Sprite;

public class Gallows extends Sprite{
	private var _level:uint;
	private var _sprites:Vector.<DisplayObject>;

	[Embed(source="../materials/images/V1_new.png")] private static const V1:Class;
	[Embed(source="../materials/images/V2_new.png")] private static const V2:Class;
	[Embed(source="../materials/images/V3_new.png")] private static const V3:Class;
	[Embed(source="../materials/images/V4_new.png")] private static const V4:Class;
	[Embed(source="../materials/images/V5_new.png")] private static const V5:Class;
	[Embed(source="../materials/images/V6_new.png")] private static const V6:Class;

	private const IMG_CLASSES:Array = [V1, V2, V3, V4, V5, V6];

	public function Gallows() {
		super();
		_level = 0;
		initSprites();
	}

	public function levelUp():void {
		if (_level >= _sprites.length) { return; }

		_level++;
		addChild(_sprites[_level-1]);

	}

	public function setLevel(value:uint):void {
		if (value < 0 || value > _sprites.length) { return; }
		_level = value;
		updateImage();
	}

	/* Internal functions */

	private function initSprites():void {
		_sprites = new Vector.<DisplayObject>(6, true);
		for (var i:int = 0; i < _sprites.length; ++i) {
			_sprites[i] = new IMG_CLASSES[i]();
		}
	}

	private function updateImage():void {
		for (var i:int = 0; i < _sprites.length; ++i) {
			if (i < _level) {
				if (!contains(_sprites[i])) {
					addChild(_sprites[i]);
				}
			} else {
				if (contains(_sprites[i])) {
					removeChild(_sprites[i]);
				}
			}
		}
	}
}
}
