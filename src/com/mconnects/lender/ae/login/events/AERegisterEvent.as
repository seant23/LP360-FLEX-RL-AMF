////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.login.events {
	import flash.events.Event;

	public class AERegisterEvent extends Event {
		public static const SUCCESS:String = "AERegisterSuccess";
		public static const FAULT:String = "AERegisterFault";
		public static const ATTEMPT:String = "AERegisterAttempt";

		public var errorMessage:String;
		public var errorCode:int;

		public var email:String;

		public function AERegisterEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) {
			super( type, bubbles, cancelable );
		}

		override public function clone():Event {
			var e:AERegisterEvent = new AERegisterEvent( type, false, false );
			e.errorMessage = errorMessage;
			e.errorCode = errorCode;
			e.email = email;
			return e;
		}
	}
}