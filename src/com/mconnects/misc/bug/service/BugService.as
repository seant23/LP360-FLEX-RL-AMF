////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.misc.bug.service {
	import com.mconnects.error.model.vo.ErrorVO;
	import com.mconnects.main.rpc.remoting.ZAMFRemoteObject;
	import com.mconnects.misc.bug.events.BugEvent;
	import com.mconnects.misc.bug.model.vo.BugReportVO;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class BugService extends ZAMFRemoteObject {
		public function BugService() {
			zamf.source = "Lender_AE";
		}


		public function create( bug:BugReportVO ):void {
			zamf.addEventListener( ResultEvent.RESULT, createResultHandler );
			zamf.addEventListener( FaultEvent.FAULT, createFaultHandler );
		}

		private function createFaultHandler( event:FaultEvent ):void {
			zamf.removeEventListener( ResultEvent.RESULT, createResultHandler );
			zamf.removeEventListener( FaultEvent.FAULT, createFaultHandler );

			var faultEvent:BugEvent = new BugEvent( BugEvent.CREATE_FAILED );
			faultEvent.error = new ErrorVO( "Unknown Error has Occurred", 900 );
			dispatch( faultEvent );
		}

		private function createResultHandler( event:ResultEvent ):void {
			zamf.removeEventListener( ResultEvent.RESULT, createResultHandler );
			zamf.removeEventListener( FaultEvent.FAULT, createFaultHandler );

			if ( event.result.success ) {
				var successEvent:BugEvent = new BugEvent( BugEvent.CREATE_SUCCESS );
				dispatchToModules( successEvent );
			} else {
				var failEvent:BugEvent = new BugEvent( BugEvent.CREATE_FAILED );
				failEvent.error = event.result.error;
				dispatch( failEvent );
			}
		}

	}
}