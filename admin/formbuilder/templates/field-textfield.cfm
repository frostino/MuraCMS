<cfoutput><span>
		<div class="meld-tb-form">
			<div class="meld-tb-header">
				<h3>#mmRBF.getKeyValue(session.rb,'formbuilder.field.textfield')#: <span id="meld-tb-form-label">bob</span></h3>
				<ul class="right">
					<li><div class="ui-button" id="button-trash" title="#mmRBF.getKeyValue(session.rb,'formbuilder.delete')#"><span class="ui-icon ui-icon-closethick"></span></div></li>
				</ul>
			</div>
			<div class="columns clearfix">
				<div class="col2 wide bordered">
					<ul class="template-form">
						<li>
							<label for="label">#mmRBF.getKeyValue(session.rb,'formbuilder.field.label')#</label>
							<input class="text medium tb-label" type="text" name="label" value="" maxlength="50" data-required='true' />
						</li>
						<li>
							<label for="value">#mmRBF.getKeyValue(session.rb,'formbuilder.field.value')#</label>
							<input class="text long" type="text" name="value" value="" maxlength="250" />
						</li>
					</ul>
				</div>
				<div class="col3 right">
					<ul class="template-form">
						<!---<li>
						<label for="cssstyle">#mmRBF.getKeyValue(session.rb,'formbuilder.field.cssstyle')#</label>
							<select class="select" name="cssstyle">
							<option value="small">Small</option>
							<option value="medium">Medium</option>
							<option value="large">Large</option>
							</select>
						</li>--->
						<li>
							<label for="size">#mmRBF.getKeyValue(session.rb,'formbuilder.field.size')#</label>
							<input class="text medium" type="text" name="size" value="" maxlength="50" data-required='false' />
						</li>
						<li>
							<label for="cssid">#mmRBF.getKeyValue(session.rb,'formbuilder.field.cssid')#</label>
							<input class="text medium" type="text" name="cssid" value="" maxlength="50" data-required='false' />
						</li>
						<li>
							<label for="cssclass">#mmRBF.getKeyValue(session.rb,'formbuilder.field.cssclass')#</label>
							<input class="text medium" type="text" name="cssclass" value="" maxlength="50" data-required='false' />
						</li>
					</ul>
				</div>
			</div>
			<div class="columns clearfix topbordered">
				<div class="col2 wide bordered">
					<ul class="template-form">
						<li>
							<label for="validatetype">#mmRBF.getKeyValue(session.rb,'formbuilder.field.validatetype')#</label>
							<select class="select" name="validatetype">
								<option value="">#mmRBF.getKeyValue(session.rb,'formbuilder.field.validate.none')#</option>
								<option value="numeric">#mmRBF.getKeyValue(session.rb,'formbuilder.field.validate.numeric')#</option>
								<option value="date">#mmRBF.getKeyValue(session.rb,'formbuilder.field.validate.date')#</option>
								<option value="email">#mmRBF.getKeyValue(session.rb,'formbuilder.field.validate.email')#</option>
								<option value="regex">#mmRBF.getKeyValue(session.rb,'formbuilder.field.validate.regex')#</option>
							</select>
						</li>
						<li>
							<label for="validateregex">#mmRBF.getKeyValue(session.rb,'formbuilder.field.validateregex')#</label>
							<input class="text long" type="text" name="validateregex" value="" maxlength="250" />
						</li>
						<li>
							<label for="validatemessage">#mmRBF.getKeyValue(session.rb,'formbuilder.field.validatemessage')#</label>
							<input class="text long" type="text" name="validatemessage" value="" maxlength="250" />
						</li>
						<li class="checkbox">
							<label for="isrequired">
							<input type="checkbox" type="text" name="isrequired" value="1">
							#mmRBF.getKeyValue(session.rb,'formbuilder.field.isrequired')#</label>
						</li>
					</ul>
				</div>
				<div class="col3 right">
					<ul class="template-form">
						<li>
							<label for="name">#mmRBF.getKeyValue(session.rb,'formbuilder.field.name')#</label>
							<input id="tb-name" class="text medium disabled" name="name" type="text" value="" maxlength="50" disabled="true" />
						</li>
						<li>
							<label for="tooltip">#mmRBF.getKeyValue(session.rb,'formbuilder.field.tooltip')#</label>
							<input class="text long" type="text" name="tooltip" value="" maxlength="250" />
						</li>
					</ul>
				</div>
			</div>
		</div>
	</span>
</cfoutput>