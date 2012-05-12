/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 5/12/12
 * Time: 5:51 PM
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Sprite;

import game.Gallows;
import game.GameController;

[SWF(width=310, height=450, frameRate=40)]
public class Main extends Sprite{
	public static const WIDTH:int = 310;
	public static const HEIGHT:int = 450;
	public static const GAME_LOGO:String = "Игра ВИСЕЛИЦА";
	public static const GAME_WORDS:Array = ["ОДИН", "ДВА", "ТРИ", "ДВАДЦАТЬ", "ЛОПАТА"];

	public function Main() {
		new GameController(this);
	}
}
}
