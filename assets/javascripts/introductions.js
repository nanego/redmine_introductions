function setIntroParams(selector, text, position, step) {
  $(selector).attr('data-intro', text);
  $(selector).attr('data-position', position);
  $(selector).attr('data-step', step);
}

function startIntroductions(first_url, intro_id, next_url, next_step_id, selectors, current_step) {
    if(selectors){
        if(next_url != ""){
            intro = introJs().setOptions({
                'tooltipClass': "introJsTooltipClass",
                'showStepNumbers': false,
                'showButtons': true,
                'showBullets': false,
                'nextPage': true,
                'doneLabel': I18n.nextPage,
                'skipLabel': I18n.quit,
                'prevLabel': I18n.prevLabel,
                'nextLabel': I18n.nextLabel
            });
            if (current_step>1){
              intro.goToStep(current_step);
            }
            intro.start().oncomplete(function() {
                    window.location.href = next_url + '?multipage=true&intro_id='+intro_id+'&intro_step=' + next_step_id + "&first_url=" + first_url;
            });
        }else{
            intro = introJs().setOptions({
                'tooltipClass': "introJsTooltipClass",
                'showStepNumbers': false,
                'showButtons': true,
                'showBullets': false,
                'nextPage': false,
                'doneLabel': I18n.quit,
                'skipLabel': I18n.quit,
                'prevLabel': I18n.prevLabel,
                'nextLabel': I18n.nextLabel,
                'nextToDone': false // do not add a 'done' button at the end
            });
            if (current_step>1){
              intro.goToStep(current_step);
            }
            if (first_url!==window.location.href) {
              intro.start().oncomplete(function() {
                window.location.href = first_url + '?no_intro=true';
              });
            }else{
              intro.start();
            }
        }
    }
}

jQuery(function() {
  $('#introduction_form').on('click', '.remove_fields', function(event) {
    event.preventDefault();
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('li').hide();
  });
  $('#introduction_form').on('click', '.add_fields', function(event) {
    event.preventDefault();
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    updateStepsPriorities();
  });
  $('#introduction_form').on('click', '#new_url_checkbox', function(event){
    id = $(this).closest("p").attr("data-new-url-checkbox-id");
    $('#new_url_'+id).toggle();
  });
});

function updateStepsPriorities() {
    var steps = $('#sortable li:visible');
    i = 1;
    steps.each(function() {
        $(this).find('.order_step').val(i);
        $(this).find('.label_step_priority').html(i);
        i++;
    });
}
