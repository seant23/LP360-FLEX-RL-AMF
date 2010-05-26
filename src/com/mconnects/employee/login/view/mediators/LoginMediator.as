////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.employee.login.view.mediators {
	import com.mconnects.employee.login.LoginPromptModule;
	import com.mconnects.employee.login.events.LoginEvent;
	import com.mconnects.employee.login.events.LoginFaultEvent;

	import flash.events.Event;

	import org.robotlegs.mvcs.Mediator;

	public class LoginMediator extends Mediator {

		[Inject]
		public var view:LoginPromptModule;

		public function LoginMediator() {
		}

		override public function onRegister():void {
			eventMap.mapListener( view, LoginEvent.LOGIN_ATTEMPT, dispatch );
			eventMap.mapListener( eventDispatcher, LoginEvent.LOGIN_SUCCESS, loginSuccessHandler );
			eventMap.mapListener( eventDispatcher, LoginFaultEvent.LOGIN_FAULT, loginFaultHandler );
		}

		public function loginSuccessHandler( e:LoginEvent ):void {
			view.parent.removeChild( view );
		}

		public function loginFaultHandler( e:LoginFaultEvent ):void {
			view.currentState = 'loginError';
			view.loginError = e.message;
			view.enabled = true;
		}
	}
}