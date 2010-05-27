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
	import org.exit12.module.ITitleWindowModule;

	public interface IBugReporterModule extends ITitleWindowModule {
		function set JIRAProjectKey( JIRAProjectKey:String ):void;
		function get JIRAProjectKey():String;
	}
}