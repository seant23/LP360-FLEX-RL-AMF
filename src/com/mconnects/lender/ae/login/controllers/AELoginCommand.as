////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.login.controllers {

	import com.mconnects.lender.ae.login.events.AELoginEvent;
	import com.mconnects.lender.ae.login.service.AELoginService;

	import org.robotlegs.mvcs.Command;

	public class AELoginCommand extends Command {

		[Inject]
		public var event:AELoginEvent;

		[Inject]
		public var service:AELoginService;

		override public function execute():void {
			service.login( event.username, event.password );
		}
	}
}