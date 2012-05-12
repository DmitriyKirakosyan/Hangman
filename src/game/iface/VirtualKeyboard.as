/**
 * Created by : Dmitry
 * Date: 5/12/12
 * Time: 5:55 PM
 */
package game.iface {
import flash.display.Sprite;

public class VirtualKeyboard extends Sprite {
	private const ROWS:int = 4;
	private const COLUMNS:int = 8;

	public function VirtualKeyboard() {
		super();
		init();
	}

	private function init():void {
		var letter:VirtualKeyboardItem;
		var letters:String = "абвгдежзийклмнопрстуфхцчшщъыьэюя";
		for (var i:int = 0; i < ROWS; ++i) {
			for (var j:int = 0; j < COLUMNS; ++j) {
				letter = new VirtualKeyboardItem(letters.charAt(i * COLUMNS + j));
				letter.x = j * (letter.width + 2);
				letter.y = i * (letter.height + 2);
				addChild(letter);
			}
		}
	}
}
}
