class User

  attr_accessor :age, :name, :login, :password, :email

  def initialize(login, password, email, name)
    @login = login
    @password = password
    @email = email
    @name = name
  end

  def message
    "#{@email} #{login} #{password}\n"
  end

end