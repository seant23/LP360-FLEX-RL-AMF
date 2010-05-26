////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360 
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package org.exit12.util {

	public class AreoIcon {

		public var icon:String;
		public var size:int;

		public function AreoIcon( icon:String, size:int ) {
			this.icon = icon;
			this.size = size;
		}

		public function toString():String {
			return "image/areo/" + size + "/" + icon + ".png";
		}
	}
}