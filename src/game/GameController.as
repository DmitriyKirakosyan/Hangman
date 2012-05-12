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

import sound.Sounds;

import sound.SoundsManager;

public class GameController {
	private var _container:Sprite;
	private var _gallows:Gallows;
	private var _startBtn:Sprite;
	private var _helpField:HelpField;
	private var _keyboard:VirtualKeyboard;
	private var _gameWordController:GameWordController;
	private var _endTextField:TextField;
	private var _statistic:GameStatistic;

	[Embed(source="../materials/images/bg.jpg")] private static const BG:Class;
	[Embed(source="../materials/images/hangman.png")] private static const HANGMAN:Class;
	[Embed(source="../materials/images/start.png")] private static const START:Class;

	private const WIN_TEXT:String = "Вы отгадали слово! \n Поздравляем!";
	private const LOSE_TEXT:String = "Вы проиграли. \n Попробуйте снова!";


	public function GameController(container:Sprite) {
		super();
		_container = container;
		createObjects();
	}

	/* Internal functions */

	private function startGame():void {
		hideStartBtn();
		hideEndTextField();
		_gallows.setLevel(0);
		showKeyboard();
		_gameWordController.newWord();
		showGameWordPanel();
		SoundsManager.stopAllSounds();
	}

	private function endGame(win:Boolean):void {
		hideKeyboard();
		//hideGameWordPanel();
		showStartBtn();
		showEndTextField(win ? WIN_TEXT : LOSE_TEXT);
		win ? _statistic.winsPlus() : _statistic.losesPlus();
		SoundsManager.playSoundByName(win ? Sounds.WIN : Sounds.LOSE);
	}

	private function onStartBtnClick(event:MouseEvent):void {
		if (_container.contains(_helpField)) {
			_container.removeChild(_helpField);
		}
		if (!_container.contains(_statistic.view)) {
			_container.addChild(_statistic.view);
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
		createEndTextField();
		createStatistic();
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
		_startBtn.addChild(new START());
		_startBtn.x = 100;
		_startBtn.y = 310;
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
		_gameWordController.view.x = 8;
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

	private function createEndTextField():void {
		_endTextField = new TextField();
		_endTextField.defaultTextFormat = new TextFormat( "Arial", 24,
															0xffffff, true, null, null, "", "", TextFormatAlign.CENTER, 0, 0, 0, 0);
		_endTextField.selectable = false;
		_endTextField.autoSize = TextFieldAutoSize.LEFT;
		_endTextField.x = 35;
		_endTextField.y = 200;
	}
	private function showEndTextField(text:String):void {
		_endTextField.text = text;
		_container.addChild(_endTextField);
	}
	private function hideEndTextField():void {
		if (_container.contains(_endTextField)) {
			_container.removeChild(_endTextField);
		}
	}

	private function createStatistic():void {
		_statistic = new GameStatistic();
		_statistic.view.x = Main.WIDTH/2 - _statistic.view.width/2;
		_statistic.view.y = Main.HEIGHT - _statistic.view.height;
	}

}
}
