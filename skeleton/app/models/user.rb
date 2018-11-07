# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  #User doesn't have foreign_key, so use has_many
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment
    
    
    # SELECT
    #   *
    # FROM 
    #   enrollments 
    # JOIN
    #   users ON users.id = enrollments.student_id
    # 
    # 
    
  has_many :enrolled_courses,
    through: :enrollments,
    source: :course
    
    
    # SELECT
    #   *
    # FROM 
    #   enrollments 
    # JOIN
    #   users ON users.id = enrollments.student_id
    # JOIN
    #   courses ON courses.id = enrollments.course_id
    # 
    
end
