////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.model.vo {

	[RemoteClass( alias="LP_LenderContactVO" )]
	public class LenderContactVO {
		public var lencontid:int;
		public var contact_type_id:int;
		public var lenderid:int;
		public var title:String;
		public var firstname:String;
		public var lastname:String;
		public var email:String;
		public var fphone:String;
		public var wphone:String;
		public var cphone:String;
		public var default_contact:Boolean;
		public var username:String;
		public var password:String;
		public var last_login_timestamp:String;
		public var is_locked:Boolean;
	}
}