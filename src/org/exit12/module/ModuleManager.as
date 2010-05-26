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


	import flash.events.ProgressEvent;
	import flash.utils.setTimeout;

	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;
	import mx.modules.ModuleManager;

	import org.exit12.util.Slick;
	import org.exit12.view.components.Prompt;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;

	public class ModuleManager extends mx.modules.ModuleManager {

		public static const READY:String = "ready";
		private static var cache:Array = new Array();
		public static var injector:IInjector;

		public static function loadModule( source:String, showPreloader:Boolean = true, load:Boolean = true ):ModuleInstance {
			var mod:ModuleInstance = new ModuleInstance();
			TitleWindowModule;

			if ( cache[ source ] != null ) {
				var cacheVal:Object = cache[ source ];
				mod.moduleInfo = cache[ source ];
				setTimeout( mod.loaded, 0 );
				return mod;
			} else {
				if ( showPreloader ) {
					var progress:Module_Loader = Slick.open( Module_Loader, true ) as Module_Loader;
				}

				cache[ source ] = getModule( source );
				var moduleInfo:IModuleInfo = cache[ source ] as IModuleInfo;

				var ModuleEventReadyHandler:Function = function( e:ModuleEvent ):void {
						if ( showPreloader ) {
							progress.close();
						}

						mod.loaded();
						moduleInfo.removeEventListener( ModuleEvent.READY, ModuleEventReadyHandler );
					}

				var ModuleEventErrorHandler:Function = function( e:ModuleEvent ):void {

						if ( showPreloader ) {
							progress.close();
						}

						Prompt.error( "An Error Occurred Whiled Loading A Module\n" + e.errorText );

						moduleInfo.removeEventListener( ModuleEvent.ERROR, ModuleEventErrorHandler );
					}

				moduleInfo.addEventListener( ModuleEvent.READY, ModuleEventReadyHandler );
				moduleInfo.addEventListener( ModuleEvent.ERROR, ModuleEventErrorHandler );


				if ( showPreloader ) {
					moduleInfo.addEventListener( ModuleEvent.PROGRESS, function( e:ProgressEvent ):void {
							var num:Number = Math.round(( e.bytesLoaded / e.bytesTotal ) * 100 );
							progress.progressBar.setProgress( num, 100 );
						});
				}

				mod.moduleInfo = moduleInfo;

				if ( load ) {
					mod.load();
				}

				return mod;
			}
		}
	}
}