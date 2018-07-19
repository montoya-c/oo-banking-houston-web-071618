class BankAccount
#one instance of the class can transfer money to another instance through a Transfer class.
attr_reader :name, :status
attr_writer :balance

  def initialize (name)
    @balance = 1000
    @status = "open"
    @name = name
  end

  def name
    @name
  end

  def balance
    @balance
  end

  def balance=(money)
      @balance = money
    end

def status
  @status
end

def status=(new_value)
  @status = new_value
end

def deposit (num)
  @balance += num
  @balance
end

def display_balance
  "Your balance is $#{self.balance}."
end

def valid?
 if self.status == "open" && self.balance > 0
   true
 else
   false
end
end

def close_account
@status = "closed"
return self.status
end

end
