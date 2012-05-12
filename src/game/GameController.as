/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 5/12/12
 * Time: 7:44 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import flash.display.Sprite;

public class GameController {
	private var _container:Sprite;
	private var _gallows:Gallows;


	public function GameController(container:Sprite) {
		super();
		_container = container;
		createObjects();
	}

	/* Internal functions */

	private function createObjects():void {
		_container.addChild(new Gallows());
	}
}
}
