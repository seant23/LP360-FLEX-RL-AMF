////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.login.view.mediators {

	import com.mconnects.lender.ae.login.AELoginPromptModule;
	import com.mconnects.lender.ae.login.events.AELoginEvent;
	import com.mconnects.lender.ae.login.events.AELoginFaultEvent;
	import com.mconnects.lender.ae.login.events.AERegisterEvent;

	import flash.events.Event;

	import org.exit12.view.components.Prompt;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

	public class AELoginMediator extends ModuleMediator {

		[Inject]
		public var view:AELoginPromptModule;

		public function AELoginMediator() {

		}

		override public function onRegister():void {
			addViewListener( AELoginEvent.LOGIN_ATTEMPT, dispatch );
			addViewListener( AERegisterEvent.ATTEMPT, dispatch );
			//TODO forgotPassword

			addContextListener( AERegisterEvent.SUCCESS, registerSuccessHandler );
			addContextListener( AERegisterEvent.FAULT, registerFaultHandler );

			addModuleListener( AELoginEvent.LOGIN_SUCCESS, loginSuccessHandler );
			addContextListener( AELoginFaultEvent.LOGIN_FAULT, loginFaultHandler );
		}

		public function registerSuccessHandler( e:AERegisterEvent ):void {
			Prompt.info( "Registration Email Sent! Please check your inbox.", function():void {
					view.currentState = null;
					view.enabled = true;
				});
		}

		public function registerFaultHandler( e:AERegisterEvent ):void {
			view.currentState = 'registerError';
			view.loginError = e.error.message;
			view.enabled = true;
		}

		//TODO forgotPasswordSuccessHandler
		//TODO forgotPasswordFaultHandler

		public function loginSuccessHandler( e:AELoginEvent ):void {
			view.slickClose();
		}

		public function loginFaultHandler( e:AELoginFaultEvent ):void {
			if ( e.error.code == 202 ) {
				view.currentState = 'register'
			} else {
				view.currentState = 'loginError';
				view.loginError = e.error.message;
			}

			view.enabled = true;
		}
	}
}