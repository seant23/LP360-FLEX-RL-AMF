////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.misc.bug.model.vo {

	[Bindable]
	[RemoteClass( alias="JIRAProjectVersionVO" )]
	public class JIRAProjectVersionVO {
		public var id:String;
		public var name:String;
		public var archived:Boolean;
		public var releaseDate:String;
		public var released:Boolean;
		public var sequence:uint;
	}
}