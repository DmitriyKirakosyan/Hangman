/**
 * Created by : Dmitry
 * Date: 5/12/12
 * Time: 9:13 PM
 */
package game {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import mx.controls.Text;

public class GameLetterBlock extends Sprite {
	private var _letter:String;
	private var _textField:TextField;
	private var _open:Boolean;

	public function GameLetterBlock(letter:String) {
		super();
		_letter = letter;
		_open = false;
		init();
	}

	public function get open():Boolean { return _open; }

	public function get letter():String { return _letter; }

	public function openLetter():void {
		_open = true;
		addChild(_textField);
	}

	private function init():void {
		graphics.beginFill(0xffffff, .7);
		graphics.lineStyle(1, 0xffffff);
		graphics.drawRect(0, 0, 30, 30);
		graphics.endFill();
		createTextField();
	}

	private function createTextField():void {
		_textField = new TextField();
		_textField.defaultTextFormat = new TextFormat( "Arial", 24,
															0, true, null, null, "", "", "center", 0, 0, 0, 0);
		_textField.width = width;
		_textField.height = height;
		_textField.selectable = false;
		//_textField.autoSize = TextFieldAutoSize.LEFT;
		_textField.text = _letter;
	}
}
}
