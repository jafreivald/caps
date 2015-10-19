jQuery ->
    $('#datetimepicker').datetimepicker({
        defaultDate: $(this).attr('data-start-datetime')
    })