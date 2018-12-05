User.seed(:id) do |u|
	u.id = 1
	u.name = 'わくわく'
	u.email = 'creep040@gmail.com'
	u.password = 'aiueoh'
	u.password_confirmation = 'aiueoh'
	u.admin = true
end
