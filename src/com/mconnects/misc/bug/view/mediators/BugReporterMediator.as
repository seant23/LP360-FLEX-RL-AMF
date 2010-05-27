////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.misc.bug.view.mediators {
	import com.mconnects.misc.bug.BugReporterModule;
	import com.mconnects.misc.bug.service.events.JIRAServiceProjectEvent;
	import com.mconnects.misc.bug.service.events.JIRAServiceProjectIssueEvent;

	import mx.events.FlexEvent;

	import org.exit12.view.components.Prompt;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

	public class BugReporterMediator extends ModuleMediator {

		[Inject]
		public var view:BugReporterModule;

		override public function onRegister():void {
			addViewListener( JIRAServiceProjectIssueEvent.CREATE, dispatch );
			addContextListener( JIRAServiceProjectEvent.LOAD_SUCCESS, projectLoadHandler );

			dispatch( new JIRAServiceProjectEvent( JIRAServiceProjectEvent.LOAD, null, view.JIRAProjectKey ));
		}

		public function projectLoadHandler( e:JIRAServiceProjectEvent ):void {
			view.project = e.project;
			view.ready = true;
		}
	}
}