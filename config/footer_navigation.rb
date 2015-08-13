SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav nav_footer'
    primary.item :feedback, 'Предложения и жалобы', 'feedback'
  end
end
