////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.ae.login.view.legs {
	import com.mconnects.lender.ae.login.AELoginPromptContext;
	import com.mconnects.lender.ae.login.events.AELoginEvent;
	import com.mconnects.lender.ae.login.events.AERegisterEvent;

	import mx.controls.TextInput;
	import mx.core.IVisualElementContainer;

	import org.exit12.module.TitleWindowModule;
	import org.exit12.util.Slick;
	import org.exit12.view.components.Title_Text_Input;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.core.IModule;
	import org.robotlegs.utilities.modular.core.IModuleContext;

	public class AELoginPromptLegs extends TitleWindowModule implements IModule {

		[Bindable]
		public var loginError:String;

		public var usernameInput:Title_Text_Input;
		public var passwordInput:Title_Text_Input;
		public var registerInput:Title_Text_Input;

		protected var context:IModuleContext;

		[Inject]
		public function set parentInjector( value:IInjector ):void {
			context = new AELoginPromptContext( this, value );
		}

		public function dispose():void {
			if ( parent && parent.contains( this ))
				IVisualElementContainer( parent ).removeElement( this );
			context.dispose();
			context = null;
		}

		public function login():void {
			var loginEvent:AELoginEvent = new AELoginEvent( AELoginEvent.LOGIN_ATTEMPT );
			loginEvent.username = usernameInput.getValue();
			loginEvent.password = passwordInput.getValue();
			enabled = false;
			dispatchEvent( loginEvent );
		}

		public function register():void {
			var registerEvent:AERegisterEvent = new AERegisterEvent( AERegisterEvent.ATTEMPT );
			registerEvent.email = registerInput.getValue();
			enabled = false;
			dispatchEvent( registerEvent );
		}

		//TODO forgotPassword

		public function startResze():void {
			slickCenter();
		}
	}
}