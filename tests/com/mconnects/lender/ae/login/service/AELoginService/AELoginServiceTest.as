////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////


package com.mconnects.lender.ae.login.service.AELoginService {
	import com.mconnects.lender.ae.login.events.AELoginEvent;
	import com.mconnects.lender.ae.login.events.AELoginFaultEvent;
	import com.mconnects.lender.ae.login.events.AERegisterEvent;
	import com.mconnects.lender.ae.login.service.LenderContactService;
	import com.mconnects.lender.ae.model.vo.LenderContactVO;

	import flash.events.EventDispatcher;

	import flexunit.framework.Assert;

	import mx.rpc.remoting.RemoteObject;
	import mx.utils.ObjectUtil;

	import org.exit12.view.components.Prompt;
	import org.flexunit.async.Async;
	import org.robotlegs.utilities.modular.base.ModuleEventDispatcher;

	public class AELoginServiceTest {

		public var service:LenderContactService;

		[Before]
		public function setUp():void {
			service = new LenderContactService();

			//Simulate the RL Injection
			service.moduleEventDispatcher = new ModuleEventDispatcher();
			service.eventDispatcher = new EventDispatcher();
		}

		[After]
		public function tearDown():void {
			service = null;
		}

		[BeforeClass]
		public static function setUpBeforeClass():void {
		}

		[AfterClass]
		public static function tearDownAfterClass():void {
		}

		/**
		 * Test Construct
		 */

		[Test]
		public function testAELoginService():void {

		}

		/**
		 * Test Successfully Login
		 */

		[Test( async, timeout="1000" )]
		public function testGoodLogin():void {
			var testAE:LenderContactVO = new LenderContactVO();

			testAE.email = "sean@exit12.org";
			testAE.password = "Q9KIMHWMRF";

			Async.handleEvent( this, service.moduleEventDispatcher, AELoginEvent.LOGIN_SUCCESS, function( event:AELoginEvent, passThruObj:Object ):void {
					Assert.assertTrue( event.type == AELoginEvent.LOGIN_SUCCESS );
					Assert.assertNotNull( event.lenderContact );
					Assert.assertNotNull( event.lenderContact.lencontid );
				});

			service.login( testAE );
		}

		[Test( async, timeout="1000" )]
		public function testBadLogin():void {
			var testAE:LenderContactVO = new LenderContactVO();

			testAE.email = "sean@exit12.org";
			testAE.password = "WrongPassword";

			Async.handleEvent( this, service.eventDispatcher, AELoginFaultEvent.LOGIN_FAULT, function( event:AELoginFaultEvent, passThruObj:Object ):void {
					Assert.assertTrue( event.type == AELoginFaultEvent.LOGIN_FAULT );
					Assert.assertNotNull( event.error );
				});

			service.login( testAE );
		}

		[Test( async, timeout="1000" )]
		public function testBadDataLogin():void {
			var testAE:LenderContactVO = new LenderContactVO();

			testAE.email = "sean@exit12.org";

			Async.handleEvent( this, service.eventDispatcher, AELoginFaultEvent.LOGIN_FAULT, function( event:AELoginFaultEvent, passThruObj:Object ):void {
					Assert.assertTrue( event.type == AELoginFaultEvent.LOGIN_FAULT );
					Assert.assertNotNull( event.error );
				});

			service.login( testAE );
		}


		/**
		 * Test Register
		 */


		[Test( async, timeout="1000" )]
		public function testRegisterNoReRegister():void {
			var testAE:LenderContactVO = new LenderContactVO();

			testAE.email = "sean@exit12.org";

			Async.handleEvent( this, service.eventDispatcher, AERegisterEvent.FAULT, function( event:AERegisterEvent, passThruObj:Object ):void {
					Assert.assertTrue( event.type == AERegisterEvent.FAULT );
					Assert.assertNotNull( event.error );
					Assert.assertEquals( 301, event.error.code );
				});

			service.register( testAE );
		}
	}
}