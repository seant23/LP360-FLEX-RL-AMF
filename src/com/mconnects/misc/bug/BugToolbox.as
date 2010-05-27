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

	import org.exit12.module.ModuleInstance;
	import org.exit12.module.ModuleManager;
	import org.exit12.module.TitleWindowModule;
	import org.exit12.util.Slick;

	public class BugToolbox {
		public static function openBugReporter( JIRAProjectKey:String ):ModuleInstance {
			var instance:ModuleInstance = ModuleManager.loadModule( "com/mconnects/misc/bug/BugReporterModule.swf" );

			instance.addEventListener( ModuleManager.READY, function():void {
					var module:IBugReporterModule = IBugReporterModule( instance.module );
					module.JIRAProjectKey = JIRAProjectKey;
					Slick.add( module );
				});

			return instance;
		}
	}
}