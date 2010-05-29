////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.main.rpc.remoting {
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	import org.exit12.view.components.Prompt;
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.utilities.modular.mvcs.ModuleActor;

	public class ZAMFRemoteObject extends ModuleActor {

		protected var source:String;

		protected function createRemoteObject( resultHandler:Function, faultHandler:Function ):RemoteObject {
			var ro:RemoteObject = new RemoteObject( 'zend' );
			ro.source = source;

			var resultEventHandler:Function = function( e:ResultEvent ):void {
					ro.removeEventListener( ResultEvent.RESULT, resultEventHandler );
					ro.removeEventListener( FaultEvent.FAULT, faultEventHandler );
					resultHandler( e );
				};

			var faultEventHandler:Function = function( e:FaultEvent ):void {
					ro.removeEventListener( FaultEvent.FAULT, resultEventHandler );
					ro.removeEventListener( FaultEvent.FAULT, faultEventHandler );
					faultHandler( e );
				};

			ro.addEventListener( ResultEvent.RESULT, resultEventHandler );
			ro.addEventListener( FaultEvent.FAULT, faultEventHandler );

			return ro;
		}
	}

}