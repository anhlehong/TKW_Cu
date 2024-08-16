CREATE DATABASE BachHoa;
USE BachHoa;

-- Table: category
CREATE TABLE category (
  id INT(11) NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserting data into category
INSERT INTO category (category_name) VALUES
('Thịt'),
('Hải sản'),
('Cá'),
('Rau củ'),
('Gia vị');

-- Table: customers
CREATE TABLE customers (
  id INT(11) NOT NULL AUTO_INCREMENT,
  fullname VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  address VARCHAR(250) DEFAULT NULL,
  phone VARCHAR(15) DEFAULT NULL,
  birthday DATE DEFAULT NULL,
  sex ENUM('male', 'female') DEFAULT 'male',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserting data into customers
INSERT INTO customers (fullname, email, password, address, phone, birthday, sex) VALUES
('Dương Đình Nghĩa', 'nghia15121991@gmail.com', 'hashed_password', 'Thạch Kim, Lộc Hà, Hà Tĩnh', '0927645448', '1991-12-15', 'male'),
('Dương Đình Tài', 'nghia28121995@gmail.com', 'hashed_password', 'Thạch Kim, Lộc Hà, Hà Tĩnh', '0927645448', '1995-12-28', 'male'),
('Dương Thị Xuân', 'nghia14051994@gmail.com', 'hashed_password', 'Mỹ Khánh, Long Xuyên, An Giang', '01678780208', '1994-05-14', 'female'),
('Nguyễn Văn Phước', 'vanphuoc@gmail.com', 'hashed_password', '134/1/15 Cách mạng T8, Phường 10, Quận 3, Tp. Hồ Chí Minh', NULL, NULL, 'male'),
('Nguyễn Ngọc Hà Trân', 'hatran2018@gmail.com', 'hashed_password', '24 Đường số 1, Phường Bình Trị Đông, quận Bình Thạnh, TP.HCM', NULL, NULL, 'female');

-- Table: employees
CREATE TABLE employees (
  id INT(11) NOT NULL AUTO_INCREMENT,
  fullname VARCHAR(100) NOT NULL,
  sex ENUM('male', 'female') DEFAULT NULL,
  birthday DATE DEFAULT NULL,
  address VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserting data into employees
INSERT INTO employees (fullname, sex, birthday, address, email, password) VALUES
('Ta Cong Phi', 'male', '2003-06-01', 'Binh Hung - Binh Chanh - Ho Chi Minh', 'tacongphi1@gmail.com', 'hashed_password'),
('Duong Lam Khang', 'male', '2004-01-06', 'Phuong 5 - Quan 10 - Ho Chi Minh', 'duonglamkhang@gmail.com', 'hashed_password');

-- Table: supplier
CREATE TABLE supplier (
  id INT(11) NOT NULL AUTO_INCREMENT,
  supplier_name VARCHAR(100) NOT NULL,
  supplier_phone VARCHAR(15) NOT NULL,
  supplier_address VARCHAR(200) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserting data into supplier
INSERT INTO supplier (supplier_name, supplier_phone, supplier_address) VALUES
('Công ty TNHH Quốc Tuấn', '0903787904', '8, Trần Văn Quang, Phường 10, Quận Tân Bình, TP.HCM'),
('Công ty TNHH Vinagrico', '02854280009', '32 Đường 14E , KDC Vĩnh Lộc, P.Bình Hưng Hòa, Q.Tân Bình, Tp.HCM'),
('Công ty cổ phần chế biến thực phầm Đà Lạt', '02633679379', 'Thôn Phú Hưng, Xã Phú Hội, Huyện Đức Trọng, tỉnh Lâm Đồng'),
('Công ty xuất khẩu rau Tiền Giang', '02733834616', 'Km1977 Quốc Lộ 1, Xã Long Định, Huyện Châu Thành, Tiền Giang'),
('Công ty TNHH liên doanh Organik Đà Lạt', '02633970586', 'Thôn Đa Thọ, X. Xuân Thọ, Đà Lạt, Lâm Đồng , Việt Nam');
-- Table: products
CREATE TABLE products (
  id INT(11) NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100) NOT NULL,
  picture VARCHAR(100) DEFAULT NULL,
  origin VARCHAR(100) NOT NULL,
  unit_price INT(11) NOT NULL,
  unit VARCHAR(20) NOT NULL,
  stock FLOAT DEFAULT NULL,
  supplier_id INT(11) DEFAULT NULL,
  description TEXT NOT NULL,
  category_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_products_supplier FOREIGN KEY (supplier_id) REFERENCES supplier (id),
  CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES category (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserting data into products
INSERT INTO products (product_name, picture, origin, unit_price, unit, stock, supplier_id, description, category_id) VALUES
('Ba rọi heo', 'Images/Products/ba-roi-heo.jpg', 'Long An', 31800, '300g', 30, 1, 'Ba rọi heo là phần thịt lấy từ bụng lợn, nổi tiếng với lớp mỡ mềm và phần thịt nạc thơm ngon xen kẽ, thường được sử dụng trong các món ăn đa dạng như nướng, kho, hoặc xào. Trong ẩm thực châu Á, ba rọi heo có thể kết hợp tuyệt vời với các loại gia vị như nước mắm, hành tỏi, và ớt để tạo nên các món ăn hấp dẫn như thịt heo kho trứng, thịt ba chỉ cuộn lá lốt nướng, hoặc xào cùng cải thảo và dưa chua. Sự mềm mại của thịt ba rọi khiến nó trở thành lựa chọn lý tưởng cho những ai yêu thích hương vị thịt heo đậm đà và ngậy mỡ.', 1),
('Xương đuôi heo ', 'Images/Products/xuong-duoi-heo.jpg', 'Tiền Giang', 42000, '400g', 20, 1, 'Xương đuôi heo là phần xương ở đuôi của con lợn, nổi tiếng với lượng mỡ và gelatin dồi dào, thường được sử dụng để ninh lấy nước dùng hoặc chế biến các món hầm. Trong ẩm thực châu Á, xương đuôi heo rất phổ biến trong các món soup như soup đuôi heo khoai môn hoặc đuôi heo nấu đậu, với hương vị ngọt tự nhiên của xương kết hợp cùng vị béo ngậy của mỡ tạo nên một món ăn bổ dưỡng và giàu collagen. Ngoài ra, xương đuôi heo cũng có thể được sử dụng để làm các món nướng, nơi chúng được ướp với các loại gia vị đặc trưng và nướng giòn, phục vụ như một món nhậu hấp dẫn.', 1),
('Thịt đùi heo', 'Images/Products/thit-dui-heo.jpg', 'Long An', 56500, '400g', 20, 1, 'Thịt đùi heo là phần thịt lấy từ đùi của con lợn, nổi tiếng với sự mềm mại và ít mỡ, thường được sử dụng trong các món như luộc, nướng, hoặc xào. Trong ẩm thực châu Á, thịt đùi heo có thể được sử dụng để làm thịt heo quay, món thịt đùi nướng sả ớt, hoặc thịt đùi xào với các loại rau củ như cải thảo và cà rốt, tạo nên một bữa ăn đầy đủ và hấp dẫn. Bên cạnh đó, thịt đùi cũng rất phổ biến trong các món hầm như hầm khoai tây, măng tây, mang đến hương vị thịt ngọt đậm đà và làm nổi bật vị ngon của các nguyên liệu khác.', 1),
('Thịt heo xay', 'Images/Products/thit-heo-xay.jpg', 'Long An', 58000, '400g', 14, 1, 'Thịt heo xay là một nguyên liệu linh hoạt trong ẩm thực, thường được sử dụng trong nhiều món ăn khác nhau từ châu Á đến châu Âu. Trong các món ăn châu Á, thịt heo xay thường được dùng để làm nhân cho các loại bánh như bánh bao, bánh cuốn, hoặc chế biến các món như thịt heo xay nấu với cà tím, xào với các loại rau như đậu phụ và măng tây, hoặc làm sườn xào chua ngọt. Sự kết hợp của thịt heo xay với các loại gia vị và rau củ không chỉ mang lại hương vị thơm ngon mà còn cung cấp một bữa ăn giàu dinh dưỡng và cân bằng.', 1),
('Thịt bò xay', 'Images/Products/thit-bo-xay.jpg', 'Đồng Nai', 65000, '250g', 15, 1, 'Thịt bò xay là loại thịt được xay nhỏ từ các phần khác nhau của con bò, đặc biệt phổ biến trong các món ăn cả châu Á lẫn châu Âu. Trong ẩm thực châu Á, thịt bò xay có thể được dùng để chế biến các món như bò xào với hành tây và ớt chuông, làm nhân cho các loại bánh như bánh bao hoặc bánh mì, hoặc kết hợp với các loại rau củ như cà rốt và đậu Hà Lan trong món bò nấu cà ri. Thịt bò xay không chỉ mang lại hàm lượng protein cao mà còn là nguồn cung cấp sắt dồi dào, góp phần tạo nên những bữa ăn bổ dưỡng và đậm đà hương vị.', 1),
('Thịt nạc bò', 'Images/Products/thit-nac-bo.jpg', 'Tiền Giang', 99000, '250g', 5, 1, 'Thịt nạc bò là phần thịt ít mỡ được cắt từ các vùng như thăn ngoại, mông, hoặc vai của con bò, nổi tiếng với độ mềm và ít gân, thích hợp cho nhiều phương pháp chế biến khác nhau. Trong ẩm thực châu Á, thịt nạc bò thường được dùng để làm các món xào nhanh với rau củ như bông cải xanh và cà rốt, hoặc nấu phở và các loại mì bò khác, mang lại hương vị thịt bò ngọt tự nhiên và đậm đà. Sự mềm mại của thịt nạc bò cũng rất thích hợp cho các món nướng hoặc thịt bò cuộn rau củ, tạo nên các món ăn hấp dẫn và giàu chất dinh dưỡng.', 1),
('Thịt nạm bò', 'Images/Products/thit-nam-bo.jpg', 'Đồng Nai', 89000, '250g', 5, 1, 'Thịt nạm bò là phần thịt được lấy từ vùng bụng dưới của con bò, nổi tiếng với vân mỡ đan xen giúp thịt khi nấu có độ ngọt và mềm đặc biệt. Trong ẩm thực châu Á, thịt nạm bò thường được sử dụng trong các món hầm hoặc kho lâu, như kho tiêu hoặc hầm với thuốc bắc, mang lại hương vị đậm đà và sâu lắng. Ngoài ra, thịt nạm bò cũng rất phù hợp để nấu các món soup như phở bò, trong đó sự mềm của thịt kết hợp với nước dùng ngọt từ xương bò tạo nên một món ăn bổ dưỡng và hấp dẫn.', 1),
('Ức gà tươi phi lê', 'Images/Products/uc-ga-tuoi-phi-le.jpg', 'Tây Ninh', 50000, '500g', 13, 1, 'Ức gà tươi phi lê là phần thịt được lấy từ ức gà, không có xương và da, nổi tiếng với độ mềm và ít mỡ, là lựa chọn lý tưởng cho những ai đang theo dõi chế độ ăn uống lành mạnh. Trong ẩm thực châu Á, phi lê ức gà có thể được sử dụng để làm các món nướng, xào, hoặc luộc, kết hợp cùng các loại rau củ như măng tây, nấm, hoặc bí ngòi, mang lại hương vị nhẹ nhàng nhưng vẫn đầy đủ dinh dưỡng. Ngoài ra, phi lê ức gà còn thường xuyên xuất hiện trong các món salad hoặc được cuộn cùng với rau cải và nấm, thích hợp cho các bữa ăn nhanh và dễ chuẩn bị.', 1),
('Đùi tỏi gà', 'Images/Products/dui-toi-ga.jpg', 'Tây Ninh', 35400, '300g', 6, 1, 'Đùi tỏi gà là phần đùi của con gà đã được ướp sẵn với tỏi và các loại gia vị khác, mang lại hương vị đậm đà và hơi cay nồng đặc trưng của tỏi. Trong ẩm thực châu Á, đùi tỏi gà thường được nướng hoặc quay để tận dụng hết mùi thơm và vị ngọt tự nhiên của thịt, phù hợp làm món chính trong các bữa cơm gia đình. Để tăng thêm hương vị, đùi gà tỏi có thể được phục vụ cùng với cơm chiên, rau xào, hoặc dùng chấm cùng nước sốt chua ngọt hoặc tương ớt, tạo nên một bữa ăn hấp dẫn và kích thích vị giác.', 1),
( 'Bạch tuộc', 'Images/Products/bach-tuoc.jpg', 'Khánh Hòa', 285000, '650g', 12, 2, 'Bạch tuộc là loại hải sản được ưa chuộng với thịt chắc và hương vị biển đặc trưng, thường được chế biến theo nhiều cách như luộc, nướng, hoặc xào. Trong ẩm thực châu Á, bạch tuộc thường được sử dụng trong các món như bạch tuộc nướng sa tế, bạch tuộc xào cay, hoặc làm thành các món salad biển tươi mát. Sự mềm mại và ngọt tự nhiên của bạch tuộc khi kết hợp với các loại rau củ và gia vị như dưa leo, ớt, và hành tây không chỉ tăng cường hương vị mà còn giúp bữa ăn trở nên giàu dinh dưỡng và hấp dẫn.', 2),
( 'Thịt ốc móng tay', 'Images/Products/thit-oc-mong-tay.jpg', 'Khánh Hòa', 32250, '250g', 21, 2, 'Thịt ốc móng tay là loại hải sản có vị ngọt tự nhiên và kết cấu giòn sần sật, thường được thu hoạch từ các vùng biển sạch. Trong ẩm thực châu Á, thịt ốc móng tay được sử dụng rộng rãi trong các món như xào chua ngọt, luộc, hoặc làm salad hải sản. Sự pha trộn giữa thịt ốc móng tay với các loại rau củ như cà rốt, đậu phụng, và rau mùi không chỉ làm nổi bật hương vị biển mặn mà của ốc mà còn đem lại một món ăn giàu protein và khoáng chất, tốt cho sức khỏe.', 2),
( 'Tôm thẻ', 'Images/Products/tom-the.jpg', 'Vĩnh Long', 39600, '200', 35, 2, 'Tôm thẻ là loại tôm nước ngọt phổ biến, có kích thước nhỏ và thịt chắc, thường được dùng trong các món ăn như lẩu, nướng, hoặc xào. Trong ẩm thực châu Á, tôm thẻ thường xuất hiện trong các món như tôm xào sả ớt, tôm nấu canh chua, hoặc lẩu tôm thẻ cùng với rau muống và dứa, tạo nên hương vị hấp dẫn và đậm đà. Sự kết hợp giữa thịt tôm ngọt tự nhiên và các loại rau củ tươi tăng cường hương vị của món ăn, đồng thời cung cấp nguồn dinh dưỡng dồi dào và cân bằng cho bữa ăn.', 2),
( 'Sò huyết', 'Images/Products/so-huyet.jpg', 'Bình Thuận', 113000, '500g', 12, 2, 'Sò huyết là loại hải sản có màu đỏ đặc trưng, thịt ngọt và chắc, rất phổ biến trong các món ăn ven biển ở châu Á. Thường được chế biến thành các món như nướng mỡ hành, xào tỏi, hoặc làm súp, sò huyết mang đến hương vị biển mặn mà và đậm đà. Sự kết hợp của sò huyết với các loại rau thơm như rau răm, hành lá và các gia vị như ớt, sả không chỉ tăng cường hương vị cho món ăn mà còn giúp tăng cường sự hấp dẫn và bổ dưỡng, phù hợp với khẩu vị yêu thích hải sản của nhiều người.', 2),
( 'Mực nang', 'Images/Products/muc-nang.jpg', 'Bình Thuận', 259000, '1Kg', 11, 2, 'Mực nang là loại mực có kích thước lớn, thịt dày và chắc, được đánh giá cao vì độ ngon của thịt và khả năng chế biến đa dạng. Trong ẩm thực châu Á, mực nang thường được sử dụng để làm các món như mực nướng, mực xào chua ngọt, hoặc mực nhồi thịt, với hương vị đậm đà và hấp dẫn. Kết hợp mực nang với các loại gia vị như nước mắm, tỏi, ớt và các loại rau củ như hành tây, ớt chuông không chỉ tôn vinh hương vị tươi ngon của mực mà còn tạo ra một món ăn giàu protein, khoáng chất, phù hợp với bữa ăn gia đình hoặc tiệc tùng.', 2),
( 'Hàu sữa', 'Images/Products/hau-sua.jpg', 'Tiền Giang', 78000, '300g', 10, 2, 'Hàu sữa là loại hàu có kích thước nhỏ, thịt mềm và ngọt, thường được thu hoạch ở các vùng biển sạch. Trong ẩm thực châu Á, hàu sữa có thể được chế biến theo nhiều cách như nướng mỡ hành, xào với các loại rau cải hoặc làm súp. Hương vị ngọt tự nhiên và kết cấu mịn màng của hàu sữa làm cho chúng trở thành nguyên liệu lý tưởng để kết hợp cùng với tỏi, gừng và ớt, tạo nên các món ăn thơm ngon, giàu dinh dưỡng và kích thích vị giác, đặc biệt phù hợp cho các bữa tiệc hải sản hoặc bữa ăn tối tinh tế.', 2),
( 'Cá kèo', 'Images/Products/ca-keo.jpg', 'Bạc Liêu', 255000, '500g', 10, 3, 'Cá kèo là loại cá nước ngọt nhỏ, thân dài và mảnh, được đánh giá cao trong ẩm thực Việt Nam vì vị ngọt tự nhiên của thịt. Trong các món ăn châu Á, cá kèo thường được nướng trên than hoa hoặc chiên giòn, thường kèm với nước mắm pha chua ngọt để chấm, hoặc dùng làm nguyên liệu chính trong món lẩu cá kèo, một món ăn phổ biến ở miền Tây Nam Bộ. Sự kết hợp của cá kèo với các loại rau sống như rau đắng, bắp chuối và các loại gia vị như tía tô, ớt mang lại hương vị tươi mát và đặc trưng, tạo nên những bữa ăn hấp dẫn và đậm đà bản sắc vùng miền.', 3),
( 'Cá cơm', 'Images/Products/ca-com.jpg', 'Đà Nẵng', 53000, '500g', 12, 3, 'Cá cơm là loại cá nhỏ, thường được thu hoạch từ biển, có thịt chắc và vị ngọt tự nhiên, rất phổ biến trong các món ăn châu Á. Cá cơm thường được sử dụng để làm mắm, chiên giòn, hoặc phơi khô để làm cá khô. Trong ẩm thực, cá cơm chiên giòn thường được dùng làm món nhậu hoặc kết hợp với cơm trắng và canh chua tạo nên bữa ăn đơn giản mà ngon miệng. Cá cơm cũng được dùng để làm nộm với xoài xanh, rau răm và lạc rang, mang lại hương vị hấp dẫn với sự pha trộn giữa vị ngọt của cá và vị chua ngọt của nước trộn, phù hợp cho các bữa ăn mùa hè.', 3),
( 'Cá chốt', 'Images/Products/ca-chot.jpg', 'Hồ Chí Minh', 65000, '500g', 5, 3, 'Cá chốt là một loại cá nước ngọt nhỏ, thường được tìm thấy ở các sông ngòi và ao hồ ở châu Á, đặc biệt là Việt Nam. Cá chốt có thịt trắng, mềm và hương vị ngọt nhẹ, thường được dùng để nấu canh chua hoặc chiên giòn. Trong ẩm thực, cá chốt chiên giòn là món ăn được yêu thích, phù hợp để ăn kèm với cơm nóng và nước mắm pha chua ngọt, hoặc dùng để nấu canh chua với dứa, cà chua, và rau ngổ, mang lại vị thanh mát, rất thích hợp trong những ngày hè oi bức. Cá chốt cũng có thể được dùng để làm các món kho tộ, kết hợp với thịt ba chỉ để tăng thêm độ ngọt và hương vị đậm đà cho món ăn.', 3),
( 'Cá bóp', 'Images/Products/ca-bop.jpg', 'Bà Rịa', 185000, '500g', 10, 3, 'Cá bóp là loại cá biển có thịt trắng, mềm và ngọt, được đánh giá cao trong ẩm thực châu Á, đặc biệt là tại Việt Nam. Cá bóp thường được chế biến thành các món như nướng muối ớt, hấp gừng, hoặc làm sashimi, nhấn mạnh đến vị tươi ngon và mềm mại của thịt cá. Cá bóp nướng muối ớt là món được ưa chuộng với lớp vỏ ngoài giòn rụm và thịt bên trong mềm ngọt, phù hợp để thưởng thức trong các bữa ăn gia đình hoặc tiệc ngoài trời. Món cá bóp hấp gừng với gừng và hành tươi không chỉ giúp giảm mùi tanh của cá mà còn tăng cường hương vị ngọt tự nhiên, mang lại một món ăn thanh đạm và giàu dinh dưỡng.', 3),
( 'Cá basa', 'Images/Products/ca-basa.jpg', 'Khánh Hòa', 27250, '250g', 20, 3, 'Cá Basa là loại cá nước ngọt, phổ biến trong các sông ở Việt Nam, nổi tiếng với thịt trắng, mềm và có vị ngọt nhẹ. Cá này thường được chế biến theo nhiều cách khác nhau như chiên giòn, nấu canh chua, hoặc làm cá lóc kho tộ. Cá Basa chiên giòn là món ăn yêu thích trong các bữa cơm gia đình, hoàn hảo khi ăn kèm với nước mắm pha chua ngọt và rau sống. Trong các món canh, cá Basa thường được kết hợp với cà chua, dứa và các loại rau thơm như ngò gai và rau ngổ, tạo nên món canh chua thơm ngon, thanh mát, rất phù hợp cho bữa cơm mùa hè.', 3),
( 'Cá nục', 'Images/Products/ca-nuc.jpg', 'Tiền Giang', 23400, '300g', 10, 3, 'Cá nục là loại cá biển nhỏ, có thịt trắng, chắc và vị đậm đà, rất phổ biến trong ẩm thực Việt Nam và các nước châu Á khác. Cá nục thường được chế biến thành các món như cá nục kho thơm, cá nục chiên giòn, hoặc làm món cá nục sốt cà chua. Cá nục kho thơm là món ăn truyền thống, hương vị thơm ngon, ngọt từ thơm (dứa) và vị đậm đà từ nước mắm, phù hợp với khẩu vị của nhiều gia đình Việt. Cá nục chiên giòn thường được thưởng thức với cơm nóng và nước mắm pha tỏi ớt, mang lại cảm giác giòn rụm và hấp dẫn. Món cá nục sốt cà chua, với vị chua ngọt của cà chua và hương thơm của hành, tỏi, là sự lựa chọn tuyệt vời cho bữa cơm chiều.', 3),
( 'Cá bạc má', 'Images/Products/ca-bac-ma.jpg', 'Bà Rịa', 39000, '500g', 13, 3, 'Cá bạc má là loại cá nước ngọt có thịt trắng, mềm và ít xương, được ưa chuộng trong ẩm thực của nhiều quốc gia châu Á. Thịt cá bạc má ngọt và mềm, thường được chế biến thành các món như cá bạc má kho tiêu, cá bạc má chiên giòn, hoặc nấu canh chua. Cá bạc má kho tiêu là món ăn truyền thống, hương vị thơm ngon, đậm đà với vị cay nhẹ của tiêu, thường được ăn kèm cơm nóng. Cá bạc má chiên giòn phù hợp làm món khai vị hoặc món nhậu, thường được chấm cùng nước mắm pha chua ngọt hoặc tương ớt. Canh chua cá bạc má, với sự kết hợp của me, cà chua, và dứa, cùng với các loại rau như bạc hà và ngò gai, tạo nên một món ăn thanh mát, phù hợp cho những ngày hè nóng bức.', 3),
( 'Cá chim nước ngọt', 'Images/Products/ca-chim-nuoc-ngot.jpg', 'Long An', 30000, '600g', 15, 3, 'Cá chim nước ngọt là loại cá có thân dài và hình dáng giống như chim, thịt trắng, chắc và ít xương, được đánh giá cao trong ẩm thực châu Á. Thịt cá chim có vị ngọt tự nhiên và kết cấu mềm mại, thường được chế biến thành các món như cá chim kho tộ, cá chim chiên giòn, hoặc nấu canh chua. Cá chim kho tộ mang hương vị thơm ngon, đậm đà nhờ sự kết hợp của nước mắm, đường, và các loại gia vị truyền thống khác, tạo nên một món ăn kích thích vị giác, phù hợp để thưởng thức cùng cơm nóng. Cá chim chiên giòn thường được thưởng thức với nước chấm pha chua ngọt hoặc tương ớt, trong khi cá chim nấu canh chua với cà chua, dứa và các loại rau thơm như ngò gai và rau om sẽ mang lại một món ăn thanh mát, lý tưởng cho bữa cơm mùa hè.', 3),
( 'Rau muống', 'Images/Products/rau-muong.jpg', 'Đà Lạt', 10000, 'bó', 20, 4, 'Rau muống là một loại rau xanh rất phổ biến ở châu Á, đặc biệt là Việt Nam, với những cọng xanh mượt và lá dày, mang lại cảm giác giòn sật khi ăn. Rau muống thường được xào nhanh với tỏi hoặc nước mắm để giữ nguyên độ giòn và hương vị tươi ngon. Ngoài ra, rau muống cũng có thể được dùng trong các món lẩu hoặc như một phần của món nộm, kết hợp cùng tôm, thịt bò, hoặc đậu phụ, mang lại một món ăn giàu dinh dưỡng và thích hợp cho những ai yêu thích lối sống lành mạnh. Sự đơn giản trong chế biến nhưng hương vị phong phú của rau muống làm cho nó trở thành một sự lựa chọn tuyệt vời trong bữa ăn hàng ngày.', 4),
( 'Cải ngọt', 'Images/Products/cai-ngot.jpg', 'Đà Lạt', 10000, 'bó', 32, 4, 'Cải ngọt là loại rau lá xanh nhạt, mềm và có vị ngọt nhẹ, rất phổ biến trong ẩm thực châu Á, đặc biệt là trong các món ăn của Việt Nam và Trung Quốc. Cải ngọt thường được xào nhanh với tỏi hoặc nấu trong các món canh để giữ được độ giòn và hương vị thơm ngon tự nhiên. Ngoài ra, cải ngọt cũng có thể kết hợp tuyệt vời với thịt heo xay hoặc tôm trong các món như cuốn chả giò hoặc làm nhân bánh bao, cung cấp nguồn dinh dưỡng phong phú gồm vitamin A, vitamin C và các khoáng chất thiết yếu. Món canh cải ngọt nấu với xương heo hay cá là một lựa chọn tuyệt vời cho bữa cơm gia đình, mang lại cảm giác nhẹ nhàng và dễ chịu.', 4),
( 'Khoai lang', 'Images/Products/khoai-lang.jpg', 'Đà Lạt', 20000, '500g', 20, 4, 'Khoai lang là loại củ nhiều tinh bột, có nguồn gốc từ Mỹ Latinh nhưng đã trở nên phổ biến khắp châu Á. Khoai lang có thể có màu cam, tím hoặc trắng, với vị ngọt tự nhiên và kết cấu mềm khi nấu chín. Trong ẩm thực châu Á, khoai lang thường được sử dụng để nướng, luộc, hoặc làm thành bánh, cung cấp nguồn năng lượng dồi dào và giàu chất xơ. Khoai lang nướng với lớp vỏ giòn và phần thịt bên trong mềm ngọt là món ăn phổ biến trong những ngày lạnh, trong khi khoai lang luộc có thể ăn kèm với đường hoặc sữa đặc để làm món tráng miệng đơn giản. Khoai lang cũng là thành phần chính trong nhiều loại bánh truyền thống châu Á, như bánh khoai lang nướng hoặc bánh khoai tím, mang lại hương vị thơm ngon và hấp dẫn.', 4),
( 'Rau má', 'Images/Products/rau-ma.jpg', 'Đà Lạt', 12000, '200g', 10, 4, 'Rau má là loại thảo mộc nổi tiếng với khả năng làm mát cơ thể và nhiều lợi ích sức khỏe khác, được sử dụng rộng rãi trong ẩm thực và y học truyền thống châu Á. Rau má thường được dùng để nấu canh, làm nước ép, hoặc thêm vào các món salad để tận dụng hương vị nhẹ nhàng và tác dụng thanh nhiệt, giải độc. Nước ép rau má là thức uống giải khát phổ biến vào mùa hè, giúp làm dịu cơ thể và tăng cường sức khỏe tổng thể. Trong các món ăn, rau má có thể kết hợp với các loại thực phẩm khác như tôm hoặc thịt gà trong món salad hoặc canh, mang lại một món ăn tươi mát và bổ dưỡng, phù hợp với mọi lứa tuổi.', 4),
( 'Hành lá', 'Images/Products/hanh-la.jpg', 'Đà Lạt', 8000, '100g', 10, 4, 'Hành lá là một loại rau gia vị được yêu thích trong ẩm thực châu Á, có thể được sử dụng tươi hoặc nấu chín. Với mùi thơm nồng và vị ngọt nhẹ, hành lá thường được thêm vào cuối quá trình nấu để tăng hương vị cho món ăn. Trong ẩm thực, hành lá được sử dụng rộng rãi trong các món như phở, bánh xèo, hoặc làm món xào cùng với thịt bò, hải sản. Hành lá không chỉ tăng cường hương vị mà còn mang lại màu sắc bắt mắt cho món ăn. Ngoài ra, hành lá cũng có thể được dùng để trang trí và làm salad, mang đến một chút giòn giòn, tươi mới cho mỗi dĩa ăn.', 4),
( 'Rau răm', 'Images/Products/rau-ram.jpg', 'Đà Lạt', 5000, '50g', 10, 4, 'Rau răm là một loại rau thơm có mùi vị đặc trưng, hơi cay và thường được dùng trong các món ăn châu Á, đặc biệt là trong ẩm thực Việt Nam. Rau răm không chỉ thêm hương vị sâu sắc cho món ăn mà còn được biết đến với các lợi ích sức khỏe như kích thích tiêu hóa và làm mát cơ thể. Trong ẩm thực, rau răm thường được dùng để ăn sống trong các món gỏi, lẩu hoặc như một phần của các món ăn cuốn như bánh xèo và nem rán, tạo nên hương vị tươi mát và phong phú. Rau răm cũng có thể được sử dụng để chế biến món chả cá, nơi nó được trộn chung với thịt cá và các loại gia vị khác, làm tăng hương vị và độ hấp dẫn của món ăn.', 4),
( 'Tía tô', 'Images/Products/tia-to.jpg', 'Đà Lạt', 6900, '100g', 10, 4, 'Tía tô là loại lá có màu tím đặc trưng, được sử dụng phổ biến trong ẩm thực châu Á, đặc biệt là trong các món ăn Việt Nam. Tía tô có hương vị hơi cay và thơm, thường được dùng làm gia vị hoặc ăn sống trong các món salad, cuốn, và nhất là trong món bún chả. Lá tía tô không chỉ làm tăng hương vị cho các món ăn mà còn có tác dụng làm mát và hỗ trợ tiêu hóa. Ngoài ra, tía tô cũng thường xuyên được dùng để ướp thịt trong các món nướng, mang lại mùi thơm đặc biệt và làm phong phú thêm hương vị của thực phẩm. Sự kết hợp của tía tô với thịt nướng hoặc trong món salad với rau sống và đậu phụ là cách thưởng thức phổ biến, làm nổi bật tính chất đặc trưng của loại lá này.', 4),
( 'Rau dền', 'Images/Products/rau-den.jpg', 'Đà Lạt', 10000, '400g', 10, 4, 'Rau dền là một loại rau lá xanh thẫm, thường được trồng ở các khu vực nhiệt đới và cận nhiệt đới, đặc biệt là trong ẩm thực châu Á. Rau dền có hương vị nhẹ và hơi chát, thường được sử dụng trong các món canh hoặc xào. Trong ẩm thực Việt Nam, rau dền thường được nấu cùng với tôm hoặc cá để làm món canh chua, mang lại màu sắc bắt mắt và hương vị dịu nhẹ cho món ăn. Ngoài ra, rau dền còn có thể xào nhanh với tỏi hoặc trứng, tạo nên một món ăn giàu dinh dưỡng, cung cấp nhiều vitamin và khoáng chất thiết yếu. Sự đa dạng trong cách chế biến của rau dền làm cho nó trở thành một phần không thể thiếu trong bữa ăn hàng ngày của nhiều gia đình châu Á.', 4),
( 'Dưa chuột', 'Images/Products/dua-chuot.jpg', 'Đà Lạt', 7500, '500g', 10, 4, 'Dưa chuột là loại quả có vỏ màu xanh và thịt bên trong màu trắng, được sử dụng rộng rãi trên toàn thế giới vì độ giòn và vị mát của nó. Trong ẩm thực châu Á, dưa chuột thường được dùng làm nguyên liệu trong các món salad, đồ chua, hoặc làm món ăn kèm cho các món nướng để giảm bớt cảm giác ngấy. Dưa chuột không chỉ tốt cho sức khỏe với hàm lượng nước cao và giàu vitamin như vitamin K, mà còn mang lại cảm giác tươi mát cho món ăn. Nó thường được dùng trong món gỏi hoặc cuốn với thịt và rau sống, tạo nên món ăn nhẹ nhàng nhưng đầy đủ hương vị, phù hợp cho những bữa ăn mùa hè hoặc làm món khai vị trong các bữa tiệc.', 4),
( 'Rau diếp cá', 'Images/Products/rau-diep-ca.jpg', 'Đà Lạt', 6900, '100g', 10, 4, 'Rau diếp cá là một loại rau thơm đặc trưng trong ẩm thực châu Á, nổi tiếng với mùi hương nồng và vị hơi đắng. Rau diếp cá thường được sử dụng làm gia vị tươi trong các món salad, hoặc thêm vào các món canh để tăng hương vị độc đáo. Rau này cũng được dùng phổ biến trong các món nước chấm hoặc ăn kèm với các món cuốn tươi như gỏi cuốn, làm tăng hương vị và thêm một chút hương thơm đặc trưng cho món ăn. Rau diếp cá không chỉ mang lại sự tươi mát cho bữa ăn mà còn được biết đến với các lợi ích sức khỏe như hỗ trợ tiêu hóa và có tính kháng khuẩn tự nhiên.', 4),
( 'Măng tây', 'Images/Products/mang-tay.jpg', 'Đà Lạt', 30000, '200g', 13, 4, 'Măng tây là một loại rau có nguồn gốc từ châu Âu nhưng đã trở nên phổ biến khắp thế giới, bao gồm cả trong ẩm thực châu Á. Măng tây có thân dài và mảnh với màu sắc từ xanh đến trắng và tím, được đánh giá cao về mặt dinh dưỡng với nhiều vitamin và khoáng chất. Trong ẩm thực, măng tây thường được chế biến bằng cách luộc, nướng, hoặc xào nhanh cùng tỏi và dầu ô liu để giữ nguyên hương vị tinh tế và kết cấu giòn. Măng tây cũng có thể kết hợp với các loại thịt như thịt bò hoặc tôm trong các món cuốn hoặc salad, mang lại sự tươi mới và hấp dẫn cho bữa ăn, đồng thời cung cấp nhiều lợi ích sức khỏe nhờ hàm lượng cao chất xơ và chất chống oxy hóa.', 4),
( 'Hành tây', 'Images/Products/hanh-tay.jpg', 'Đà Lạt', 17500, '500g', 15, 5, 'Hành tây là một trong những nguyên liệu cơ bản nhất trong nhiều nền ẩm thực khắp thế giới, bao gồm cả châu Á. Hành tây có vỏ ngoài khô và củ bên trong mọng nước, mang lại hương vị sắc nét khi sống và ngọt dịu khi nấu chín. Trong ẩm thực, hành tây thường được dùng để xào, kho, nấu canh, hoặc làm thành phần trong các món salad. Hành tây không chỉ làm tăng hương vị cho món ăn mà còn có tác dụng tốt cho sức khỏe nhờ chứa nhiều chất chống oxy hóa và hợp chất lưu huỳnh. Chúng cũng rất linh hoạt trong việc kết hợp với nhiều loại thực phẩm khác như thịt, cá, và các loại rau khác, mang lại sự phong phú cho mỗi món ăn.', 5),
( 'Hành tím', 'Images/Products/hanh-tim.jpg', 'Lý Sơn', 21600, '200g', 20, 5, 'Hành tím Lý Sơn là một loại hành đặc sản nổi tiếng của đảo Lý Sơn, Việt Nam, được biết đến với hương vị thơm ngon, ngọt và ít cay hơn so với các loại hành tím khác. Hành tím Lý Sơn có kích thước nhỏ, vỏ mỏng, màu tím sẫm, và thường được dùng để ướp thịt, làm gia vị cho các món xào, hoặc làm dưa hành. Hành tím Lý Sơn cũng là một thành phần không thể thiếu trong các món dân dã của Việt Nam như bánh mì, phở, và bún bò Huế, mang lại hương vị đậm đà và kích thích vị giác. Sự độc đáo của hành tím Lý Sơn còn nằm ở việc nó được trồng trên đất núi lửa giàu khoáng chất, góp phần làm nên mùi vị đặc trưng khó lẫn của loại hành này.', 5),
( 'Củ tỏi', 'Images/Products/cu-toi.jpg', 'Lý Sơn', 35000, '200g', 32, 5, 'Tỏi Lý Sơn là một loại tỏi nổi tiếng của Việt Nam, được trồng trên đảo Lý Sơn, nơi có điều kiện đất đai và khí hậu đặc biệt thuận lợi cho việc phát triển của cây tỏi. Tỏi Lý Sơn có hương vị cay nồng đặc trưng, mạnh mẽ hơn so với các loại tỏi khác, củ nhỏ nhưng chất lượng cao với tép dày và khô. Trong ẩm thực, tỏi Lý Sơn thường được sử dụng để ướp thịt, làm gia vị cho các món xào, hoặc làm thành phần trong các món nước chấm, giúp tăng hương vị và kích thích vị giác. Ngoài ra, tỏi Lý Sơn còn được biết đến với các lợi ích sức khỏe như khả năng chống oxy hóa và hỗ trợ hệ miễn dịch. Sự đặc biệt của tỏi Lý Sơn không chỉ nằm ở hương vị mà còn ở giá trị dinh dưỡng và y học mà nó mang lại.', 5),
( 'Ớt hiểm ', 'Images/Products/ot-hiem.jpg', 'Đà Lạt', 6800, '50g', 10, 5, 'Ớt là một trong những gia vị phổ biến nhất trên thế giới, nổi tiếng với hương vị cay nồng và sự đa dạng về loại và mức độ cay. Trong ẩm thực châu Á, ớt được sử dụng rộng rãi trong các món ăn từ Thái Lan đến Ấn Độ, từ Việt Nam đến Hàn Quốc, để tăng thêm hương vị và màu sắc cho món ăn. Ớt không chỉ được dùng để chế biến các món xào, sốt, và canh mà còn là thành phần không thể thiếu trong các loại nước chấm và gia vị. Ngoài hương vị, ớt còn chứa capsaicin, một hợp chất có tác dụng chống viêm, giảm đau, và hỗ trợ sức khỏe tim mạch. Ớt có thể được dùng tươi, khô, hay bột, và mỗi loại mang lại một trải nghiệm hương vị riêng biệt, phù hợp với khẩu vị và mục đích sử dụng khác nhau trong ẩm thực.', 5),
( 'Sả', 'Images/Products/sa.jpg', 'Đà Lạt', 7600, '200g', 10, 5, 'Sả, hay còn gọi là cỏ chanh, là một loại cây thảo có nguồn gốc từ châu Á, nổi tiếng với hương thơm mát và hơi cay. Sả thường được sử dụng trong ẩm thực Đông Nam Á như là một gia vị quan trọng, thường xuất hiện trong các món cà ri, món xào, và các loại nước dùng. Bóng mượt và dài, sả được cắt nhỏ và đập dập để giải phóng hương vị khi nấu, làm nền cho nhiều món ăn như gà xào sả ớt, bò lúc lắc, hoặc làm phần nước sốt chấm. Ngoài ra, sả còn được dùng để tạo hương trong các loại trà và nước giải khát, mang lại cảm giác sảng khoái, đồng thời có tính năng kháng khuẩn và giảm căng thẳng.', 5);


-- Table: orders
CREATE TABLE orders (
  id INT(11) NOT NULL AUTO_INCREMENT,
  order_date DATE NOT NULL,
  total INT(11) NOT NULL,
  customer_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserting data into orders
INSERT INTO orders (order_date, total, customer_id) VALUES
('2018-05-12', 120, 2),
('2018-05-11', 250, 3),
('2018-05-11', 75, 1),
('2018-05-11', 180, 4);

-- Table: order_details
CREATE TABLE order_details (
  order_id INT(11) NOT NULL,
  product_id INT(11) NOT NULL,
  quantity INT(11) NOT NULL DEFAULT 1,
  price INT(11) NOT NULL,
  total_amount INT(11) AS (quantity * price) STORED,
  PRIMARY KEY (order_id, product_id),
  CONSTRAINT fk_order_details_order FOREIGN KEY (order_id) REFERENCES orders (id),
  CONSTRAINT fk_order_details_product FOREIGN KEY (product_id) REFERENCES products (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Inserting data into order_details
INSERT INTO order_details (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 31800),
(2, 3, 1, 56500),
(3, 2, 3, 42000),
(4, 4, 1, 58000);

COMMIT;
