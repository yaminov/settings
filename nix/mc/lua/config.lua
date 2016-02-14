require('samples.official-suggestions')
require('samples.fields.better-size')
require('samples.accessories.scrollbar').install()	

ui.Panel.bind('C-_', function(pnl)
    require('samples.accessories.filter-as-you-type').run(pnl)
end)

-- Bring up the calculator.
keymap.bind('C-x m', function()
  require('samples.apps.calc').run()
end)
