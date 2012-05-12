/**
 * Created by : Dmitry
 * Date: 5/12/12
 * Time: 10:37 PM
 */
package game {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import mx.controls.Text;

public class GameStatistic {
	private var _view:Sprite;
	private var _loseTF:TextField;
	private var _winTF:TextField;

	public function GameStatistic():void {
		super();
		_view = new Sprite();
		init();
	}

	/* API */

	public function get view():Sprite { return _view; }

	public function winsPlus():void {
		_winTF.text = (int(_winTF.text) + 1).toString();
	}

	public function losesPlus():void {
		_loseTF.text = (int(_loseTF.text) + 1).toString();
	}

	/* Internal functions */

	private function init():void {
		var tempTF:TextField = createTextField("побед: ");
		view.addChild(tempTF);
		_winTF = createTextField("0");
		_winTF.x = tempTF.textWidth + 3;
		view.addChild(_winTF);
		tempTF = createTextField("/ поражений: ");
		tempTF.x = _winTF.x + _winTF.textWidth + 13;
		view.addChild(tempTF);
		_loseTF = createTextField("0");
		_loseTF.x = tempTF.x + tempTF.textWidth + 3;
		view.addChild(_loseTF);
	}

	private function createTextField(text:String):TextField {
		var textField:TextField = new TextField();
		textField.selectable = false;
		textField.defaultTextFormat = new TextFormat( "Arial", 16,
															0xffffff, true, null, null, "", "", TextFormatAlign.LEFT, 0, 0, 0, 0);
		textField.autoSize = TextFieldAutoSize.LEFT;
		textField.text = text;
		return textField;
	}
}
}
