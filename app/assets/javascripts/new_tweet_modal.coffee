$(document).ready ->

  $(document).on 'click', '#btn-open-tweet-modal', ->
    $('#m_error_explanation').empty()
    $('#tweet-modal').modal('show')

  $(document).on "ajax:error", (event, xhr, status, error) ->
    errors = jQuery.parseJSON(xhr.responseText)
    errorCount = errors.length
    errExp = $('#m_error_explanation')

    errExp.empty()

    errExp.append('<h2>' + errorCount + '件のエラーがあります。</h2>')
    #errExp.append('<ul>')
    list = ""
    for e in errors
      list += '<li>' + e + '</li>'
    
    errExp.append('<ul>' + list + '</ul>')
    errExp.show()
