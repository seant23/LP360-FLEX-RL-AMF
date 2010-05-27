////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.misc.bug.controllers {
	import com.mconnects.misc.bug.service.JIRAService;
	import com.mconnects.misc.bug.service.events.JIRAServiceProjectEvent;

	import org.robotlegs.mvcs.Command;

	public class LoadJIRAProject extends Command {
		[Inject]
		public var event:JIRAServiceProjectEvent;

		[Inject]
		public var service:JIRAService;

		override public function execute():void {
			service.loadProject( event.projectKey );
		}
	}
}