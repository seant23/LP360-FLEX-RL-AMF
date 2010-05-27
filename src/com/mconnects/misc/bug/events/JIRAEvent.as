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
	import flash.events.Event;

	public class JIRAEvent extends Event {

		public static const LOAD_SETTINGS:String = "JIRALoadSettings";
		public static const LOAD_SUCCESS:String = "JIRALoadSuccess";
		public static const LOAD_FAILURE:String = "JIRALoadFailure";



		public function JIRAEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) {
			super( type, bubbles, cancelable );
		}

		override public function clone():Event {
			var e:Event = new JIRAEvent( type, bubbles, cancelable );

		}
	}
}