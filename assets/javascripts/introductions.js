function setIntroParams(selector, text, position, step) {
  $(selector).attr('data-intro', text);
  $(selector).attr('data-position', position);
  $(selector).attr('data-step', step);
}

function startIntroductions(intro_id, next_url, next_step_id) {
    if(next_url != ""){
        introJs().setOptions({ 'tooltipClass': "introJsTooltipClass",
            'showStepNumbers': false,
            'showButtons': true,
            'showBullets':false,
            'doneLabel': 'Page suivante',
            'skipLabel': 'Passer',
            'prevLabel': '&larr;',
            'nextLabel': 'Suivant &rarr;'
        }).start().oncomplete(function() {
                window.location.href = next_url + '?multipage=true&intro_id='+intro_id+'&intro_step=' + next_step_id;
            }).onexit(function() {
                show_modal_do_not_show_again();
            });
    }else{
        introJs().setOptions({ 'tooltipClass': "introJsTooltipClass",
            'showStepNumbers': false,
            'showButtons': true,
            'showBullets':false,
            'doneLabel': 'Fermer',
            'skipLabel': 'Passer',
            'prevLabel': '&larr;',
            'nextLabel': 'Suivant &rarr;'
        }).start().oncomplete(function() {
                show_modal_do_not_show_again();
            }).onexit(function() {
                show_modal_do_not_show_again();
            });
    }
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