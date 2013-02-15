$ ->
  $('.add-item').on 'ajax:before', (event) ->
    link = $(event.target)
    row = link.closest('tr')
    item = row.find($('#order_item_item')).val()
    quantity = row.find($('#order_item_quantity')).val()
    link.data 'params', {item: item, quantity: quantity}

  $('.add-item').on 'ajax:success', (event, data) ->
    link = $(event.target)
    row = link.closest('tr')
    console.debug data
    row.before(data)

  $('.delete-row').on 'ajax:complete', (event) ->
    link = $(event.target)
    link.closest('tr').slideUp('slow')

  $('.edit-row').on 'click', (event) ->
    event.preventDefault()
    link = $(event.target)
    row = link.closest('tr')
    row.find('.text').hide()
    row.find('.quantity-field').show()
    icon = link
    icon = link.find('i') if link.find('i').length > 0
    icon.removeClass('icon-pencil').addClass('icon-ok')

