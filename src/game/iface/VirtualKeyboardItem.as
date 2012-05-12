/**
 * Created by : Dmitry
 * Date: 5/12/12
 * Time: 5:58 PM
 */
package game.iface {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

public class VirtualKeyboardItem extends Sprite {
	private var _letter:String;

	public function VirtualKeyboardItem(letter:String) {
		super();
		_letter = letter;
		createBackground();
		createLetter();
	}

	public function get letter():String {
		return _letter;
	}

	private function createBackground():void {
		graphics.beginFill(0xffffff);
		graphics.drawRoundRect(0, 0, 20, 20, 3, 3);
		graphics.endFill();
	}

	private function createLetter():void {
		var textFormat:TextFormat = new TextFormat( "Arial", 16, //Where is "Myriad Pro" font?
															0, true, null, null, "", "", "center", 0, 0, 0, 0);
		var textField:TextField = new TextField();
		textField.width = width;
		textField.height = height;
		textField.defaultTextFormat = textFormat;
		textField.selectable = false;
		textField.mouseEnabled = false;
		textField.text = _letter;
		addChild(textField);
	}
}
}
