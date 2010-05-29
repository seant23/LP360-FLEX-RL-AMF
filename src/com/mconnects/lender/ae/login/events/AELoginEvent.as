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
	import com.mconnects.lender.model.vo.LenderVO;

	import flash.events.Event;

	public class AELoginEvent extends Event {
		public static const LOGIN_ATTEMPT:String = "AELoginPromptLoginAttempt";
		public static const LOGIN_SUCCESS:String = "AELoginPromptLoginSuccess";
		public static const NOT_LOGGED_IN:String = "AELoginPromptNotLoggedIn";
		public static const LOGOUT:String = "AELoginPromptLogout";

		public var lenderContact:LenderContactVO;
		public var lender:LenderVO;

		public var error:ErrorVO;

		public function AELoginEvent( type:String, lenderContact:LenderContactVO = null ) {
			super( type, false, false );
			this.lenderContact = lenderContact;
		}

		override public function clone():Event {
			return new AELoginEvent( type, lenderContact );
		}
	}
}