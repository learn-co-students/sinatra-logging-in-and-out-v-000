
class User
  attr_reader :username, :password, :bank_activity, :balance, :id

  ALL = []

  def initialize(username, password, id, initial_balance)
    @username = username
    @password = password
    @id = id
    @balance = initial_balance
    ALL << self
  end

  def self.all
    ALL
  end

end

User.new("jdorchen", "elephant", 1, 300)
User.new("mcaulfield", "sneaky12", 2, 600)
User.new("dbaron", "test123",3, 100)
User.new("jdryland", "artartART",4, 50)
User.new("agreenwald", "gopher",5, 2500)
User.new("hchauhan", "12345678",6, 700)
User.new("rgerber1", "SWiTz",7, 900)

