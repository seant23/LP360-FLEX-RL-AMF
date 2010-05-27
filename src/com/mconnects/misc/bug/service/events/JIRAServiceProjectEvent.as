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
	import com.mconnects.misc.bug.model.vo.JIRAProjectVO;

	import flash.events.Event;

	public class JIRAServiceProjectEvent extends Event {
		public static const LOAD:String = "JIRAServiceLoadProject";
		public static const LOAD_SUCCESS:String = "JIRAServiceLoadProjectSuccess";
		public static const LOAD_FAULT:String = "JIRAServiceLoadProjectFault";

		public var error:ErrorVO;

		public var projectKey:String;
		private var _project:JIRAProjectVO;

		public function JIRAServiceProjectEvent( type:String, project:JIRAProjectVO = null, projectKey:String = null ) {
			this.projectKey = projectKey
			this.project = project;
			super( type );
		}

		public function set project( proj:JIRAProjectVO ):void {
			if ( proj ) {
				_project = proj;
				projectKey = proj.key;
			}
		}

		public function get project():JIRAProjectVO {
			return _project;
		}

		override public function clone():Event {
			var e:JIRAServiceProjectEvent = new JIRAServiceProjectEvent( type, project, projectKey );
			e.error = error;

			return e;
		}

	}
}