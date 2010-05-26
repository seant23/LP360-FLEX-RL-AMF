////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.misc.bug {
	import com.mconnects.misc.bug.controllers.CreateNewBugReport;
	import com.mconnects.misc.bug.events.BugEvent;
	import com.mconnects.misc.bug.service.BugService;
	import com.mconnects.misc.bug.view.mediators.BugReporterMediator;

	import flash.display.DisplayObjectContainer;
	import flash.system.ApplicationDomain;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	public class BugReporterContext extends ModuleContext {
		public function BugReporterContext( contextView:DisplayObjectContainer = null, autoStartup:Boolean = true, parentInjector:IInjector = null, applicationDomain:ApplicationDomain = null ) {
			super( contextView, autoStartup, parentInjector, applicationDomain );
		}

		override public function startup():void {
			/**
			 * Mediator Map
			 */
			mediatorMap.mapView( BugReporterModule, BugReporterMediator );

			/**
			 * Command Map
			 */
			commandMap.mapEvent( BugEvent.CREATE, CreateNewBugReport );

			/**
			 * Injectors
			 */
			injector.mapSingleton( BugService );

			// and we're done
			super.startup();
			dispatchEvent( new ContextEvent( ContextEvent.STARTUP ));
		}
	}
}