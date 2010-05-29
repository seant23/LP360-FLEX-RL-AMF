////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.main.rpc.remoting.model.vo {
	import com.mconnects.error.model.vo.ErrorVO;

	[RemoteClass( alias="LP_AMFResponseVO" )]
	public class AMFResponseVO {
		public var success:Boolean;
		public var response:Object;
		public var error:ErrorVO;
	}
}