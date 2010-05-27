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
	import com.mconnects.misc.bug.model.vo.JIRAProjectIssueVO;
	import com.mconnects.misc.bug.service.events.JIRAServiceProjectEvent;
	import com.mconnects.misc.bug.service.events.JIRAServiceProjectIssueEvent;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class JIRAService extends ZAMFRemoteObject {
		public function JIRAService() {
			zamf.source = "JIRA";
		}


		/**
		 *
		 * Function and Handlers For Loading A JIRA Project
		 *
		 */

		public function loadProject( projectKey:String ):void {
			zamf.addEventListener( ResultEvent.RESULT, loadProjectResultHandler );
			zamf.addEventListener( FaultEvent.FAULT, loadProjectFaultHandler );
			zamf.getProject( projectKey );
		}

		private function loadProjectResultHandler( event:ResultEvent ):void {
			zamf.removeEventListener( ResultEvent.RESULT, loadProjectResultHandler );
			zamf.removeEventListener( FaultEvent.FAULT, loadProjectFaultHandler );

			if ( event.result.success ) {
				var successEvent:JIRAServiceProjectEvent = new JIRAServiceProjectEvent( JIRAServiceProjectEvent.LOAD_SUCCESS );
				successEvent.project = event.result.project;
				dispatch( successEvent );
			} else {
				var failEvent:JIRAServiceProjectEvent = new JIRAServiceProjectEvent( JIRAServiceProjectEvent.LOAD_FAULT );
				failEvent.error = event.result.error;
				dispatch( failEvent );
			}
		}

		private function loadProjectFaultHandler( event:FaultEvent ):void {
			zamf.removeEventListener( ResultEvent.RESULT, loadProjectResultHandler );
			zamf.removeEventListener( FaultEvent.FAULT, loadProjectFaultHandler );

			var faultEvent:JIRAServiceProjectEvent = new JIRAServiceProjectEvent( JIRAServiceProjectEvent.LOAD_FAULT );
			faultEvent.error = new ErrorVO( "Unknown Error has Occurred", 900 );
			dispatch( faultEvent );
		}



		/**
		 *
		 * Function and Handlers For Creating A JIRA Issue
		 *
		 */

		public function createIssue( issue:JIRAProjectIssueVO ):void {
			zamf.addEventListener( ResultEvent.RESULT, createIssueResultHandler );
			zamf.addEventListener( FaultEvent.FAULT, createIssueFaultHandler );
			zamf.createIssue( issue );
		}

		private function createIssueResultHandler( event:ResultEvent ):void {
			zamf.removeEventListener( ResultEvent.RESULT, createIssueResultHandler );
			zamf.removeEventListener( FaultEvent.FAULT, createIssueFaultHandler );

			if ( event.result.success ) {
				var successEvent:JIRAServiceProjectIssueEvent = new JIRAServiceProjectIssueEvent( JIRAServiceProjectIssueEvent.CREATE_SUCCESS );
				dispatch( successEvent );
			} else {
				var failEvent:JIRAServiceProjectIssueEvent = new JIRAServiceProjectIssueEvent( JIRAServiceProjectIssueEvent.CREATE_FAULT );
				failEvent.error = event.result.error;
				dispatch( failEvent );
			}
		}

		private function createIssueFaultHandler( event:FaultEvent ):void {
			zamf.removeEventListener( ResultEvent.RESULT, createIssueResultHandler );
			zamf.removeEventListener( FaultEvent.FAULT, createIssueFaultHandler );

			var faultEvent:JIRAServiceProjectIssueEvent = new JIRAServiceProjectIssueEvent( JIRAServiceProjectIssueEvent.CREATE_FAULT );
			faultEvent.error = new ErrorVO( "Unknown Error has Occurred", 900 );
			dispatch( faultEvent );
		}




	}
}