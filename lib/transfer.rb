class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
  	@status = "pending"
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  end

  def valid?
  	@sender.valid? == true && @receiver.valid? == true ? true : false
  end

  def execute_transaction
  	if @sender.balance < amount
  		@status = "rejected"
  		"Transaction rejected. Please check your account balance."
  	elsif @status == "complete"
  	else
  	@sender.balance -= amount
  	@receiver.balance += amount
  	@status = "complete"
  end
  end

  def reverse_transfer
  	if @status == "complete"
  		@sender.balance += amount
  		@receiver.balance -= amount
  		@status = "reversed"
  	end
  end
end
