package com.mconnects.misc.bug.service {
	import com.mconnects.misc.bug.model.vo.JIRAProjectIssueVO;
	import com.mconnects.misc.bug.model.vo.JIRAProjectVO;
	import com.mconnects.misc.bug.service.events.JIRAServiceProjectEvent;
	import com.mconnects.misc.bug.service.events.JIRAServiceProjectIssueEvent;

	import flash.events.EventDispatcher;

	import flexunit.framework.Assert;

	import org.exit12.view.components.Prompt;
	import org.flexunit.async.Async;
	import org.robotlegs.utilities.modular.base.ModuleEventDispatcher;

	public class JIRAServiceTest {

		public var service:JIRAService;

		[Before]
		public function setUp():void {
			service = new JIRAService();

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

		[Test( order=1, async, timeout="2500", description="Load A Project" )]
		public function testLoadProject():void {

			Async.handleEvent( this, service.eventDispatcher, JIRAServiceProjectEvent.LOAD_SUCCESS, function( event:JIRAServiceProjectEvent, passThruObj:Object ):void {
					Assert.assertTrue( event.type == JIRAServiceProjectEvent.LOAD_SUCCESS );
					Assert.assertNotNull( event.project );
					Assert.assertNotNull( event.project.key );
				}, 2500 );

			service.loadProject( "LOANPRO" );
		}

		[Test( order=2, async, timeout="7500", description="Loads a Project, Creates a Issue for it, and deletes the issue." )]
		public function testCreateIssue():void {

			Async.handleEvent( this, service.eventDispatcher, JIRAServiceProjectEvent.LOAD_SUCCESS, function( event:JIRAServiceProjectEvent, passThruObj:Object ):void {
					Assert.assertTrue( event.type == JIRAServiceProjectEvent.LOAD_SUCCESS );
					Assert.assertNotNull( event.project );
					Assert.assertNotNull( event.project.key );

					var issue:JIRAProjectIssueVO = new JIRAProjectIssueVO();
					var project:JIRAProjectVO = event.project;

					issue.project = project.key;
					issue.summary = "Test Issue Created by (JIRAServiceTest.testCreateIssue)";
					issue.description = "Test Issue Description Created by (JIRAServiceTest.testCreateIssue)";
					issue.addAffectedVersion( project.currentVersion );
					service.createIssue( issue );
				}, 2500 );

			Async.handleEvent( this, service.eventDispatcher, JIRAServiceProjectIssueEvent.CREATE_SUCCESS, function( event:JIRAServiceProjectIssueEvent, passThruObj:Object ):void {
					Assert.assertTrue( event.type == JIRAServiceProjectIssueEvent.CREATE_SUCCESS );
					Assert.assertNotNull( event.issue );
					service.deleteIssue( event.issue );
				}, 7500 );

			Async.handleEvent( this, service.eventDispatcher, JIRAServiceProjectIssueEvent.DELETE_SUCCESS, function( event:JIRAServiceProjectIssueEvent, passThruObj:Object ):void {
					Assert.assertTrue( event.type == JIRAServiceProjectIssueEvent.DELETE_SUCCESS );
				}, 12500 );

			service.loadProject( "LOANPRO" );


		}
	}
}