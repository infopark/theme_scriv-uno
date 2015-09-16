class LoginPage < Obj
  attribute :title, :string

  def self.instance
    all.first
  end
end
