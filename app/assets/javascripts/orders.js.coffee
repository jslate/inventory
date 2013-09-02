$ ->

  $('.add-item').on 'ajax:before', (event) ->
    link = $(event.target)
    return false if link.hasClass 'disabled'

    row = link.closest('tr')
    item = row.find($('#order_item_item')).val()
    quantity = row.find($('#order_item_quantity')).val()
    link.data 'params', {item: item, quantity: quantity}

  $('.add-item').on 'ajax:success', (event, data) ->
    link = $(event.target)
    row = link.closest('tr')
    row.before(data)

  enable_or_disable_add_button = (event) ->
    add_button = $(event.target).closest('tr').find('.add-item')
    if $('#order_item_item').val() != '' and $('#order_item_quantity').val() != ''
        add_button.removeClass('disabled')
    else
        add_button.addClass('disabled')

  $('#order_item_item').on 'change', enable_or_disable_add_button
  $('#order_item_quantity').on 'keyup', enable_or_disable_add_button


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

