$ ->
  # Handling modals
  $(document).on "ajax:complete", '[data-action="modal"]', (event, data, status, xhr) ->
    $('body').append '<div class="modal hide fade modal-large" id="modalWindow">' + data.responseText + '</div>'
    $('#modalWindow').modal('show')

  $(document).on "hidden", "#modalWindow", (event) ->
    $(this).remove()

  $(document).on "ajax:complete", "#modalWindow form, #modalWindow .modal_link", (event, data, status, xhr) ->
    switch data.status
      when 200
        $("#modalWindow").modal('hide')
        $("#" + $(this).data('replace-id')).replaceWith data.responseText unless $(this).data('replace-id') == 'no-replace'
      when 422
        $("#modalWindow").empty().append data.responseText
  # !Handling modals

  # Handling confirmation notices
  $('[data-confirm]').livequery "click", (event) ->
    event.stopPropagation()
    event.preventDefault()
    modalHtml = '<div class="modal hide fade" id="confirmationWindow">
                  <div class="modal-header">
                    <a class="close" data-dismiss="modal">×</a>
                    <h3>Please confirm</h3>
                  </div>
                  <div class="modal-body">' + $(this).data('confirm') + '</div>
                  <div class="modal-footer">
                    <a href=' + $(this).attr('href') + ' data-method=' + $(this).data('method') + ' class="btn btn-danger">OK</a>
                    <button data-dismiss="modal" class="btn">Cancel</button>
                  </div>
                </div>'
    $('body').append modalHtml
    $('#confirmationWindow').modal('show')

  $(document).on "hidden", "#confirmationWindow", (event) ->
    $(this).remove()
  # !# Handling confirmation notices