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
	import com.mconnects.lender.ae.model.vo.LenderContactVO;

	import flash.events.Event;

	public class AERegisterEvent extends Event {
		public static const SUCCESS:String = "AERegisterSuccess";
		public static const FAULT:String = "AERegisterFault";
		public static const ATTEMPT:String = "AERegisterAttempt";

		public var error:ErrorVO;
		public var lenderContact:LenderContactVO;

		public function AERegisterEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) {
			super( type, bubbles, cancelable );
		}

		override public function clone():Event {
			var e:AERegisterEvent = new AERegisterEvent( type, false, false );
			e.error = error;
			e.lenderContact = lenderContact;

			return e;
		}
	}
}