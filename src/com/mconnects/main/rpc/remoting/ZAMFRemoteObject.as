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

		public var zamf:RemoteObject = new RemoteObject( 'zend' );

		public function ZAMFRemoteObject() {

		}
	}

}