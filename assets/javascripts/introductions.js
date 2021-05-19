Introductions = {
    current_intro_steps: [],
    setIntroParams: function (selector, text, position, step) {
        var dom_selector, title
        if(selector){
            dom_selector = document.querySelector(selector)
        }
        Introductions.current_intro_steps.push(
            {
                title: title,
                element: dom_selector,
                intro: text,
                position: position,
                order: step
            }
        )
        Introductions.current_intro_steps.sort((a, b) => a.order.localeCompare(b.order));
    },
    startIntroductions: function (first_url, intro_id, next_url, next_step_id, current_step) {
        var intro, options, redirection_url, next_page, done_label
        if (next_url != "") {
            next_page = true
            done_label = I18n.nextPage
            redirection_url = next_url + '?multipage=true&intro_id=' + intro_id + '&intro_step=' + next_step_id + "&first_url=" + first_url
        } else {
            next_page = false
            done_label = I18n.quit
            if (first_url !== window.location.href) {
                redirection_url = first_url + '?no_intro=true'
            }
        }

        options = {
            'tooltipClass': "introJsTooltipClass",
            'showStepNumbers': false,
            'showButtons': true,
            'showBullets': false,
            'nextPage': next_page,
            'doneLabel': done_label,
            'skipLabel': I18n.quit,
            'prevLabel': I18n.prevLabel,
            'nextLabel': I18n.nextLabel,
            'nextToDone': false // do not add a 'done' button at the end
        }

        options["steps"] = Introductions.current_intro_steps

        intro = introJs().setOptions(options)
        if (current_step > 1) {
            intro.goToStep(current_step)
        }

        intro.start().oncomplete(function () {
            if (redirection_url) {
                window.location.href = redirection_url
            }
        })

    }
}

jQuery(function () {
    $('#introduction_form').on('click', '.remove_fields', function (event) {
        event.preventDefault()
        $(this).prev('input[type=hidden]').val('1')
        $(this).closest('li').hide()
    });
    $('#introduction_form').on('click', '.add_fields', function (event) {
        event.preventDefault()
        var regexp, time
        time = new Date().getTime()
        regexp = new RegExp($(this).data('id'), 'g')
        $(this).before($(this).data('fields').replace(regexp, time))
        updateStepsPriorities()
    });
    $('#introduction_form').on('click', '#new_url_checkbox', function (event) {
        id = $(this).closest("p").attr("data-new-url-checkbox-id")
        $('#new_url_' + id).toggle()
    });
});

function updateStepsPriorities() {
    var steps = $('#sortable li:visible')
    i = 1
    steps.each(function () {
        $(this).find('.order_step').val(i)
        $(this).find('.label_step_priority').html(i)
        i++
    })
}

