class Transfer
  # Transfers start out in a "pending" status. They can be executed and go to a "complete" state. They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.
attr_reader :sender, :receiver, :amount
attr_accessor :status

def initialize (sender, receiver, status = "pending", amount)
  @sender = sender
  @receiver = receiver
  @status = status
  @amount = amount
end

def sender
  @sender
end

def receiver
  @receiver
end

def status
  @status
end

def amount
@amount
end

def valid?
  sender.valid? == true && receiver.valid? == true && sender.balance - self.amount > 0
end

def execute_transaction
  if self.valid? && status != "complete"
  self.receiver.balance += self.amount
  self.sender.balance -= self.amount
  self.status = "complete"
else
  self.status = "rejected"
  "Transaction rejected. Please check your account balance."
end
end

def reverse_transfer
 if self.status == "complete"
   self.receiver.balance -= self.amount
   self.sender.balance += self.amount
   self.status = "reversed"
end
end

end
