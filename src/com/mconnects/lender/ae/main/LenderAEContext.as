////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.main {
	import com.mconnects.lender.ae.login.AELoginPromptModule;
	import com.mconnects.lender.ae.login.events.AELoginEvent;
	import com.mconnects.lender.ae.main.controllers.OpenLoginPromptCommand;
	import com.mconnects.lender.ae.main.controllers.StartAppCommand;
	import com.mconnects.lender.ae.main.service.AEService;
	import com.mconnects.lender.ae.main.view.mediators.LenderAEMediator;

	import flash.display.DisplayObjectContainer;
	import flash.utils.setTimeout;

	import mx.containers.HBox;
	import mx.core.Application;

	import org.exit12.module.ModuleInstance;
	import org.exit12.module.ModuleManager;
	import org.exit12.module.TitleWindowModule;
	import org.exit12.util.Slick;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.utilities.modular.core.IModule;
	import org.robotlegs.utilities.modular.core.IModuleContext;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	public class LenderAEContext extends ModuleContext implements IModuleContext {
		public function LenderAEContext( contextView:DisplayObjectContainer = null, autoStartup:Boolean = true ) {
			super( contextView );
		}

		override public function startup():void {
			//Mediators
			mediatorMap.mapView( LoanPro360_AE, LenderAEMediator );

			//Local Commands
			commandMap.mapEvent( ContextEvent.STARTUP, StartAppCommand, ContextEvent, true );

			//Global Commands
			moduleCommandMap.mapEvent( AELoginEvent.NOT_LOGGED_IN, OpenLoginPromptCommand );

			//Singletons
			injector.mapSingleton( AEService );

			//!!! Very Important !!! Don't Delete !!!
			ModuleManager.injector = injector;

			// And We're Done
			super.startup();
			dispatchEvent( new ContextEvent( ContextEvent.STARTUP ));
		}
	}
}