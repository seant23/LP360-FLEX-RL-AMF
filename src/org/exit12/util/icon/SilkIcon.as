////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360 
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package org.exit12.util.icon {

	public class SilkIcon {

		public var icon:String;

		public function SilkIcon( icon:String ) {
			this.icon = icon;
		}

		public function toString():String {
			return "image/silk/" + icon + ".png";
		}
	}
}