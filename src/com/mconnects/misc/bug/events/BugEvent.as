////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.misc.bug.events {
	import com.mconnects.error.model.vo.ErrorVO;
	import com.mconnects.misc.bug.model.vo.BugReportVO;

	import flash.events.Event;

	public class BugEvent extends Event {

		public static const CREATE:String = "BugReportCreate";
		public static const CREATE_SUCCESS:String = "BugReportSuccess";
		public static const CREATE_FAILED:String = "BugReportFailed";

		public var bug:BugReportVO;
		public var error:ErrorVO;

		public function BugEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) {
			super( type, bubbles, cancelable );
		}

		override public function clone():Event {
			var e:BugEvent = new BugEvent( type, bubbles, cancelable );
			e.bug = bug;
			e.error = error;
			return e;
		}
	}
}