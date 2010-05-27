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
	public class JIRAProjectIssueVO {
		public var project:String;
		public var type:String;
		public var summary:String;
		public var description:String;
		public var priority:String;
		public var reporter:String;
		public var assignee:String;
		public var affectedVersion:Array = new Array();
		public var customFieldValues:Array = new Array();
		public var components:Array = new Array();

		public function addAffectedVersion( newVersion:JIRAProjectVersionVO ):void {
			affectedVersion.push( newVersion );
		}

		public function addAffectedComponent( newComponent:JIRAProjectComponentVO ):void {
			components.push( newComponent );
		}
	}
}