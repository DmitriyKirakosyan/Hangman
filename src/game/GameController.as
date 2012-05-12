/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 5/12/12
 * Time: 7:44 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import flash.display.DisplayObject;
import flash.display.Sprite;

import game.iface.VirtualKeyboard;

import mx.skins.halo.HaloBorder;

public class GameController {
	private var _container:Sprite;
	private var _gallows:Gallows;
	private var _help:DisplayObject;
	private var _startBtn:Sprite;
	private var _keyboard:VirtualKeyboard;

	[Embed(source="../materials/images/bg.jpg")] private static const BG:Class;
	[Embed(source="../materials/images/hangman.png")] private static const HANGMAN:Class;


	public function GameController(container:Sprite) {
		super();
		_container = container;
		createBackground();
		createVirtualKeyboard();
		createStartBtn();
		showHelp();
		createObjects();
	}

	/* Internal functions */

	private function createObjects():void {
		_container.addChild(new Gallows());
	}

	private function createBackground():void {
		_container.addChild(new BG());
		var hangman:DisplayObject = new HANGMAN();
		hangman.x = 3;
		hangman.y = Main.HEIGHT - hangman.height - 8;
		_container.addChild(hangman);
	}

	private function createVirtualKeyboard():void {
		_keyboard = new VirtualKeyboard();
		_container.addChild(_keyboard);
	}

	private function showHelp():void {
		//show help img;
	}

	private function createStartBtn():void {
		_startBtn = new Sprite();
		//_startBtn.addChild()
	}

}
}
