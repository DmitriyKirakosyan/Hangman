/**
 * Created by : Dmitry
 * Date: 5/12/12
 * Time: 7:57 PM
 */
package events {
import flash.events.Event;

public class VirtualKeyboardEvent extends Event {
	public var letter:String;

	public static const PUSH_LETTER:String = "pushLetter";
	public function VirtualKeyboardEvent(type:String, letter:String) {
		super(type);
		this.letter = letter;
	}
}
}
