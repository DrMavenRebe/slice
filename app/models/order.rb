class Order

  def total_price
    [10.0, 12.3, 23.2].sample
  end

  def purchased_at
    DateTime.now - [1.day, 2.day].sample
  end

  def shipping
    [true, false].sample
  end

  def created_at
    DateTime.now
  end

  def updated_at
    DateTime.now
  end
end
