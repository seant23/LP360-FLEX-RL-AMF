////////////////////////////////////////////////////////////////////////////////
//
//  Exit12 
//  Copyright © 2010 Exit12.org.
//  All Rights Reserved.
//
//  NOTICE: Exit12 does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package org.exit12.util {
	import flash.display.DisplayObject;

	import mx.collections.ArrayCollection;
	import mx.containers.TitleWindow;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.core.IFlexDisplayObject;
	import mx.effects.Fade;
	import mx.effects.Move;
	import mx.effects.Parallel;
	import mx.effects.easing.Exponential;
	import mx.events.EffectEvent;
	import mx.managers.PopUpManager;

	public class Slick {

		public static var openPopups:ArrayCollection = new ArrayCollection();
		public static var disabled:Boolean = false;

		public static function newPopup():void {
			//if ( Shell.manager ) {
			//	Shell.manager.hideIFrames();
			//}
		}

		public static function add( window:*, modal:Boolean = true ):IFlexDisplayObject {
			if ( disabled ) {
				return null;
			}

			newPopup();
			PopUpManager.addPopUp( window, FlexGlobals.topLevelApplication as DisplayObject, modal );

			window.x = ( FlexGlobals.topLevelApplication.width - window.width ) / 2;
			window.y = -500;

			var move:Move = new Move();
			move.easingFunction = Exponential.easeOut;
			move.duration = 300;
			move.yTo = ( FlexGlobals.topLevelApplication.height - window.height ) / 2;

			var fade:Fade = new Fade();
			fade.easingFunction = Exponential.easeIn;
			fade.alphaFrom = .5;
			fade.alphaTo = 1;
			fade.duration = 300;

			var msgEffect:Parallel = new Parallel();
			msgEffect.target = window;
			msgEffect.addChild( move );
			msgEffect.addChild( fade );
			msgEffect.play();

			openPopups.addItem( window );
			return window;
		}

		public static function open( Window:Class, modal:Boolean = true ):DisplayObject {
			if ( disabled ) {
				return null;
			}

			newPopup();
			var window:DisplayObject = Window( PopUpManager.createPopUp( FlexGlobals.topLevelApplication as DisplayObject, Window, modal ) );

			window.x = ( FlexGlobals.topLevelApplication.width - window.width ) / 2;
			window.y = -500;

			var move:Move = new Move();
			move.easingFunction = Exponential.easeOut;
			move.duration = 300;
			move.yTo = ( FlexGlobals.topLevelApplication.height - window.height ) / 2;

			var fade:Fade = new Fade();
			fade.easingFunction = Exponential.easeIn;
			fade.alphaFrom = .5;
			fade.alphaTo = 1;
			fade.duration = 300;

			var msgEffect:Parallel = new Parallel();
			msgEffect.target = window;
			msgEffect.addChild( move );
			msgEffect.addChild( fade );
			msgEffect.play();

			openPopups.addItem( window );
			return window;
		}

		public static function center( window:TitleWindow, duration:uint = 300 ):void {
			var move:Move = new Move();
			move.easingFunction = Exponential.easeOut;
			move.duration = duration;
			move.target = window;
			move.xTo = ( FlexGlobals.topLevelApplication.width - window.width ) / 2;
			move.yTo = ( FlexGlobals.topLevelApplication.height - window.height ) / 2;
			move.play();
		}

		public static function close( window:* ):void {
			if ( disabled ) {
				return;
			}

			var move:Move = new Move();
			move.easingFunction = Exponential.easeIn;
			move.duration = 300;
			move.yTo = -500;

			var fade:Fade = new Fade();
			fade.easingFunction = Exponential.easeIn;
			fade.alphaFrom = 0.5;
			fade.alphaTo = 0;
			fade.duration = 300;

			var msgEffect:Parallel = new Parallel();
			msgEffect.target = window;
			msgEffect.addChild( move );
			msgEffect.addChild( fade );
			msgEffect.addEventListener( EffectEvent.EFFECT_END, function():void {
					if ( openPopups.getItemIndex( window ) != -1 ) {
						openPopups.removeItemAt( openPopups.getItemIndex( window ) );
						PopUpManager.removePopUp( window );
					}

				//if ( openPopups.length == 0 && Shell.manager ) {
				//	Shell.manager.showIFrames();
				//}
				} );
			msgEffect.play();
		}

		public static function closeAll():void {
			if ( disabled ) {
				return;
			}

			for ( var i:uint = 0; i < openPopups.length; i++ ) {
				Slick.close( openPopups[ i ] );
			}
		}

		public static function doNothing():void {

		}
	}
}
