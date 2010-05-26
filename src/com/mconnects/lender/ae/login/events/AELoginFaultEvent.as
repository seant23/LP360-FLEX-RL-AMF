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
	import com.mconnects.error.model.vo.ErrorVO;

	import flash.events.Event;

	public class AELoginFaultEvent extends Event {

		public static const LOGIN_FAULT:String = "AELoginFaultEventLoginFault";

		public var error:ErrorVO;

		public function AELoginFaultEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) {
			super( type, bubbles, cancelable );
		}

		override public function clone():Event {
			var e:AELoginFaultEvent = new AELoginFaultEvent( type, bubbles, cancelable );
			e.error = error;

			return e;
		}
	}
}