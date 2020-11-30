class Account < ApplicationRecord
  belongs_to :customer
  belongs_to :plan
  
  
  def due_date
    case Plan.intervals[self.plan.interval]
    when 0  
      return self.created_at + 1.month
    when 1
      return self.created_at + 3.month
    when 2
      return self.created_at + 6.month
    when 3
      return self.created_at + 12.month
    end
  end


  def qrcode
    qr = RQRCode::QRCode.new(self.acc_id)
    svg = qr.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
    svg
  end
end
