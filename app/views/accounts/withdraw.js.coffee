content = "<%= escape_javascript(render(:partial => 'amount_form', locals: {action: "withdraw"})) %>"
$('#account_content').html(content)