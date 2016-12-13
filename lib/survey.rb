class Survey <ActiveRecord::Base
  has_many(:questions)
  validates(:name, {:presence => true, :uniqueness => {case_sensitive: false}})
  before_save(:capitalize)



  # define_method(:redundant?) do
  #   surveys = Survey.all()
  #   surveys.each() do |survey|
  #     if self.name().==(survey.name)
  #       return true
  #     else
  #       false
  #     end
  #   end
  # end

  private

  define_method(:capitalize) do
    self.name=(name.titlecase)
  end

end
