/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 5/12/12
 * Time: 7:44 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import events.VirtualKeyboardEvent;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import game.iface.HelpField;
import game.iface.IfaceBtnWrapper;

import game.iface.VirtualKeyboard;

import mx.controls.Text;

import mx.skins.halo.HaloBorder;

public class GameController {
	private var _container:Sprite;
	private var _gallows:Gallows;
	private var _startBtn:Sprite;
	private var _helpField:HelpField;
	private var _keyboard:VirtualKeyboard;
	private var _gameWordController:GameWordController;

	[Embed(source="../materials/images/bg.jpg")] private static const BG:Class;
	[Embed(source="../materials/images/hangman.png")] private static const HANGMAN:Class;


	public function GameController(container:Sprite) {
		super();
		_container = container;
		createObjects();
	}

	/* Internal functions */

	private function startGame():void {
		hideStartBtn();
		_gallows.setLevel(0);
		showKeyboard();
		_gameWordController.newWord();
		showGameWordPanel();
	}

	private function endGame(win:Boolean):void {
		hideKeyboard();
		hideGameWordPanel();
		showStartBtn();
	}

	private function onStartBtnClick(event:MouseEvent):void {
		if (_container.contains(_helpField)) {
			_container.removeChild(_helpField);
		}
		startGame();
	}

	private function onPushLetter(event:VirtualKeyboardEvent):void {
		if (_gameWordController.containsLetter(event.letter)) {
			_gameWordController.showLetter(event.letter);
			if (_gameWordController.allLettersShowed()) {
				endGame(true);
			}
		} else {
			if (_gallows.maxLevel) {
				_gallows.showMan();
				endGame(false);
			} else {
				_gallows.levelUp();
			}
		}
	}

	/* interface objects */

	private function createObjects():void {
		createBackgroundAndShow();
		createGallowsAndShow();
		createHangmanAndShow();
		createAndShowHelp();
		createStartBtn();
		showStartBtn();
		createVirtualKeyboard();
		createGameWordPanel();
	}

	private function createBackgroundAndShow():void {
		_container.addChild(new BG());
		var logoText:TextField = new TextField();
		logoText.defaultTextFormat = new TextFormat( "Arial", 24,
															0xffffff, true, null, null, "", "", TextFormatAlign.LEFT, 0, 0, 0, 0);
		logoText.autoSize = TextFieldAutoSize.LEFT;
		logoText.selectable = false;
		logoText.x = 10;
		logoText.y = 10;
		logoText.text = Main.GAME_LOGO;
		_container.addChild(logoText);
	}
	private function createHangmanAndShow():void {
		var hangman:DisplayObject = new HANGMAN();
		hangman.x = 3;
		hangman.y = Main.HEIGHT - hangman.height - 8;
		_container.addChild(hangman);
	}

	private function createVirtualKeyboard():void {
		_keyboard = new VirtualKeyboard();
		_keyboard.x = Main.WIDTH - _keyboard.width - 20;
		_keyboard.y = 320;
		_keyboard.addEventListener(VirtualKeyboardEvent.PUSH_LETTER, onPushLetter);
	}
	private function showKeyboard():void {
		_container.addChild(_keyboard);
	}
	private function hideKeyboard():void {
		if (_container.contains(_keyboard)) { _container.removeChild(_keyboard);
		} else {
			trace("keyboard not on container [GameController.hideKeyboard]");
		}
	}

	private function createAndShowHelp():void {
		_helpField = new HelpField();
		_helpField.x = 10;
		_helpField.y = 50;
		_container.addChild(_helpField);
	}

	private function createStartBtn():void {
		_startBtn = new Sprite();
		_startBtn.graphics.beginFill(0xadffda);
		_startBtn.graphics.drawRect(0, 0, 40, 30);
		_startBtn.x = 250;
		_startBtn.y = 350;
		IfaceBtnWrapper.wrap(_startBtn);
		_startBtn.addEventListener(MouseEvent.CLICK, onStartBtnClick);
	}
	private function showStartBtn():void {
		_container.addChild(_startBtn);
	}
	private function hideStartBtn():void {
		if (_container.contains(_startBtn)) { _container.removeChild(_startBtn); }
	}

	private function createGallowsAndShow():void {
		_gallows = new Gallows();
		_container.addChild(_gallows);
	}

	private function createGameWordPanel():void {
		_gameWordController = new GameWordController();
		_gameWordController.view.x = 10;
		_gameWordController.view.y = 50;
	}
	private function showGameWordPanel():void {
		_container.addChild(_gameWordController.view);
	}
	private function hideGameWordPanel():void {
		if (_container.contains(_gameWordController.view)) {
			_container.removeChild(_gameWordController.view);
		}
	}

}
}
