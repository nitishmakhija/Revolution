<% if @tagging.errors.any? %>
	$('#myModal').html("<%= escape_javascript(render :partial => 'form', :tagging => @tagging) %>")
	$('#errors').html("<%= j render partial: 'layouts/messages' %>")
	tags = $('#tagging_tag_id').html()
	$('#tagging_tag_group_id').change ->
	  tag_group = $('#tagging_tag_group_id :selected').text()
	  escaped_tag_group = tag_group.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
	  options = $(tags).filter("optgroup[label='#{tag_group}']").html()
	  if options
	    $('#tagging_tag_id').html(options)
	    $('#tagging_tag_id').parent().show()
	  else
	    $('#tagging_tag_id').empty()
	    $('#tagging_tag_id').parent().hide()

	$('.datepicker').datepicker({ dateFormat: "yy-mm-dd" })
<% else %>
	$('#tags').html("<%= j render partial: 'people/tags', locals: {:person => @person} %>")
	$('#myModal').trigger('reveal:close')
	$('#messages').html("<%= j render partial: 'layouts/messages' %>")
	<% flash.discard %>
<% end %>