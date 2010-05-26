////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.employee.login {
	import com.mconnects.employee.login.controllers.LoginCommand;
	import com.mconnects.employee.login.events.LoginEvent;
	import com.mconnects.employee.login.service.LoginService;
	import com.mconnects.employee.login.view.mediators.LoginMediator;

	import flash.display.DisplayObjectContainer;

	import org.robotlegs.mvcs.Context;

	public class LoginPromptContext extends Context {
		public function LoginPromptContext( contextView:DisplayObjectContainer = null, autoStartup:Boolean = true ) {
			super( contextView, autoStartup );
		}

		override public function startup():void {
			mediatorMap.mapView( LoginPromptModule, LoginMediator );
			commandMap.mapEvent( LoginEvent.LOGIN_ATTEMPT, LoginCommand );
			injector.mapSingleton( LoginService );
		}
	}
}