////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.error.model.vo {

	[RemoteClass( alias="ErrorVO" )]
	[Bindable]
	public class ErrorVO {

		public var message:String;
		public var code:uint;

		public function ErrorVO( message:String = "Unknown Error has Occurred", code:uint = 900 ) {
			this.message = message;
			this.code = code;
		}
	}
}