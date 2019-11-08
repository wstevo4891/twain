class Person < ApplicationRecord
  belongs_to :manager, class_name: 'Person', optional: true

  has_many :employees, class_name: 'Person', foreign_key: :manager_id

  belongs_to :location

  belongs_to :role

  def self.billable
    joins(:role).merge(Role.billable)
  end

  def self.managed_by(name)
    where(manager_id: find_by(name: name))
  end

  # Find all people not managed by one person
  #
  # @param [String] name
  # @returns [ActiveRecord Relation]
  #
  def self.not_managed_by(name)
    joins(
      <<-SQL
        LEFT JOIN people managers
        ON managers.id = people.manager_id
      SQL
    ).where(
      'managers.id != ? OR managers.id IS NULL',
      Person.find_by(name: name)
    )
  end

  def self.employees_per_manager
    joins(:employees).group('people.name').count('employees_people.id')
  end

  def self.avg_salary_by_role
    joins(:role).group('roles.name').average(:salary)
  end

  def self.highest_salary_by_name
    joins(
      'INNER JOIN (' +
      select('id, rank() OVER (ORDER BY salary DESC)').to_sql +
      ') salaries ON salaries.id = people.id'
    ).where('salaries.rank <= 3').order(:name)
  end

  def self.under_avg_salaries_for_location
    joins(
      'INNER JOIN (' +
      select('location_id, AVG(salary) as average')
        .group('location_id')
        .to_sql +
      ') salaries ON salaries.location_id = people.location_id'
    ).where('people.salary < salaries.average')
  end
end
