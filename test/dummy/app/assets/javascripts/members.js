$(document).ready(function() {
    group_id = $('#new_member').data('group-id');

    add_member = function() {
        user = $("#new_member").val()
        $.post('/admin/groups/' + group_id + '/members', { user: user })
        $("#new_member").val("")
        $('#members').append('<li>' + user + '</li>')
    }

    $('#new_member').unbind('keypress').keypress(function(e){
        if (e.which == 13) {
            add_member();
        }
    });
});
