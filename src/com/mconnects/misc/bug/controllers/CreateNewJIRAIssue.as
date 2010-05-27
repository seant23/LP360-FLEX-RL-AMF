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
	import com.mconnects.misc.bug.service.events.JIRAServiceProjectIssueEvent;

	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;

	public class CreateNewJIRAIssue extends ModuleCommand {

		[Inject]
		public var event:JIRAServiceProjectIssueEvent;

		[Inject]
		public var service:JIRAService;

		override public function execute():void {
			service.createIssue( event.issue );
		}
	}
}