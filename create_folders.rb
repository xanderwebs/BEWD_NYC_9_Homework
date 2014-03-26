STUDENTS = [
  'Alex Cheng',
  'Max Dana',
  'Jared Djuhar',
  'Oliver Evans',
  'Tyler Houle',
  'Oleg Jelezniakov',
  'Nick Madrid',
  'Daniel Meagher',
  'Shi Qing Poh',
  'Mike Salvaris',
  'Nina Saporta',
  'David Saunders',
  'Jim Shook',
  'North Shutsharawan',
  'Darrell Simmons',
  'Serafina Smith',
  'Tonia Sun',
  'Piroon Tangnavarad',
  'Andy Timmons',
  'Danny Truong',
  'Nicolas Tse',
  'Jorge Urrutia',
  'Polina White',
  'Gwan Yip'
]

STUDENTS.each do |student|
  name = student.gsub(' ', '_')
  %x( mkdir "_#{name}/" )
  %x( touch "_#{name}/.gitkeep" )
end
