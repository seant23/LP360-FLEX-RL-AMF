LoanPro360
=============

 
Compiler Options
----------------
- `-locale en_US` - Internationalization / Localization
- `-services "services.xml"` - This used to point the service zend to the correct URL
- `-isolate-styles=false` - This is vital for sharing the CSS accross all the modules and core app.
- `-keep-all-type-selectors=true` - This is forces the compiler to keep all entries in the css file. Otherwise it will just load the ones used by the Shell.
- `-show-unused-type-selector-warnings=false` - Hide Warnings from css files.