function setIntroParams(selector, text, position, step) {
  $(selector).attr('data-intro', text);
  $(selector).attr('data-position', position);
  $(selector).attr('data-step', step);
}

function startIntroductions() {
    introJs().setOptions({ 'tooltipClass': "introJsTooltipClass",
        'showStepNumbers': false,
        'showButtons': true,
        'showBullets':false,
        'doneLabel': 'Fermer',
        'skipLabel': 'Passer',
        'prevLabel': '&larr;',
        'nextLabel': 'Suivant &rarr;'
    }).start();
}

jQuery(function() {

    $('#introduction_form').on('click', '.remove_fields', function(event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('li').hide();
        return event.preventDefault();
    });

    $('#introduction_form').on('click', '.add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $(this).before($(this).data('fields').replace(regexp, time));
        updateStepsPriorities();
        return event.preventDefault();
    });
});

function updateStepsPriorities() {
    var steps = $('.ui-state-default');
    i = 1;
    steps.each(function() {
        $(this).find('.order_step').val(i);
        $(this).find('.label_step_priority').html(i);
        i++;
    });
}

function show_modal_do_not_show_again() {
    showModal("ajax-modal", "600px");
}