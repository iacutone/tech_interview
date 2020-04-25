alias TechInterview.Accounts
alias TechInterview.Companies
alias TechInterview.Questions

{:ok, user} = Accounts.create_user(%{
  email: "test@test.com",
  password: "pass",
  password_confirmation: "pass"
})

{:ok, company} = Companies.create_company(%{
  name: "Vimeo",
  website: "vimeo.com",
  health_care: true,
  dependent_coverage: true,
  retirement_plan: true,
  retirement_plan_match: 10,
})

instructions = ~s"""
A B C D E F G H I
J K L M N O P Q R
S T U V W X Y Z _

Given a keyboard like this, write an application that can output a string of commands to type a given word.
"""

code = ~s"""
def method(input)
  # answer here
end
"""

Questions.create_question(%{
  data_input: "JOE",
  data_output: "DERRRRREULE",
  code: code,
  instructions: instructions,
  language: "Ruby",
  title: "Keyboard Movement",
  user_id: user.id,
  company_id: company.id
}, company.id)
