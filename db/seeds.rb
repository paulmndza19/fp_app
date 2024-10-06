# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating admin role..."
admin = Role.create!(name: 'Admin')

puts "Creating member role..."
member = Role.create!(name: 'Member')

puts "Creating president role..."
president = Role.create!(name: 'President')

puts "Creating secretary role..."
secretary = Role.create!(name: 'Secretary')

puts "Creating auditor role..."
auditor = Role.create!(name: 'Auditor')

puts "Creating users..."
User.create!(
  member_id_number: "0124-001",
  email: "testuser@gmail.com",
  first_name: "Mia",
  last_name: "Villarica",
  password: "password",
  birthday: "12/12/2000",
  role_id: admin.id
)

User.create!(
  member_id_number: "0124-002",
  email: "testpres@gmail.com",
  first_name: "Ray Samuel",
  last_name: "Grecalda",
  password: "password",
  birthday: "12/12/2000",
  role_id: president.id
)

User.create!(
  member_id_number: "0124-003",
  email: "testsec@gmail.com",
  first_name: "Jean",
  last_name: "Cabela",
  password: "password",
  birthday: "12/12/2000",
  role_id: secretary.id
)

User.create!(
  member_id_number: "0124-004",
  email: "testaudit@gmail.com",
  first_name: "Marie Ann",
  last_name: "Gonzales",
  password: "password",
  birthday: "12/12/2000",
  role_id: auditor.id
)

User.create!(
  [
    # member_1
    { member_id_number: "0124-005",
      email: "crlxltbr@gmail.com",
      first_name: "Jesse Carlo",
      last_name: "Altobar",
      password: "member1",
      birthday: "22/05/2003",
      role_id: member.id },

    # member_2
    { member_id_number: "0124-006",
      email: "yurieduria2@gmail.com",
      first_name: "John Angelo",
      last_name: "Eduria",
      password: "member2",
      birthday: "04/10/2002",
      role_id: member.id },

    # member_3
    { member_id_number: "0124-007",
      email: "galitaugustus@gmail.com",
      first_name: "Augustus Jeshua",
      last_name: "Galit",
      password: "member3",
      birthday: "08/08/2002",
      role_id: member.id },

    # member_4
    { member_id_number: "0124-008",
      email: "charmaine.brigaiz@gmail.com",
      first_name: "Charmaine",
      last_name: "Brigaiz",
      password: "password",
      birthday: "13/07/1983",
      role_id: member.id },

    # member_5
    { member_id_number: "0124-009",
      email: "jericjames.alejo@gmail.com",
      first_name: "Jeric James",
      last_name: "Alejo",
      password: "password",
      birthday: "01/01/1993",
      role_id: member.id },

    # member_6
    { member_id_number: "0124-010",
      email: "laureenmiranda@gmail.com",
      first_name: "Maria Laureen",
      last_name: "Miranda",
      password: "password",
      birthday: "06/09/1986",
      role_id: member.id },

    # member_7
    { member_id_number: "0124-011",
      email: "markbernardino@gmail.com",
      first_name: "Mark",
      last_name: "Bernardino",
      password: "password",
      birthday: "01/01/1986",
      role_id: member.id },

    # member_8
    { member_id_number: "0124-012",
      email: "rachielrivano@gmail.com",
      first_name: "Rachiel",
      last_name: "Rivano",
      password: "password",
      birthday: "02/02/1986",
      role_id: member.id },

    # member_9

    { member_id_number: "0124-013",
      email: "paullustre@gmail.com",
      first_name: "Paul Allan",
      last_name: "Lustre",
      password: "password",
      birthday: "03/03/1986",
      role_id: member.id },

    # member_10
    { member_id_number: "0124-014",
      email: "edwardflores@gmail.com",
      first_name: "Edward",
      last_name: "Flores",
      password: "password",
      birthday: "04/04/1986",
      role_id: member.id },

    # member_11
    { member_id_number: "0124-015",
      email: "milasoriano@gmail.com",
      first_name: "Mila Grace",
      last_name: "Soriano",
      password: "password",
      birthday: "01/01/1970",
      role_id: member.id },

    # member_12
    { member_id_number: "0124-016",
      email: "aquinolara@gmail.com",
      first_name: "Lara Beth",
      last_name: "Aquino",
      password: "password",
      birthday: "02/02/1970",
      role_id: member.id },

    # member_13
    { member_id_number: "0124-017",
      email: "chloegonzales@gmail.com",
      first_name: "Chloe Ann",
      last_name: "Gonzales",
      password: "password",
      birthday: "03/03/1970",
      role_id: member.id },

    # member_14
    { member_id_number: "0124-018",
      email: "nathmartinez@gmail.com",
      first_name: "Nathaniel Cruz",
      last_name: "Martinez",
      password: "password",
      birthday: "04/04/1970",
      role_id: member.id },

    # member_15
    { member_id_number: "0124-019",
      email: "ashergaza@gmail.com",
      first_name: "Asher Drake",
      last_name: "Gaza",
      password: "password",
      birthday: "05/05/1970",
      role_id: member.id },

    # member_16
    { member_id_number: "0124-020",
      email: "jaydenramos@gmail.com",
      first_name: "Jayden Eli",
      last_name: "Ramos",
      password: "password",
      birthday: "06/06/1970",
      role_id: member.id },

    # member_17
    { member_id_number: "0124-021",
      email: "celinemorales@gmail.com",
      first_name: "Celine Marie",
      last_name: "Morales",
      password: "password",
      birthday: "07/07/1970",
      role_id: member.id },

    # member_18
    { member_id_number: "0124-022",
      email: "alexacastillo@gmail.com",
      first_name: "Alexa Nicole",
      last_name: "Castillo",
      password: "password",
      birthday: "08/08/1970",
      role_id: member.id },

    # member_19
    { member_id_number: "0124-023",
      email: "noahbautista@gmail.com",
      first_name: "Noah James",
      last_name: "Bautista",
      password: "password",
      birthday: "09/09/1970",
      role_id: member.id },

    # member_20
    { member_id_number: "0124-024",
      email: "sofiamendoza@gmail.com",
      first_name: "Sofia Isla",
      last_name: "Mendoza",
      password: "password",
      birthday: "10/10/1970",
      role_id: member.id },

    # member_21
    { member_id_number: "0124-025",
      email: "rosedelosreyes@gmail.com",
      first_name: "Rose",
      last_name: "Delos Reyes",
      password: "password",
      birthday: "01/01/1965",
      role_id: member.id },

    # member_22
    { member_id_number: "0124-026",
      email: "alvareztessa@gmail.com",
      first_name: "Tessa Lorraine",
      last_name: "Alvarez",
      password: "password",
      birthday: "02/02/1965",
      role_id: member.id },

    # member_23
    { member_id_number: "0124-027",
      email: "briannarivera@gmail.com",
      first_name: "Brianna",
      last_name: "Rivera",
      password: "password",
      birthday: "03/03/1965",
      role_id: member.id },

    # member_24
    { member_id_number: "0124-028",
      email: "asherlopez@gmail.com",
      first_name: "Asher",
      last_name: "Lopez",
      password: "password",
      birthday: "04/04/1965",
      role_id: member.id },

    # member_25
    { member_id_number: "0124-029",
      email: "rileyhernandez@gmail.com",
      first_name: "Riley",
      last_name: "Hernandez",
      password: "password",
      birthday: "05/05/1965",
      role_id: member.id },

    # member_26
    { member_id_number: "0124-030",
      email: "avafernandez@gmail.com",
      first_name: "Ava",
      last_name: "Fernandez",
      password: "password",
      birthday: "06/06/1965",
      role_id: member.id },

    # member_27
    { member_id_number: "0124-031",
      email: "jaycevillanueva@gmail.com",
      first_name: "Jayce",
      last_name: "Villanueva",
      password: "password",
      birthday: "07/07/1965",
      role_id: member.id },

    # member_28
    { member_id_number: "0124-032",
      email: "siennasantiago@gmail.com",
      first_name: "Sienna",
      last_name: "Santiago",
      password: "password",
      birthday: "08/08/1965",
      role_id: member.id },

    # member_29
    { member_id_number: "0124-033",
      email: "tylergonzaga@gmail.com",
      first_name: "Tyler",
      last_name: "Gonzaga",
      password: "password",
      birthday: "09/09/1965",
      role_id: member.id },

    # member_30
    { member_id_number: "0124-034",
      email: "jasonlim@gmail.com",
      first_name: "Jason",
      last_name: "Lim",
      password: "password",
      birthday: "10/10/1965",
      role_id: member.id },

  ]
)

# carlo_user = User.find_by(email: "crlxltbr@gmail.com")

# puts "Creating contribution..."
# Contribution.create(
#   [
#     { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/01/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/02/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/03/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/04/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/05/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/06/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/07/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/08/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/09/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/10/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/11/01", },

#       { user_id: carlo_user.id,
#       amount: 50,
#       month: "2024/12/01", },
#   ]
# )


puts "Creating claim request type..."
ClaimRequestType.create!(
  [
    { name: "Hospitalization",
      amount: "5000" },

    { name: "Nuptial",
      amount: "2500" },

    { name: "Funeral",
      amount: "5000" },

    { name: "Retirement",
      amount: "5000" },
  ]
)

# puts "Creating claim request..."
# nuptial_category = ClaimRequestType.find_by(name: "Nuptial")

# ClaimRequest.create(
#   [
#     { user_id: carlo_user.id,
#       claim_request_type_id: nuptial_category.id,
#       status: "Approved" },
#   ]
# )

puts "Creating sales category..."
SalesCategory.create!(
  [
    { name: "Canteen Sales"},

    { name: "Softdrinks"},

    { name: "Mineral Income"},

    { name: "Consignment"},

    { name: "Supplies"},

    { name: "Transportation"},

    # { name: "Food Allowance"},

    # { name: "Medical/Retirement"},

    # { name: "Salary"},

    # { name: "Misc/Repair"},

    { name: "Cash Deposit"},
  ]
)

puts "Creating daily sales category..."
canteen_sales_category = SalesCategory.find_by(name: "Canteen Sales")
softdrinks_category = SalesCategory.find_by(name: "Softdrinks")
mineral_category = SalesCategory.find_by(name: "Mineral Income")
consignment_category = SalesCategory.find_by(name: "Consignment")
supplies_category = SalesCategory.find_by(name: "Supplies")
transportation_category = SalesCategory.find_by(name: "Transportation")
# food_allowance_category = SalesCategory.find_by(name: "Food Allowance")
# medical_retirement_category = SalesCategory.find_by(name: "Medical/Retirement")
# salary_category = SalesCategory.find_by(name: "Salary")
# misc_repair_category = SalesCategory.find_by(name: "Misc/Repair")
cash_deposit_category = SalesCategory.find_by(name: "Cash Deposit")

# puts "Creating daily sales..."
# DailySale.create!(
#   [
#     { sales_category_id: canteen_sales_category.id,
#     amount: "7250.00",
#     sales_date: "25/09/2024" },

#     { sales_category_id: softdrinks_category.id,
#       amount: "2300.00",
#       sales_date: "25/09/2024" },

#     { sales_category_id: mineral_category.id,
#     amount: "900.00",
#     sales_date: "25/09/2024" },
#   ]
# )

puts "Creating expenses category..."
ExpenseCategory.create!(
  [
    { name: "Electricity"},
  ]
)
puts "Creating daily expenses category..."
electricity_expenses_category = ExpenseCategory.find_by(name: "Electricity")

# puts "Creating daily expenses..."
# DailyExpense.create!(
#   [
#     { expense_category_id: electricity_expenses_category.id,
#     amount: "3000.00",
#     expense_date: "25/09/2024" },
#   ]
# )

puts "Creating stalls..."
Stall.create!(
  [
    { name: "Shen's Corner"},

    { name: "Shakit"},

    { name: "May Lemon"},

    { name: "Snack Bar"},

    { name: "Grace Corner"},

    { name: "Sisig Corner"},

    { name: "Aida's Corner"},

    { name: "Cakefrost"},

    { name: "Ebak Stall"},

    { name: "Edward"},
  ]
)

puts "Creating stalls category..."
shens_corner_stall = Stall.find_by(name: "Shen's Corner")
shakit_stall = Stall.find_by(name: "Shakit")
may_lemon_stall = Stall.find_by(name: "May Lemon")
snack_bar_stall = Stall.find_by(name: "Snack Bar")
grace_corner_stall = Stall.find_by(name: "Grace Corner")
sisig_corner_stall = Stall.find_by(name: "Sisig Corner")
aidas_corner_stall = Stall.find_by(name: "Aida's Corner")
cake_frost_stall = Stall.find_by(name: "Cakefrost")
ebak_stall = Stall.find_by(name: "Ebak Stall")
edward_stall = Stall.find_by(name: "Edward")

puts "Creating tenants..."
Tenant.create!(
  [
    { first_name: "Juan",
    middle_name: "Dela",
    last_name: "Cruz" },

    { first_name: "Shen",
    middle_name: "Delos",
    last_name: "Reyes" },

    { first_name: "Sha",
    middle_name: "Lee",
    last_name: "Kit" },

    { first_name: "May",
    middle_name: "Lee",
    last_name: "Mon" },

    { first_name: "Snack",
    middle_name: "Tee",
    last_name: "Bar" },

    { first_name: "Grace",
    middle_name: "Valenzuela",
    last_name: "Corner" },

    { first_name: "Sisig",
    middle_name: "Bautista",
    last_name: "Corner" },

    { first_name: "Aida",
    middle_name: "Santos",
    last_name: "Corner" },

    { first_name: "Cake",
    middle_name: "Gonzales",
    last_name: "Frost" },

    { first_name: "Edward",
    middle_name: "Rivera",
    last_name: "De Leon" },
  ]
)
puts "Seeding complete."
