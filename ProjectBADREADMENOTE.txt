Berikut adalah daftar yang ditambah, diubah, dan dihapus dari class diagram
penambahan :
table City : City_Name varchar(50)
table Store : Store_Name varchar(50)
karena belum ada field untuk menyimpan data city_name untuk table city dan store_name untuk table store

yg dihapus :
table Staff : PaymentID
karena relasi table staff dengan table payment adalah 1 to many, jadi table staff tidak perlu foreign key paymentID

yg dirubah :
table Film : 
- FULLTEXT varchar(255) => FULLTEXT(Title, Description)
karena perintah fulltext digunakan untuk pencarian text
- Description varchar(255) => Description text
karena description biasanya membutuhkan karakter yang lebih banyak
table film_category :
- FileID => FilmID
agar penamaannya sesuai