content = "<%= escape_javascript(render(:partial => 'amount_form', locals: {action: "deposit"})) %>"
$('#account_content').html(content)