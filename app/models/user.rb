class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :carts

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  after_create :add_customer_id
  after_save :update_customer

  private
  def add_customer_id
    MercadoPago::Customer.create(self.attributes.except("id")) do |customer|
      puts "customer: #{customer.to_json}"
      self.update_attributes({customer_id: customer.id})
    end
  end

  def update_customer

  end

end
