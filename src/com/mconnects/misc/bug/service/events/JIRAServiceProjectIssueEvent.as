////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.misc.bug.service.events {
	import com.mconnects.error.model.vo.ErrorVO;
	import com.mconnects.misc.bug.model.vo.JIRAProjectIssueVO;

	import flash.events.Event;

	public class JIRAServiceProjectIssueEvent extends Event {
		public static const CREATE:String = "JIRAServiceCreateProjectIssue";
		public static const CREATE_SUCCESS:String = "JIRAServiceCreateProjectIssueSuccess";
		public static const CREATE_FAULT:String = "JIRAServiceCreateProjectIssueFault";

		public static const DELETE:String = "JIRAServiceDeleteProjectIssue";
		public static const DELETE_SUCCESS:String = "JIRAServiceDeleteProjectIssueSuccess";
		public static const DELETE_FAULT:String = "JIRAServiceDeleteProjectIssueFault";

		public var error:ErrorVO;

		public var issue:JIRAProjectIssueVO;

		public function JIRAServiceProjectIssueEvent( type:String, issue:JIRAProjectIssueVO = null ) {
			this.issue = issue;
			super( type );
		}

		override public function clone():Event {
			var e:JIRAServiceProjectIssueEvent = new JIRAServiceProjectIssueEvent( type, issue );
			e.error = error;

			return e;
		}

	}
}