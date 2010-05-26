////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.main.controllers {
	import com.mconnects.lender.ae.main.service.AEService;

	import org.robotlegs.mvcs.Command;

	public class StartAppCommand extends Command {

		[Inject]
		public var service:AEService;

		override public function execute():void {
			service.loadAE();
		}
	}
}