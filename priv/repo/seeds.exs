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
  title: "Output Keyboard Movement",
  user_id: user.id,
  company_id: company.id
}, company.id)

{:ok, company} = Companies.create_company(%{
  name: "Elasticsearch",
  website: "elasticsearch.com",
  health_care: true,
  dependent_coverage: true,
  retirement_plan: true,
  retirement_plan_match: 6,
})

instructions = ~s"""
Complete the `find_max_product` function below.

The function takes the data input and returns the max product of the four consecutive digits.
"""

code = ~s"""
def find_max_product(digits)
  # answer here
end
"""

data_input = ~s"""
2925408349999462122807594389731416961363978447790201677899454746457539432666792547463442567334132165993675437964898838996916686366366784927972241126845785694617486748486264286556796537333587
"""

Questions.create_question(%{
  data_input: data_input,
  data_output: "6561",
  code: code,
  instructions: instructions,
  language: "Ruby",
  title: "Find the Max Product",
  user_id: user.id,
  company_id: company.id
}, company.id)
