////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.misc.bug.view.legs {
	import com.mconnects.misc.bug.BugReporterContext;

	import flash.utils.setTimeout;

	import mx.containers.ControlBar;
	import mx.core.IVisualElementContainer;

	import org.exit12.module.TitleWindowModule;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.core.IModule;
	import org.robotlegs.utilities.modular.core.IModuleContext;

	public class BugReporterLegs extends TitleWindowModule implements IModule {

		public function save():void {
			currentState = 'complete';
			ControlBar( controlBar ).removeAllChildren();
			setTimeout( slickClose, 3000 );
		}


		/**
		 * Required for Injectors && Event Bus
		 * Don't edit below this line
		 */
		protected var context:IModuleContext;

		[Inject]
		public function set parentInjector( value:IInjector ):void {
			context = new BugReporterContext( this, false, value );
		}

		public function dispose():void {
			if ( parent && parent.contains( this ))
				IVisualElementContainer( parent ).removeElement( this );
			context.dispose();
			context = null;
		}

	}
}