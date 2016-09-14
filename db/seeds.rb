# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
School.create(:name=>'Central Academy', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173')
School.create(:name=>'CPS', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9950915488')

Classroom.create(:name=>'1st', :no_of_student=>'10', :school_id=>'1')
Classroom.create(:name=>'2nd', :no_of_student=>'10', :school_id=>'1')
Classroom.create(:name=>'3rd', :no_of_student=>'10', :school_id=>'1')
Classroom.create(:name=>'4th', :no_of_student=>'10', :school_id=>'1')
Classroom.create(:name=>'5th', :no_of_student=>'10', :school_id=>'1')
Classroom.create(:name=>'Nur', :no_of_student=>'10', :school_id=>'2')
Classroom.create(:name=>'LKG', :no_of_student=>'10', :school_id=>'2')
Classroom.create(:name=>'UKG', :no_of_student=>'10', :school_id=>'2')

Subject.create(:name=>'English', :school_id=>'1', :classroom_ids=>[1,3,5])
Subject.create(:name=>'Hindi', :school_id=>'1', :classroom_ids=>[2,4])
Subject.create(:name=>'Math', :school_id=>'1', :classroom_ids=>[1])
Subject.create(:name=>'Science', :school_id=>'2', :classroom_ids=>[6,8])
Subject.create(:name=>'Sanskrit', :school_id=>'2', :classroom_ids=>[7])

Teacher.create(:name=>'Vishal', :gender=>'male', :phone=>'7737986479', :subject_ids=>[1,2,3], :school_id=>1, :classroom_ids=>[1,3,4])
Teacher.create(:name=>'Chetan', :gender=>'male', :phone=>'8769032876', :subject_ids=>[2,1], :school_id=>1, :classroom_ids=>[2,5])
Teacher.create(:name=>'Aaryan', :gender=>'male', :phone=>'1234567890', :subject_ids=>[4,5], :school_id=>2, :classroom_ids=>[6,8])
Teacher.create(:name=>'Ajay', :gender=>'male', :phone=>'0987654321', :subject_ids=>[5], :school_id=>2, :classroom_ids=>[7])

Student.create(:name=>'Mac', :father_name=>'Hello', :mother_name=> 'World', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173', :school_id=>'1')
Student.create(:name=>'Book', :father_name=>'Hello', :mother_name=> 'World', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173', :school_id=>'1')
Student.create(:name=>'Air', :father_name=>'Hello', :mother_name=> 'World', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173', :school_id=>'1')
Student.create(:name=>'Pro', :father_name=>'Hello', :mother_name=> 'World', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173', :school_id=>'1')
Student.create(:name=>'Apple', :father_name=>'Hello', :mother_name=> 'World', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173', :school_id=>'1')
Student.create(:name=>'Boy', :father_name=>'Hello', :mother_name=> 'World', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173', :school_id=>'1')
Student.create(:name=>'Cat', :father_name=>'Hello', :mother_name=> 'World', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173', :school_id=>'2')
Student.create(:name=>'Dog', :father_name=>'Hello', :mother_name=> 'World', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173', :school_id=>'2')
Student.create(:name=>'Eye', :father_name=>'Hello', :mother_name=> 'World', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173', :school_id=>'2')
Student.create(:name=>'Fish', :father_name=>'Hello', :mother_name=> 'World', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173', :school_id=>'2')