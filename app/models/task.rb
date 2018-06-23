class Task < ApplicationRecord
  validates :name, presence: true

  belongs_to :category

  scope :done, -> { where(done: true)}
  scope :pending, -> { where(done: false)}

  def self.to_csv
    csv = []
    csv << ['Categoria', 'Nome', 'Detalhes', 'Prazo', 'Feito?'].join(',')

    Task.all.each do |task|
      row = [
        task.category.name,
        task.name,
        task.details,
        I18n.l(task.due_date, format: :short),
        task.done? ? 'Sim' : 'Não'
      ]
       csv << row.join(',')
    end
    csv.join("\n")
  end
end
