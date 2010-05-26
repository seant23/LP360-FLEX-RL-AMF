////////////////////////////////////////////////////////////////////////////////
//
//  LoanPro360
//  Copyright © 2010 Springwater Capital LLC.
//  All Rights Reserved.
//
//  NOTICE: Springwater does NOT permit you to use, modify, and distribute this file
//
////////////////////////////////////////////////////////////////////////////////

package com.mconnects.lender.model.vo {

	[RemoteClass( alias="LP_lenderVO" )]
	[Bindable]
	public class LenderVO {
		public var lenderid:int;
		public var company:String;
		public var firstname:String;
		public var status:String;
		public var lastname:String;
		public var searchname:String;
		public var lxelenderid:int;
		public var lender_website:String;
		public var phone:String;
		public var guidelines_url:String;
		public var ext:String;
		public var pricing_url:String;
		public var brokerage_login_url:String;
		public var cphone:String;
		public var training_notices_url:String;
		public var fax:String;
		public var email:String;
		public var auto_login_interval:int;
		public var notes:String;
		public var post_address:String;
		public var login_field_name:String;
		public var rating:Number;
		public var id_field_name:String;
		public var signupdate:String;
		public var pw_field_name:String;
		public var url:String;
		public var application_renewal_date:String;
		public var admin_login_id:String;
		public var login:String;
		public var admin_login_username:String;
		public var passwd:String;
		public var address:String;
		public var lender_relationship_type_id:int;
		public var city:String;
		public var admin_login_url:String;
		public var state:String;
		public var admin_login_pw:String;
		public var third_party_underwriting:Boolean;
		public var zip:String;
		public var uwemail:String;
		public var password_change_interval:int;
		public var password_reminder:Boolean;
		public var lcemail:String;
		public var password_expires:int;
		public var doemail:String;
		public var mortee_name:String;
		public var mailing_address:String;
		public var mortee_address:String;
		public var mailing_city:String;
		public var mortee_city:String;
		public var mailing_stateid:int;
		public var mailing_postal_code:String;
		public var mortee_state:String;
		public var mortee_zip:String;
		public var broker_code:String;
		public var pswd:String;
		public var pdf_download_pswd:String;
		public var lender_status_id:int;
		public var pswd_download:String;
		public var file_submission_type:int;
		public var logo_file_id:int;
		public var rate_email:String;
		public var rate_domain:String;
		public var browser_type:String;
		public var login_required:Boolean;
		public var postal_code_id:int;
		public var document_resource_id:int;
		public var fha_sponsor_code:String;
		public var va_lender_id:String;
		public var status_details:String;
	}
}