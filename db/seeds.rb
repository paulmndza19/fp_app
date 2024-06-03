# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating admin role..."
admin = Role.create(name: 'Admin')

puts "Creating member role..."
member = Role.create(name: 'Member')

puts "Creating users..."
User.create(
  email: "testuser@gmail.com",
  first_name: "Mia",
  last_name: "Villarica",
  password: "password",
  birthday: "12/12/2000",
  role_id: admin.id
)

User.create(
  [
    # member_1
    { email: "carlotest@gmail.com",
      first_name: "Jesse Carlo",
      last_name: "Altobar",
      password: "member1",
      birthday: "22/05/2003",
      role_id: member.id },

    # member_2
    { email: "yurieduria2@gmail.com",
      first_name: "John Angelo",
      last_name: "Eduria",
      password: "member2",
      birthday: "04/10/2002",
      role_id: member.id },

    # member_3
    { email: "galitaugustus@gmail.com",
      first_name: "Augustus Jeshua",
      last_name: "Galit",
      password: "member3",
      birthday: "08/08/2002",
      role_id: member.id },

    # member_4
    { email: "charmaine.brigaiz@gmail.com",
      first_name: "Charmaine",
      last_name: "Brigaiz",
      password: "password",
      birthday: "13/07/1983",
      role_id: member.id },

    # member_5
    { email: "jericjames.alejo@gmail.com",
      first_name: "Jeric James",
      last_name: "Alejo",
      password: "password",
      birthday: "01/01/1993",
      role_id: member.id },

    # member_6
    { email: "laureenmiranda@gmail.com",
      first_name: "Maria Laureen",
      last_name: "Miranda",
      password: "password",
      birthday: "06/09/1986",
      role_id: member.id },
    
    # member_7
    { email: "markbernardino@gmail.com",
      first_name: "Mark",
      last_name: "Bernardino",
      password: "password",
      birthday: "01/01/1986",
      role_id: member.id },

    # member_8
    { email: "rachielrivano@gmail.com",
      first_name: "Rachiel",
      last_name: "Rivano",
      password: "password",
      birthday: "02/02/1986",
      role_id: member.id },

    # member_9
    { email: "paullustre@gmail.com",
      first_name: "Paul Allan",
      last_name: "Lustre",
      password: "password",
      birthday: "03/03/1986",
      role_id: member.id },

    # member_10
    { email: "edwardflores@gmail.com",
      first_name: "Edward",
      last_name: "Flores",
      password: "password",
      birthday: "04/04/1986",
      role_id: member.id },

    # member_11
    { email: "milasoriano@gmail.com",
      first_name: "Mila Grace",
      last_name: "Soriano",
      password: "password",
      birthday: "01/01/1970",
      role_id: member.id },
    
    # member_12
    { email: "aquinolara@gmail.com",
      first_name: "Lara Beth",
      last_name: "Aquino",
      password: "password",
      birthday: "02/02/1970",
      role_id: member.id },

    # member_13
    { email: "chloegonzales@gmail.com",
      first_name: "Chloe Ann",
      last_name: "Gonzales",
      password: "password",
      birthday: "03/03/1970",
      role_id: member.id },

    # member_14
    { email: "nathmartinez@gmail.com",
      first_name: "Nathaniel Cruz",
      last_name: "Martinez",
      password: "password",
      birthday: "04/04/1970",
      role_id: member.id },

    # member_15
    { email: "asherlopez@gmail.com",
      first_name: "Asher Dominic",
      last_name: "Lopez",
      password: "password",
      birthday: "05/05/1970",
      role_id: member.id },

    # member_16
    { email: "jaydenramos@gmail.com",
      first_name: "Jayden Eli",
      last_name: "Ramos",
      password: "password",
      birthday: "06/06/1970",
      role_id: member.id },
    
    # member_17
    { email: "celinemorales@gmail.com",
      first_name: "Celine Marie",
      last_name: "Morales",
      password: "password",
      birthday: "07/07/1970",
      role_id: member.id },

    # member_18
    { email: "alexacastillo@gmail.com",
      first_name: "Alexa Nicole",
      last_name: "Castillo",
      password: "password",
      birthday: "08/08/1970",
      role_id: member.id },

    # member_19
    { email: "noahbautista@gmail.com",
      first_name: "Noah James",
      last_name: "Bautista",
      password: "password",
      birthday: "09/09/1970",
      role_id: member.id },

    # member_20
    { email: "sofiamendoza@gmail.com",
      first_name: "Sofia Isla",
      last_name: "Mendoza",
      password: "password",
      birthday: "10/10/1970",
      role_id: member.id },

    # member_21
    { email: "rosedelosreyes@gmail.com",
      first_name: "Rose",
      last_name: "Delos Reyes",
      password: "password",
      birthday: "01/01/1965",
      role_id: member.id },
    
    # member_22
    { email: "alvareztessa@gmail.com",
      first_name: "Tessa Lorraine",
      last_name: "Alvarez",
      password: "password",
      birthday: "02/02/1965",
      role_id: member.id },

    # member_23
    { email: "briannarivera@gmail.com",
      first_name: "Brianna",
      last_name: "Rivera",
      password: "password",
      birthday: "03/03/1965",
      role_id: member.id },

    # member_24
    { email: "asherlopez@gmail.com",
      first_name: "Asher",
      last_name: "Lopez",
      password: "password",
      birthday: "04/04/1965",
      role_id: member.id },

    # member_25
    { email: "rileyhernandez@gmail.com",
      first_name: "Riley",
      last_name: "Hernandez",
      password: "password",
      birthday: "05/05/1965",
      role_id: member.id },

    # member_26
    { email: "avafernandez@gmail.com",
      first_name: "Ava",
      last_name: "Fernandez",
      password: "password",
      birthday: "06/06/1965",
      role_id: member.id },
    
    # member_27
    { email: "jaycevillanueva@gmail.com",
      first_name: "Jayce",
      last_name: "Villanueva",
      password: "password",
      birthday: "07/07/1965",
      role_id: member.id },

    # member_28
    { email: "siennasantiago@gmail.com",
      first_name: "Sienna",
      last_name: "Santiago",
      password: "password",
      birthday: "08/08/1965",
      role_id: member.id },

    # member_29
    { email: "tylergonzaga@gmail.com",
      first_name: "Tyler",
      last_name: "Gonzaga",
      password: "password",
      birthday: "09/09/1965",
      role_id: member.id },

    # member_30
    { email: "jasonlim@gmail.com",
      first_name: "Jason",
      last_name: "Lim",
      password: "password",
      birthday: "10/10/1965",
      role_id: member.id },

  ]
)

carlo_user = User.find_by(email: "carlotest@gmail.com")

puts "Creating contribution..."
Contribution.create(
  [
    { user_id: carlo_user.id,
      amount: 50,
      month: "January",
      year: "2023"  },
      
      { user_id: carlo_user.id,
      amount: 50,
      month: "February",
      year: "2023"  },
      
      { user_id: carlo_user.id,
      amount: 50,
      month: "March",
      year: "2023"  },

      { user_id: carlo_user.id,
      amount: 50,
      month: "April",
      year: "2023"  },
      
      { user_id: carlo_user.id,
      amount: 50,
      month: "May",
      year: "2023"  },
      
      { user_id: carlo_user.id,
      amount: 50,
      month: "June",
      year: "2023"  },

      { user_id: carlo_user.id,
      amount: 50,
      month: "July",
      year: "2023"  },
      
      { user_id: carlo_user.id,
      amount: 50,
      month: "August",
      year: "2023"  },
      
      { user_id: carlo_user.id,
      amount: 50,
      month: "September",
      year: "2023"  },

      { user_id: carlo_user.id,
      amount: 50,
      month: "October",
      year: "2023"  },
      
      { user_id: carlo_user.id,
      amount: 50,
      month: "November",
      year: "2023"  },
      
      { user_id: carlo_user.id,
      amount: 50,
      month: "December",
      year: "2023"  },
  ]
)

puts "Creating claim request type..."
ClaimRequestType.create(
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
SalesCategory.create(
  [
    { name: "Canteen Sales"},

    { name: "Softdrinks"},

    { name: "Mineral Income"},

    { name: "Consignment"},

    { name: "Supplies"},

    { name: "Transportation"},

    { name: "Food Allowance"},

    { name: "Medical/Retirement"},

    { name: "Salary"},

    { name: "Misc/Repair"},

    { name: "Cash Deposit"},
  ]
)

puts "Creating daily sale category..."
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

puts "Creating daily sale..."
DailySale.create(
  [
    { sales_category_id: canteen_sales_category.id,
    amount: "5433",
    sales_date: "13/05/2024" },

    { sales_category_id: softdrinks_category.id,
      amount: "6050",
      sales_date: "13/05/2024" },

    { sales_category_id: mineral_category.id,
    amount: "1000",
    sales_date: "13/05/2024" },
  ]
)

puts "Seeding complete."