$(document).ready ->
  $(document).on 'click', '.btn-edit-tweet-modal', ->
    tweetId = $(this).val()
    tweetVal = $('#content_' + tweetId).val()
    $('#m_edit_error_explanation').empty()
    $('#m_edit_tweet').attr('action', '/tweets/' + tweetId + '.json')
    $('#m_edit_tweet').find('#tweet_content').val(tweetVal)
    $('#edit-tweet-modal').modal('show')


  $(document).on "ajax:error", (event, xhr, status, error) ->
    errors = jQuery.parseJSON(xhr.responseText)
    errorCount = errors.length
    errExp = $('#m_edit_error_explanation')

    errExp.empty()

    errExp.append('<h2>' + errorCount + '件のエラーがあります。</h2>')
    #errExp.append('<ul>')
    list = ""
    for e in errors
      list += '<li>' + e + '</li>'
    
    errExp.append('<ul>' + list + '</ul>')
    errExp.show()
