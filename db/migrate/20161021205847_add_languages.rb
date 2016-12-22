class AddLanguages < ActiveRecord::Migration
  def change
    languages = ['English', 'Hindi', 'Tamil', 'Malayalam']
    languages.each do |language|
      Language.create(name: language)
    end
  end
end
