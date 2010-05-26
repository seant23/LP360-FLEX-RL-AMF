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
	import com.mconnects.misc.bug.events.BugEvent;
	import com.mconnects.misc.bug.service.BugService;

	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;

	public class CreateNewBugReport extends ModuleCommand {

		[Inject]
		public var event:BugEvent;

		[Inject]
		public var service:BugService;

		public function CreateNewBugReport() {
			service.create( event.bug );
		}
	}
}