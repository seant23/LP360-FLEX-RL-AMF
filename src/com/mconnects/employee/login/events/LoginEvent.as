////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.employee.login.events {
	import flash.events.Event;

	public class LoginEvent extends Event {
		public static const LOGIN_ATTEMPT:String = "LoginPromptLoginAttempt";
		public static const LOGIN_SUCCESS:String = "LoginPromptLoginSuccess";

		public var username:String;
		public var password:String;
		public var user:Object;

		public function LoginEvent( type:String, username:String = null, password:String = null ) {
			this.username = username;
			this.password = password;

			super( type, false, false );
		}

		override public function clone():Event {
			return new LoginEvent( type, username, password );
		}
	}
}