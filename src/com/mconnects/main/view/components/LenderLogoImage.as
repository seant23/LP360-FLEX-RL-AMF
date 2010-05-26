////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.main.view.components {
	import com.mconnects.main.config.LoanProConfig;

	import mx.controls.Image;

	public class LenderLogoImage extends Image {
		private var _lenderID:uint;

		public function LenderLogoImage() {
			super();
		}

		public function set lenderID( lenderID:uint ):void {
			_lenderID = lenderID;
			source = LoanProConfig.BASE_URL + 'Plex/File/Access_Image/' + _lenderID + "/" + width + "/" + height;
		}

		public function get lenderID():uint {
			return _lenderID;
		}
	}
}