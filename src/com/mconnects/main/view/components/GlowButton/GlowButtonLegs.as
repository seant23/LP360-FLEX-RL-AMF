////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.main.view.components.GlowButton {

	import mx.containers.HBox;

	public class GlowButtonLegs extends HBox {
		[Bindable]
		public var buttonIcon:String;

		[Bindable]
		public var buttonLabel:String;

		public function highlight( on:Boolean ):void {
			if ( on ) {
				setStyle( 'backgroundAlpha', .5 );
			} else {
				setStyle( 'backgroundAlpha', .25 );
			}
		}
	}
}

