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
	import com.mconnects.lender.ae.login.events.AELoginEvent;
	import com.mconnects.lender.ae.login.service.AELoginService;
	import com.mconnects.lender.ae.main.LenderAEToolbox;

	import flash.utils.setTimeout;

	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;

	public class OpenLoginPromptCommand extends ModuleCommand {


		override public function execute():void {
			LenderAEToolbox.openLoginPrompt();
		}
	}
}