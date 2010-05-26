////////////////////////////////////////////////////////////////////////////////
//
//  Exit12 
//  Copyright © 2010 Exit12.org.
//  All Rights Reserved.
//
//  NOTICE: Exit12 does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package org.exit12.module {


	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.system.ApplicationDomain;

	import mx.core.Application;
	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;

	import org.robotlegs.utilities.modular.core.IModule;
	import org.swiftsuspenders.Injector;

	[Event( name="ready", type="org.exit12.module.ModuleManager" )]

	public class ModuleInstance extends EventDispatcher {


		public var moduleInfo:IModuleInfo;
		public var module:DisplayObject;

		public var data:Object;

		public var isLoaded:Boolean = false;

		public function loaded():void {
			var newInstance:* = moduleInfo.factory.create();
			module = DisplayObject( newInstance );

			if ( ModuleManager.injector ) {
				var RLMod:IModule = module as IModule;
				if ( !RLMod ) {
					trace( "Invalid IModule - This Module will not be connected to the event bus" );
				} else {
					ModuleManager.injector.injectInto( RLMod );
				}
			} else {
				trace( "No Injector? " );
			}

			dispatchEvent( new ModuleEvent( ModuleEvent.READY ));
			isLoaded = true;
		}

		public function load():void {
			moduleInfo.load( ApplicationDomain.currentDomain );
		}
	}
}