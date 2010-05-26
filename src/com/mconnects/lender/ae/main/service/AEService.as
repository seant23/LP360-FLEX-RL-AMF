////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.main.service {
	import com.mconnects.lender.ae.login.events.AELoginEvent;
	import com.mconnects.main.rpc.remoting.ZAMFRemoteObject;

	import mx.rpc.events.ResultEvent;

	public class AEService extends ZAMFRemoteObject {
		public function AEService() {
			zamf.source = "Lender_AE";
		}

		public function loadAE():void {
			eventMap.unmapListeners()
			zamf.addEventListener( ResultEvent.RESULT, loadAEHandler );
			zamf.getSessionDetails();
		}

		private function loadAEHandler( e:ResultEvent ):void {
			zamf.removeEventListener( ResultEvent.RESULT, loadAEHandler );

			if ( e.result.isLoggedIn ) {

			} else {

				dispatchToModules( new AELoginEvent( AELoginEvent.NOT_LOGGED_IN ))
			}
		}
	}
}