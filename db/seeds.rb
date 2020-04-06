User.create(name: "asija", password: "123456")
User.create(name: "leeann", password: "023456")
User.create(name: "mom", password: "#moml1f3")
User.create(name: "dad", password: "#dadsru13")


User.find(1).movies << Movie.new(name: "Finding Nemo", year: 2000, category: "Disney", rating: 4.8)
User.find(2).movies << Movie.new(name: "The Lion King", year: 1994, category: "Disney", rating: 4.5)
User.find(3).movies << Movie.new(name: "Black Panther", year: 2018, category: "Marvel", rating: 4.7)
User.find(4).movies << Movie.new(name: "Avengers: Infinity War", year: 2018, category: "Marvel", rating: 4.9)