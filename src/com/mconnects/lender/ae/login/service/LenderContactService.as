////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.login.service {

	import com.mconnects.error.model.vo.ErrorVO;
	import com.mconnects.lender.ae.login.events.AELoginEvent;
	import com.mconnects.lender.ae.login.events.AELoginFaultEvent;
	import com.mconnects.lender.ae.login.events.AERegisterEvent;
	import com.mconnects.lender.ae.model.vo.LenderContactVO;
	import com.mconnects.main.rpc.remoting.ZAMFRemoteObject;
	import com.mconnects.main.rpc.remoting.model.vo.AMFResponseVO;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	import org.exit12.view.components.Prompt;
	import org.robotlegs.mvcs.Actor;

	public class LenderContactService extends ZAMFRemoteObject {

		public function LenderContactService():void {
			source = "Lender_Contact";
		}

		/**
		 * 		 ** LOGIN **
		 */

		public function login( lenderContact:LenderContactVO ):void {
			createRemoteObject( loginResultHandler, loginResultFaultHandler ).login( lenderContact );
		}

		private function loginResultHandler( event:ResultEvent ):void {

			if ( event.result is LenderContactVO ) { //Success
				var loginEvent:AELoginEvent = new AELoginEvent( AELoginEvent.LOGIN_SUCCESS );
				loginEvent.lenderContact = LenderContactVO( event.result );
				dispatchToModules( loginEvent );
			} else { //Failure

				var loginFaultEvent:AELoginFaultEvent = new AELoginFaultEvent( AELoginFaultEvent.LOGIN_FAULT );

				if ( event.result is ErrorVO ) // Known Reason For Failure
					loginFaultEvent.error = ErrorVO( event.result );
				else // Unknown Reason For Failure
					loginFaultEvent.error = new ErrorVO();

				dispatch( loginFaultEvent );

			}
		}

		private function loginResultFaultHandler( event:FaultEvent ):void {
			var loginFaultEvent:AELoginFaultEvent = new AELoginFaultEvent( AELoginFaultEvent.LOGIN_FAULT );
			loginFaultEvent.error = new ErrorVO();
			dispatch( loginFaultEvent );
		}


		/**
		 * 		 ** REGISTER **
		 */

		public function register( lenderContact:LenderContactVO ):void {
			createRemoteObject( registerResultHandler, registerResultFaultHandler ).register( lenderContact );
		}

		private function registerResultHandler( event:ResultEvent ):void {
			if ( event.result is AMFResponseVO && event.result.success ) { //Success
				var registerEvent:AERegisterEvent = new AERegisterEvent( AERegisterEvent.SUCCESS );
				dispatch( registerEvent );
			} else { //Failure
				var registerFaultEvent:AERegisterEvent = new AERegisterEvent( AERegisterEvent.FAULT );

				if ( event.result is ErrorVO ) // Known Reason For Failure
					registerFaultEvent.error = ErrorVO( event.result );
				else // Unknown Reason For Failure
					registerFaultEvent.error = new ErrorVO();

				dispatch( registerFaultEvent );
			}
		}

		private function registerResultFaultHandler( event:FaultEvent ):void {
			var registerFaultEvent:AERegisterEvent = new AERegisterEvent( AERegisterEvent.FAULT );
			registerFaultEvent.error = new ErrorVO();
			dispatch( registerFaultEvent );
		}


		/**
		 * 		 ** GET SESSION DETAILS **
		 */

		public function getSessionDetails():void {
			createRemoteObject( getSessionDetailsResultHandler, getSessionDetailsFaultHandler ).getSessionDetails();
		}

		private function getSessionDetailsResultHandler( e:ResultEvent ):void {
			if ( e.result is LenderContactVO ) { //Success
				//TODO Load the AE Data, and bootup
			} else { //Failure
				var failureEvent:AELoginEvent = new AELoginEvent( AELoginEvent.NOT_LOGGED_IN );

				if ( e.result is ErrorVO )
					failureEvent.error = ErrorVO( e.result );
				else
					failureEvent.error = new ErrorVO();

				dispatchToModules( failureEvent );
			}
		}

		private function getSessionDetailsFaultHandler( event:FaultEvent ):void {
			//TODO Figure out how to handle this.
		}
	}
}