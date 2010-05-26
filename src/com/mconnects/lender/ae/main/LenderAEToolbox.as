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

	import org.exit12.module.ModuleInstance;
	import org.exit12.module.ModuleManager;
	import org.exit12.module.TitleWindowModule;
	import org.exit12.util.Slick;
	import org.exit12.view.components.ButtonPrompt;

	public class LenderAEToolbox {

		public static function openLoginPrompt():ModuleInstance {
			var instance:ModuleInstance = ModuleManager.loadModule( "com/mconnects/lender/ae/login/AELoginPromptModule.swf" );

			instance.addEventListener( ModuleManager.READY, function():void {
					var viewer:TitleWindowModule = instance.module as TitleWindowModule;
					Slick.add( viewer );
				});

			return instance;
		}

		public static function openLogoutPrompt():ButtonPrompt {
			var dialogMessage:String = 'Are you sure you want to logout?';
			var dialogTitle:String = 'Logout';

			var dialog:ButtonPrompt = ButtonPrompt.newInstance( dialogTitle, dialogMessage );

			dialog.addOption( 'Yes, Log Me Out!', function():void {
				/*
				   logout();
				 */
				}, 'Symbol-Check' );

			dialog.addOption( 'No, Stay Logged In.', function():void {

				}, 'Symbol-Delete' );

			return dialog;
		}
	}
}