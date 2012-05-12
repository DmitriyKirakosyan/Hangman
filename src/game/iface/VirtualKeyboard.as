/**
 * Created by : Dmitry
 * Date: 5/12/12
 * Time: 5:55 PM
 */
package game.iface {
import events.VirtualKeyboardEvent;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;

public class VirtualKeyboard extends Sprite {
	private const ROWS:int = 4;
	private const COLUMNS:int = 8;

	public function VirtualKeyboard() {
		super();
		init();
	}

	private function init():void {
		var letter:VirtualKeyboardItem;
		var letters:String = "АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ";
		for (var i:int = 0; i < ROWS; ++i) {
			for (var j:int = 0; j < COLUMNS; ++j) {
				letter = new VirtualKeyboardItem(letters.charAt(i * COLUMNS + j));
				letter.x = j * (letter.width + 2);
				letter.y = i * (letter.height + 2);
				letter.mouseChildren = false;
				letter.addEventListener(MouseEvent.MOUSE_OVER, onLetterMouseOver);
				letter.addEventListener(MouseEvent.MOUSE_OUT, onLetterMouseOut);
				letter.addEventListener(MouseEvent.CLICK, onLetterClick);
				//IfaceBtnWrapper.wrap(letter);
				addChild(letter);
			}
		}
	}

	private function onLetterClick(event:MouseEvent):void {
		var letterItem:VirtualKeyboardItem = (event.target as VirtualKeyboardItem);
		dispatchEvent(new VirtualKeyboardEvent(VirtualKeyboardEvent.PUSH_LETTER, letterItem.letter));
	}

	private function onLetterMouseOver(event:MouseEvent):void {
		(event.target as Sprite).filters = [new GlowFilter()];
	}
	private function onLetterMouseOut(event:MouseEvent):void {
		(event.target as Sprite).filters = [];
	}
}
}
