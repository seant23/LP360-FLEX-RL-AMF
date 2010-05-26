////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.employee.login.controllers {
	import com.mconnects.employee.login.events.LoginEvent;
	import com.mconnects.employee.login.service.LoginService;

	import org.robotlegs.mvcs.Command;

	public class LoginCommand extends Command {

		[Inject]
		public var event:LoginEvent;

		[Inject]
		public var service:LoginService;

		override public function execute():void {
			service.login( event.username, event.password );
		}
	}
}