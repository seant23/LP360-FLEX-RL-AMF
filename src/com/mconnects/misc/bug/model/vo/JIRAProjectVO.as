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
	[RemoteClass( alias="JIRAProjectVO" )]
	public class JIRAProjectVO {
		public var id:String;
		public var name:String;
		public var issueSecurityScheme:String;
		public var key:String;
		public var lead:String;
		public var notificationScheme:String;
		public var permissionScheme:String;
		public var projectURL:String;
		public var URL:String;
		public var description:String;
		public var components:Array;
		public var priorities:Array;
		public var issueTypes:Array;
		public var versions:Array;
		public var currentVersion:JIRAProjectVersionVO;

		/**
		 * This function should not be called.
		 * It's used to store References to subVO's
		 *
		 * The MXML compiler must have one reference to a class,
		 * for it to actually compile that class inside the app.
		 */
		private function dependancies():void {
			JIRAProjectComponentVO;
			JIRAProjectIssueTypeVO;
			JIRAProjectPriorityVO;
		}
	}
}