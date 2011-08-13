function createAccordion() { $('#accordion').accordion(); }

function addRelatedCallsDialog() {
  $('#add_related_calls').dialog({
    autoOpen: false,
    title: 'Add Related Calls',
    width: '400',
    height: '250'
  });
  $('#open_related_calls_dialog').click( function() {
    $('#add_related_calls').dialog('open');
    return false;
  });
  $('a.add_related_call').live('click', function(e) {
    e.preventDefault();
    var tr = $(this).closest('tr');
    var title = tr.find('td.title').text();
    var name  = tr.find('td.name').text();
    var id    = $(this).attr('rel');

    addRelatedCall(id, title, name);
  });
}

function addRelatedCall(id, title, name) {
  var input = "<input type='hidden' name='log[related_log_ids][]' value='"+id+"' />";
  var description = "<span>"+title+"</span>"+name;
  $('#related_calls').append("<li rel='"+id+"'>"+input+description+"</li>");
}

$(document).ready( function() {
  createAccordion();
  addRelatedCallsDialog();
});
