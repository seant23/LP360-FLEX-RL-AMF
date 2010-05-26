////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.employee.login.service {
	import com.mconnects.employee.login.events.LoginEvent;
	import com.mconnects.employee.login.events.LoginFaultEvent;

	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	import org.robotlegs.mvcs.Actor;

	public class LoginService extends Actor {

		public var zamf:RemoteObject;

		public function LoginService() {

			zamf = new RemoteObject( 'zend' );
			zamf.source = "Employee";
			zamf.addEventListener( ResultEvent.RESULT, loginResultHandler );
		}

		public function login( username:String, password:String ):void {
			zamf.login( username, password );
		}

		private function loginResultHandler( event:ResultEvent ):void {
			if ( event.result.success ) {
				var loginEvent:LoginEvent = new LoginEvent( LoginEvent.LOGIN_SUCCESS );
				loginEvent.user = event.result.user;
				dispatch( loginEvent );
			} else {
				var loginFaultEvent:LoginFaultEvent = new LoginFaultEvent( LoginFaultEvent.LOGIN_FAULT );
				loginFaultEvent.message = event.result.error;
				dispatch( loginFaultEvent );
			}
		}
	}
}