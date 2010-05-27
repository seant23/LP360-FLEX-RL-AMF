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

	import flash.events.Event;

	import mx.containers.TitleWindow;
	import mx.core.IVisualElementContainer;

	import org.exit12.util.Slick;
	import org.robotlegs.core.IContext;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.core.IModuleContext;

	[Frame( factoryClass="mx.core.FlexModuleFactory" )]

	public class TitleWindowModule extends TitleWindow {

		protected var contextType:Class;

		public function TitleWindowModule() {
			super();
		}

		public function slickClose( e:Event = null ):void {
			Slick.close( this );
		}

		public function slickCenter( duration:uint = 300 ):void {
			Slick.center( this, duration );
		}

		/**
		 * Required for Injectors && Event Bus
		 * Don't edit below this line
		 */
		protected var context:IModuleContext;

		[Inject]
		public function set parentInjector( value:IInjector ):void {
			context = new contextType( this, value );
		}

		public function dispose():void {
			if ( parent && parent.contains( this )) {
				IVisualElementContainer( parent ).removeElement( this );
			}
			context.dispose();
			context = null;
		}
	}
}