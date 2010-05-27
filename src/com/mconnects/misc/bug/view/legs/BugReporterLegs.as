////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.misc.bug.view.legs {
	import com.mconnects.misc.bug.BugReporterContext;
	import com.mconnects.misc.bug.BugToolbox;
	import com.mconnects.misc.bug.IBugReporterModule;
	import com.mconnects.misc.bug.model.vo.JIRAProjectComponentVO;
	import com.mconnects.misc.bug.model.vo.JIRAProjectIssueTypeVO;
	import com.mconnects.misc.bug.model.vo.JIRAProjectIssueVO;
	import com.mconnects.misc.bug.model.vo.JIRAProjectPriorityVO;
	import com.mconnects.misc.bug.model.vo.JIRAProjectVO;
	import com.mconnects.misc.bug.service.events.JIRAServiceProjectEvent;
	import com.mconnects.misc.bug.service.events.JIRAServiceProjectIssueEvent;

	import flash.utils.setTimeout;

	import mx.binding.utils.BindingUtils;
	import mx.containers.ControlBar;
	import mx.controls.ComboBox;
	import mx.controls.TextArea;
	import mx.controls.TextInput;
	import mx.core.IUIComponent;
	import mx.core.IVisualElementContainer;
	import mx.events.FlexEvent;

	import org.exit12.module.TitleWindowModule;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.core.IModule;
	import org.robotlegs.utilities.modular.core.IModuleContext;

	public class BugReporterLegs extends TitleWindowModule implements IModule, IBugReporterModule {

		private var _JIRAProjectKey:String;

		[Bindable]
		public var project:JIRAProjectVO;

		public var titleInput:TextInput;
		public var descriptionInput:TextArea;
		public var priorityCombo:ComboBox;
		public var locationCombo:ComboBox;
		public var typeCombo:ComboBox;

		[Bindable]
		public var ready:Boolean = false;

		public function BugReporterLegs():void {
			contextType = BugReporterContext;
		}

		public function set JIRAProjectKey( JIRAProjectKey:String ):void {
			_JIRAProjectKey = JIRAProjectKey;
		}

		public function get JIRAProjectKey():String {
			return _JIRAProjectKey;
		}

		public function save():void {
			var issue:JIRAProjectIssueVO = new JIRAProjectIssueVO();
			issue.addAffectedVersion( project.currentVersion );
			issue.addAffectedComponent( JIRAProjectComponentVO( locationCombo.selectedItem ));
			issue.summary = titleInput.text;
			issue.description = descriptionInput.text;
			issue.priority = JIRAProjectPriorityVO( priorityCombo.selectedItem ).id;
			issue.type = JIRAProjectIssueTypeVO( typeCombo.selectedItem ).id;
			issue.project = _JIRAProjectKey;

			var event:JIRAServiceProjectIssueEvent = new JIRAServiceProjectIssueEvent( JIRAServiceProjectIssueEvent.CREATE, issue );

			dispatchEvent( event );
			//currentState = 'complete';
			//ControlBar( controlBar ).removeAllChildren();
			//setTimeout( slickClose, 3000 );
		}




	}
}