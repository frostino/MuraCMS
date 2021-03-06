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

<cfparam name="attributes.keywords" default="">
<cfparam name="attributes.isNew" default="1">
<cfset counter=0 />
<cfoutput>
<div id="contentSearch">
<h3 class="alt">#application.rbFactory.getKeyValue(session.rb,'collections.contentsearch')#</h3>
	<input id="parentSearch" name="parentSearch" value="#HTMLEditFormat(attributes.keywords)#" type="text" class="text" maxlength="50"/><a class="submit" href="javascript:;" onclick="loadSiteParents('#attributes.siteid#','#attributes.parentid#',document.getElementById('parentSearch').value,0);return false;"><span>#application.rbFactory.getKeyValue(session.rb,'collections.search')#</span></a>
</div>
</cfoutput>
<cfif not attributes.isNew>
<cfset request.rsList=application.contentManager.getPrivateSearch(attributes.siteid,attributes.keywords)/>
 <table class="stripe">
    <tr> 
      <th class="varWidth"><cfoutput>#application.rbFactory.getKeyValue(session.rb,'collections.selectnewsection')#</cfoutput></th>
	  <th class="administration">&nbsp;</th>
    </tr><cfif request.rslist.recordcount>
	<tr class="alt"><cfoutput>  
		<cfif attributes.parentID neq ''>
		<cfset parentCrumb=application.contentManager.getCrumbList(attributes.parentid, attributes.siteid)/>
         <td class="varWidth">#application.contentRenderer.dspZoomNoLinks(parentCrumb)#</td>
		 <cfelse>
		  <td class="varWidth">#application.rbFactory.getKeyValue(session.rb,'collections.noneselected')#</td>
		 </cfif>
		  <td class="administration"><input type="radio" name="parentid" value="#attributes.parentid#" checked="checked"></td>
		</tr></cfoutput>
     <cfoutput query="request.rslist" startrow="1" maxrows="100">
		<cfset crumbdata=application.contentManager.getCrumbList(request.rslist.contentid, attributes.siteid)/> 
		<cfset verdict=application.permUtility.getnodePerm(crumbdata)/>
		<cfif verdict neq 'none'  and attributes.parentID neq  request.rslist.contentid and request.rslist.type neq 'Link' and request.rslist.type neq 'File'>	
			<cfset counter=counter+1/>
		<tr <cfif not(counter mod 2)>class="alt"</cfif>>  
          <td class="varWidth">#application.contentRenderer.dspZoomNoLinks(crumbdata,request.rslist.fileExt)#</td>
		  <td class="administration"><input type="radio" name="parentid" value="#request.rslist.contentid#"></td>
		</tr>
	 </cfif>
       </cfoutput>
	 	<cfelse>
		<tr class="alt"><cfoutput>  
		  <td class="noResults" colspan="2">#application.rbFactory.getKeyValue(session.rb,'collections.nosearchresults')#<input type="hidden" name="parentid" value="#attributes.parentid#" /> </td>
		</tr></cfoutput>
		</cfif>
  </table>
</td></tr></table>
<cfelse>
<cfoutput><input type="hidden" name="parentid" value="#attributes.parentid#" /></cfoutput>
</cfif>