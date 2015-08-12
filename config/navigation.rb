SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :home, 'На главную', root_path, class: 'go_home'
    primary.item :signup, 'Вход или регистрация', new_user_session_path, class: 'registration'
  end
end
