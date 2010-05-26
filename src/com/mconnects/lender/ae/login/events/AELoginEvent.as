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
	import com.mconnects.lender.model.vo.LenderVO;

	import flash.events.Event;

	public class AELoginEvent extends Event {
		public static const LOGIN_ATTEMPT:String = "AELoginPromptLoginAttempt";
		public static const LOGIN_SUCCESS:String = "AELoginPromptLoginSuccess";
		public static const NOT_LOGGED_IN:String = "AELoginPromptNotLoggedIn";
		public static const LOGOUT:String = "AELoginPromptLogout";

		public var username:String;
		public var password:String;
		public var ae:Object;
		public var lender:LenderVO;

		public function AELoginEvent( type:String, username:String = null, password:String = null ) {
			this.username = username;
			this.password = password;

			super( type, false, false );
		}

		override public function clone():Event {
			return new AELoginEvent( type, username, password );
		}
	}
}