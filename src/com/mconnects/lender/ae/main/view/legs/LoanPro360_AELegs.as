////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.main.view.legs {
	import com.mconnects.lender.ae.main.LenderAEToolbox;
	import com.mconnects.misc.bug.BugToolbox;

	import flash.display.BlendMode;

	import mx.controls.Alert;
	import mx.core.Application;
	import mx.effects.AnimateProperty;
	import mx.events.EffectEvent;

	import org.exit12.view.components.Prompt;
	import org.robotlegs.core.IInjector;


	public class LoanPro360_AELegs extends Application {

		public var inj:IInjector;
		public var fader:AnimateProperty;

		public function fadeIn():void {
			fader.fromValue = 0;
			fader.toValue = 1;
			fader.play();

			fader.addEventListener( EffectEvent.EFFECT_END, function( e:EffectEvent ):void {
					blendMode = BlendMode.NORMAL;
				});
		}

		public function fadeOut():void {
			blendMode = BlendMode.LAYER;
			fader.fromValue = 1;
			fader.toValue = 0;
			fader.play();
		}

		public function reportBug():void {
			BugToolbox.openBugReporter( "LOANPROAE" );
		}

		public function logout():void {
			Alert.show( "test", "test" );
			Prompt.info( "test" );
			LenderAEToolbox.openLogoutPrompt();
		}
	}
}