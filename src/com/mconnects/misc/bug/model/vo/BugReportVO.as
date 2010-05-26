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

	[RemoteClass( alias="BugReportVO" )]
	public class BugReportVO {
		public var project:String;
		public var type:uint;
		public var summary:String;
		public var description:String;
		public var priority:uint;
		public var reporter:String;
		public var assignee:String;
		public var affectedVersion:Array;
		public var customFieldValues:Array;
		public var components:Array;
	}
}