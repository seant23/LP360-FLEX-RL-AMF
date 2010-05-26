////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.main.view.mediators {

	import com.mconnects.lender.ae.login.events.AELoginEvent;

	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

	public class LenderAEMediator extends ModuleMediator {

		[Inject]
		public var view:LoanPro360_AE;

		public function LenderAEMediator() {
		}

		override public function onRegister():void {
			addViewListener( AELoginEvent.LOGOUT, dispatch );

			// Login
			addModuleListener( AELoginEvent.LOGIN_SUCCESS, loggedInHandler );

			//Logout
			addModuleListener( AELoginEvent.LOGOUT, logoutHandler );
			addModuleListener( AELoginEvent.NOT_LOGGED_IN, logoutHandler );
		}

		public function loggedInHandler( e:AELoginEvent ):void {
			view.fadeIn();
		}

		public function logoutHandler( e:AELoginEvent ):void {
			view.fadeOut();
		}
	}
}