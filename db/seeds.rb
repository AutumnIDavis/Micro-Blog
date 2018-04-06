User.create(fname: "Luke", lname: "Skywalker", password: "starwars", age: "22")

user_list = [
  ["Leia", "Skywalker","princess","22"],
  ["Han", "Solo","bounty","22"],
  ["Anakin", "Skywalker","vader","46"],
]

user_list.each do |fname, lname, password, age|
  User.create(fname: fname, lname: lname, password: password, age: age)
end

Post.create(title:"Why I love lemons", content: "they are gggreeeat", user_id: 1)
