LoanPro360
=============

 
Compiler Options
----------------
- `-locale en_US` 
	- Internationalization / Localization
- `-services "services.xml"` 
	- This used to point the service zend to the correct URL
- `-isolate-styles=false` 
	- This is vital for sharing the CSS accross all the modules and core app.
- `-keep-all-type-selectors=true` 
	- This is forces the compiler to keep all entries in the css file. Otherwise it will just load the ones used by the Shell.
- `-show-unused-type-selector-warnings=false` 
	- Hide Warnings from css files.
- `-define+=SYSTEM::WINDOWS,true`
	- Compile on Windows
- `-define+=SYSTEM::NIX,false`
	- Compile on *nix
- `-define+=SYSTEM::TESTING,true`
	- Compile Debug/Test Code


Rules For Pushing To This Repo
------------------------------

1. All new classes, must have a equivalent test case.
2. You must run all tests. And they must pass!
3. You must have well defined log message attached to each push.

Coding Standards
----------------

1. All Scripts should have the Springwater Copyright.

2. All modules should follow the com.mconnects.moduleName and this directory structure

	- controlers
	- events
	- model
		- vo
	- service
	- view
		- components
		- legs
			- {$moduleName}Legs.as
		- ui
		- mediators
			- {$moduleName}Mediator.as
	- {$moduleName}Context.as
	- {$moduleName}Module.mxml
	
3. All tests should be pulled out of the main src/ folder and placed in tests/

4. All tests should share the same package as the class they are testing
	- com.mconnects.lender.ae.service.LenderContactService (in src/)
	- com.mconnects.lender.ae.service.LenderContactServiceTest (in tests/)
	
5. Coding Style need to match the following. (FlexFormatter Plugin Helps)
	> public function functionName( paramA:String, paramB ):void {
	> 		callFunctionB( paramA, paramB );
	> }
	
6. You need to add your new modules to the ANT project in order for them to compile on the nightly server.