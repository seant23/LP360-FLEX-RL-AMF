////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.login {

	import com.mconnects.lender.ae.login.controllers.AELoginCommand;
	import com.mconnects.lender.ae.login.controllers.AERegisterCommand;
	import com.mconnects.lender.ae.login.events.AELoginEvent;
	import com.mconnects.lender.ae.login.events.AERegisterEvent;
	import com.mconnects.lender.ae.login.service.LenderContactService;
	import com.mconnects.lender.ae.login.view.mediators.AELoginMediator;

	import flash.display.DisplayObjectContainer;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	public class AELoginPromptContext extends ModuleContext {

		public function AELoginPromptContext( contextView:DisplayObjectContainer, injector:IInjector ) {
			super( contextView, true, injector );
		}

		override public function startup():void {
			/**
			 * Mediator Map
			 */
			mediatorMap.mapView( AELoginPromptModule, AELoginMediator );

			/**
			 * Command Map
			 */
			commandMap.mapEvent( AELoginEvent.LOGIN_ATTEMPT, AELoginCommand );
			commandMap.mapEvent( AERegisterEvent.ATTEMPT, AERegisterCommand );

			/**
			 * Injectors
			 */
			injector.mapSingleton( LenderContactService );

			// and we're done
			super.startup();
			dispatchEvent( new ContextEvent( ContextEvent.STARTUP ));
		}
	}
}