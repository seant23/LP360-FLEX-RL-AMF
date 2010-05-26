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
	import com.mconnects.lender.ae.login.events.AERegisterEvent;
	import com.mconnects.lender.ae.login.service.AELoginService;

	import org.robotlegs.mvcs.Command;

	public class AERegisterCommand extends Command {
		[Inject]
		public var event:AERegisterEvent;

		[Inject]
		public var service:AELoginService;

		override public function execute():void {
			service.register( event.email );
		}
	}
}