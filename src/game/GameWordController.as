/**
 * Created by : Dmitry
 * Date: 5/12/12
 * Time: 8:53 PM
 */
package game {
import flash.display.Sprite;

public class GameWordController {
	private var _view:Sprite;
	private var _currentWord:String;
	private var _blocks:Vector.<GameLetterBlock>;

	private const words:Array = Main.GAME_WORDS;
	private var _orderedWords:Vector.<String>;

	public function GameWordController() {
		super();
		_view = new Sprite();
		shuffleWords();
	}

	/* API */

	public function get view():Sprite {
		return _view;
	}

	public function newWord():void {
		if (_orderedWords.length == 0) { shuffleWords(); }
		_currentWord = _orderedWords.shift();
		removeBlocks();
		createBlocks();
	}

	public function containsLetter(letter:String):Boolean {
		return _currentWord.indexOf(letter) != -1;
	}

	public function showLetter(letter:String):void {
		for each (var block:GameLetterBlock in _blocks) {
			if (block.letter == letter) { block.openLetter(); }
		}
	}

	public function allLettersShowed():Boolean {
		for each (var block:GameLetterBlock in _blocks) {
			if (!block.open) { return false; }
		}
		return true;
	}

	/* Internal functions */

	private function createBlocks():void {
		_blocks = new Vector.<GameLetterBlock>();
		var block:GameLetterBlock;
		for (var i:int = 0; i < _currentWord.length; ++i) {
			block = new GameLetterBlock(_currentWord.charAt(i));
			_blocks.push(block);
			block.x = i * (block.width + 5);
			_view.addChild(block);
		}
	}

	private function removeBlocks():void {
		for each (var block:GameLetterBlock in _blocks) {
			if (_view.contains(block)) { _view.removeChild(block); }
		}
	}

	private function shuffleWords():void {
		_orderedWords = new Vector.<String>();
		for each (var word:String in words) {
			_orderedWords.push(word);
		}
		_orderedWords.sort(
						function (a:Object, b:Object):int {
 							return Math.random() > 0.5 ? 1: -1;
						});

		trace("[GameWordController.suffleWords]");
		for each (var word:String in _orderedWords) {
			trace("word : " + word);
		}
	}

function randomSort(a:Object, b:Object):int {
 return Math.random() > 0.5 ? 1: -1;
}
}
}
