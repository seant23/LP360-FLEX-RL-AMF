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
	[RemoteClass( alias="JIRAProjectPriorityVO" )]
	public class JIRAProjectPriorityVO {
		public var id:String;
		public var name:String;
		public var description:String;
		public var icon:String;
		public var color:String;
	}
}