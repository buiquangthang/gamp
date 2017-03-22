GraphNode.create! 

Place.create! title: "Bus Stop start", address: "Bến xe trung tâm Tôn Đức Thắng, Tôn Đức Thắng, Liên Chiểu, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 1", address: "121 Tôn Đức Thắng, Liên Chiểu, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 2", address: "721 Điện Biên Phủ, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 3", address: "599 Điện Biên Phủ, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 4", address: "407 Điện Biên Phủ, Thanh Khê, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 5", address: "311 Điện Biên Phủ, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 6", address: "135 Điện Biên Phủ, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop end", address: "67 Điện Biên Phủ, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 8", address: "130 Điện Biên Phủ, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 9", address: "356 Điện Biên Phủ, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 10", address: "416 Điện Biên Phủ, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 11", address: "570 Điện Biên Phủ, Thanh Khê, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 12", address: "734 Điện Biên Phủ, Đà Nẵng, Việt Nam"
Place.create! title: "Bus Stop 13", address: "122 Tôn Đức Thắng, Đà Nẵng, Việt Nam"

Place.take(13).each_with_index do |place, index|
  Distance.create! busstop_from: place.id , busstop_to: index + 2
end
