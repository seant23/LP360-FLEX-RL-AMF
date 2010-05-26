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

	import org.exit12.util.Slick;

	[Frame( factoryClass="mx.core.FlexModuleFactory" )]

	public class TitleWindowModule extends TitleWindow {

		public function TitleWindowModule() {
			super();
		}

		public function slickClose( e:Event = null ):void {
			Slick.close( this );
		}

		public function slickCenter( duration:uint = 300 ):void {
			Slick.center( this, duration );
		}
	}
}