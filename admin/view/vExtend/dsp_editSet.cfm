<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. �See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. �If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes
the preparation of a derivative work based on Mura CMS. Thus, the terms and 	
conditions of the GNU General Public License version 2 (�GPL�) cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission
to combine Mura CMS with programs or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, �the copyright holders of Mura CMS grant you permission
to combine Mura CMS �with independent software modules that communicate with Mura CMS solely
through modules packaged as Mura CMS plugins and deployed through the Mura CMS plugin installation API,
provided that these modules (a) may only modify the �/trunk/www/plugins/ directory through the Mura CMS
plugin installation API, (b) must not alter any default objects in the Mura CMS database
and (c) must not alter any files in the following directories except in cases where the code contains
a separately distributed license.

/trunk/www/admin/
/trunk/www/tasks/
/trunk/www/config/
/trunk/www/requirements/mura/

You may copy and distribute such a combined work under the terms of GPL for Mura CMS, provided that you include
the source code of that other code when and as the GNU GPL requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception
for your modified version; it is your choice whether to do so, or to make such modified version available under
the GNU General Public License version 2 �without this exception. �You may, if you choose, apply this exception
to your own modified versions of Mura CMS.
--->

<cfset subType=application.classExtensionManager.getSubTypeByID(attributes.subTypeID)>
<cfset extendSetBean=subType.loadSet(attributes.extendSetID) />
<h2><cfif len(attributes.extendSetID)>Edit<cfelse>Add</cfif> Attribute Set</h2>
<cfoutput>
	
<ul class="metadata">
<li><strong>Class Extension:</strong> #application.classExtensionManager.getTypeAsString(subType.getType())# / #subType.getSubType()#</li>
</ul>

<ul id="navTask">
<li><a href="index.cfm?fuseaction=cExtend.listSubTypes&siteid=#URLEncodedFormat(attributes.siteid)#">Class Extension Manager</a></li>
<li><a href="index.cfm?fuseaction=cExtend.listSets&subTypeID=#attributes.subTypeID#&siteid=#URLEncodedFormat(attributes.siteid)#">Back to Attribute Sets</a></li>
</ul>


<form novalidate="novalidate" name="form1" method="post" action="index.cfm" onsubit="return validateForm(this);">
<dl class="oneColumn">
<dt class="first">Attribute Set Name</dt>
<dd><input name="name" value="#HTMLEditFormat(extendSetBean.getName())#" required="true"/></dd>
<dt>Container</dt>
<dd><select name="container">
<option value="Default">Extended Attributes Tab</option>
<option value="Basic"<cfif extendSetBean.getContainer() eq "Basic"> selected</cfif>>Basic Tab</option>
<option value="Custom"<cfif extendSetBean.getContainer() eq "Custom"> selected</cfif>>Custom UI</option>
</select>
</dd>
<cfif subType.getType() neq  "1" and application.categoryManager.getCategoryCount(attributes.siteID)>
<dt>Available Category Dependencies</dt>
<dd class="categoryAssignment"><cf_dsp_categories_nest siteID="#attributes.siteID#" parentID="" nestLevel="0" extendSetBean="#extendSetBean#"></dd>
</cfif></dl>
<cfif not len(attributes.extendSetID)>
<a class="submit" href="javascript:;" onclick="return submitForm(document.forms.form1,'add');"><span>Add</span></a><input type=hidden name="extendSetID" value="#createuuid()#"><cfelse> <a class="submit" href="javascript:;" onclick="return submitForm(document.forms.form1,'delete','Delete Attribute Set?');"><span>Delete</span></a> <a class="submit" href="javascript:;" onclick="return submitForm(document.forms.form1,'update');"><span>Update</span></a>

<input type=hidden name="extendSetID" value="#extendSetBean.getExtendSetID()#"></cfif><input type="hidden" name="action" value="">
<input name="fuseaction" value="cExtend.updateSet" type="hidden">
<input name="siteID" value="#HTMLEditFormat(attributes.siteid)#" type="hidden">
<input name="subTypeID" value="#subType.getSubTypeID()#" type="hidden">
</form>
</cfoutput>