# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* ruby 2.3.0p0

* Rails 5.0.2

* clone this app

* bundle install

* rails server, go to browser hit http://localhost:3000


* How to run the test suite
rspec spec/controllers/csv_processsors_controller.rb


* Test through api .

curl  -d "value=[['Id', 'First Name', 'Last Name'], ['1', 'Google', 'Tri'], ['2', 'Yahoo', 'web'], ['3', 'Mozil', 'Tri'], ['4', 'Chrome', 'Ext']]"  http://localhost:3000/csv_processsors.json
