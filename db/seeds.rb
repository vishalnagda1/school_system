# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
School.create(:name=>'Central Academy', :city=>'Udaipur', :state=>'Rajasthan', :zipcode=>'313001', :phone=>'9636590173')
Subject.create(:name=>'English')
Subject.create(:name=>'Hindi')
Subject.create(:name=>'Math')
Subject.create(:name=>'Science')
Subject.create(:name=>'Sanskrit')
Teacher.create(:name=>'Vishal', :gender=>'male', :phone=>'7737986479', :subject_ids=>[1,3,4], :school_id=>1)
Teacher.create(:name=>'Chetan', :gender=>'male', :phone=>'8769032876', :subject_ids=>[2,5], :school_id=>1)