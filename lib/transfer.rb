require "pry"

class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @count = 0
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    if self.count < 1 && self.valid? && self.sender.balance > self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      self.count += 1
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    self.status = "reversed"
    end
  end

end
