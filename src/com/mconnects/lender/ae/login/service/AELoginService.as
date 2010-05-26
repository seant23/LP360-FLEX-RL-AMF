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
	import com.mconnects.lender.ae.model.vo.LenderAEVO;
	import com.mconnects.main.rpc.remoting.ZAMFRemoteObject;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	import org.robotlegs.mvcs.Actor;

	public class AELoginService extends ZAMFRemoteObject {

		public function AELoginService() {
			zamf.source = "Lender_AE";
		}

		public function login( username:String, password:String ):void {
			zamf.addEventListener( ResultEvent.RESULT, loginResultHandler );
			zamf.addEventListener( FaultEvent.FAULT, loginResultFaultHandler );
			zamf.login( username, password );
		}

		private function loginResultFaultHandler( event:FaultEvent ):void {
			zamf.removeEventListener( ResultEvent.RESULT, loginResultHandler );
			zamf.removeEventListener( FaultEvent.FAULT, loginResultFaultHandler );

			var loginFaultEvent:AELoginFaultEvent = new AELoginFaultEvent( AELoginFaultEvent.LOGIN_FAULT );
			loginFaultEvent.error = new ErrorVO();
			dispatch( loginFaultEvent );
		}

		private function loginResultHandler( event:ResultEvent ):void {
			zamf.removeEventListener( ResultEvent.RESULT, loginResultHandler );
			zamf.removeEventListener( FaultEvent.FAULT, loginResultFaultHandler );

			if ( event.result.success ) {
				var loginEvent:AELoginEvent = new AELoginEvent( AELoginEvent.LOGIN_SUCCESS );
				loginEvent.ae = event.result.ae;
				dispatchToModules( loginEvent );
			} else {
				var loginFaultEvent:AELoginFaultEvent = new AELoginFaultEvent( AELoginFaultEvent.LOGIN_FAULT );
				loginFaultEvent.error = ErrorVO( event.result.error );
				dispatch( loginFaultEvent );
			}
		}


		public function register( email:String ):void {
			zamf.addEventListener( ResultEvent.RESULT, registerResultHandler );
			zamf.addEventListener( FaultEvent.FAULT, registerResultFaultHandler );
			zamf.register( email );
		}

		private function registerResultFaultHandler( event:FaultEvent ):void {
			zamf.removeEventListener( ResultEvent.RESULT, registerResultHandler );
			zamf.removeEventListener( FaultEvent.FAULT, registerResultFaultHandler );

			var registerFaultEvent:AERegisterEvent = new AERegisterEvent( AERegisterEvent.FAULT );
			registerFaultEvent.errorMessage = "Unknown Error has Occurred";
			registerFaultEvent.errorCode = 900;
			dispatch( registerFaultEvent );
		}

		private function registerResultHandler( event:ResultEvent ):void {
			zamf.addEventListener( ResultEvent.RESULT, registerResultHandler );

			if ( event.result.success ) {
				var registerEvent:AERegisterEvent = new AERegisterEvent( AERegisterEvent.SUCCESS );
				dispatch( registerEvent );
			} else {
				var registerFaultEvent:AERegisterEvent = new AERegisterEvent( AERegisterEvent.FAULT );
				registerFaultEvent.errorMessage = event.result.error;
				registerFaultEvent.errorCode = event.result.error_code;
				dispatch( registerFaultEvent );
			}
		}
	}
}