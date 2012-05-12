/**
 * Created by : Dmitry
 * Date: 5/12/12
 * Time: 8:12 PM
 */
package game.iface {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

public class HelpField extends Sprite {
	public function HelpField() {
		super();
		init();
	}

	private function init():void {
		createBackground();
		createText();
	}

	private function createBackground():void {
		graphics.beginFill(0xffffff, .5);
		graphics.lineStyle(2, 0xffffff);
		graphics.drawRoundRect(0, 0, 290, 190, 20, 20);
		graphics.endFill();
	}

	private function createText():void {
		var textField:TextField = new TextField();
		var textFormat:TextFormat = new TextFormat( "Arial", 12,
															0, null, null, null, "", "", TextFormatAlign.JUSTIFY, 0, 0, 0, 2);
		textField.defaultTextFormat = textFormat;
		textField.width = width - 40;
		textField.x = 20;
		textField.height = height - 40;
		textField.y = 20;
		textField.selectable = false;
		//textField.autoSize = TextFieldAutoSize.LEFT;
		textField.wordWrap = true;
		textField.htmlText = "После начала игры, выбирайте по одной букве из алфавита. Ваша цель - угадать слово.\n" +
						"С каждой не правильной буквой на экране будет появляться элемент выселицы. Когда виселица целиком появится" +
						"на экране - Вы проиграли. \n Если вы угадаете какую-то букву из слова, то эта буква будет открыта.";
		addChild(textField);
	}

}
}
