$(document).on 'turbolinks:load', ->
  # Init all dropdown on the page
  $('.ui.dropdown').dropdown()
  # Init all accordion on the page
  $('.ui.accordion').accordion()
  # Init main-menu dropown with trigger on hover event
  # $('.main-menu > .dropdown').dropdown { on: 'hover' }
  # Init main-menu sidebar with trigger on main-menu toc click
  # $('.main-menu.sidebar')
  #   .sidebar 'attach events', '.pusher .main-menu > .toc.item', 'toggle'
    # .sidebar 'attach events', '.pushable .main-menu > .item', 'hide'
  # Init tabs
  # $('.menu .item[data-tab]').tab()
  # Init messages
  $('.message .close').click -> $(this).closest('.message').transition('fade')
  # Init datepickers for date fields (using calendar semantic-ui plugin, see https://github.com/mdehoog/Semantic-UI-Calendar)
  # $('.ui.calendar.datetime').calendar(type: 'datetime')
  # $('.ui.calendar.date').calendar(type: 'date')
  # dropdown selects:
  $('select.dropdown').dropdown(placeholder: false)
  $('.ui.radio.checkbox').checkbox()
  $(document).trigger 'semantic-ui:after-init'
