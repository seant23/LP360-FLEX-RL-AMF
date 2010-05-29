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

	[RemoteClass( alias="LP_JIRAProjectIssueVO" )]
	public class JIRAProjectIssueVO {
		public var project:String;
		public var type:String;
		public var summary:String;
		public var description:String;
		public var priority:String;
		public var reporter:String;
		public var assignee:String;
		public var affectsVersions:Array = new Array();
		public var fixVersions:Array = new Array();
		public var customFieldValues:Array = new Array();
		public var components:Array = new Array();

		public var updated:String;
		public var status:String;
		public var resolution:String;
		public var votes:uint;
		public var environment:String;
		public var duedate:String;
		public var created:String;
		public var attachmentNames:Array;
		public var id:String;
		public var key:String;

		public function addAffectedVersion( newVersion:JIRAProjectVersionVO ):void {
			affectsVersions.push( newVersion );
		}

		public function addAffectedComponent( newComponent:JIRAProjectComponentVO ):void {
			components.push( newComponent );
		}
	}
}