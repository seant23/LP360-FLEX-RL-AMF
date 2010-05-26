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

	public class LoginFaultEvent extends Event {

		public static const LOGIN_FAULT:String = "LoginFaultEventLoginFault";

		public var message:String;

		public function LoginFaultEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) {
			super( type, bubbles, cancelable );
		}
	}
}