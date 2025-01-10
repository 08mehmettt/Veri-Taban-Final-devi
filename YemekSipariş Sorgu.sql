use YemekSiparisi;



UPDATE M��teriler
SET Adres = 'Yeni Adres �rne�i, �stanbul'
WHERE M��teriID = 1;


UPDATE Restoranlar
SET A��l��Saati = '09:00'
WHERE RestoranID = 2;


UPDATE Men�ler
SET Fiyat = 45.99
WHERE MenuID = 3;


DELETE FROM M��teriler
WHERE M��teriID = 5;


DELETE FROM Restoranlar
WHERE RestoranID = 2;


DELETE FROM Sipari�Detaylar�
WHERE Sipari�DetayID = 7;




SELECT * FROM Restoranlar;


SELECT m.Ad, m.Soyad, s.ToplamTutar
FROM M��teriler m
JOIN Sipari�ler s ON m.M��teriID = s.M��teriID;


SELECT RestoranAd�, MenuAd�, A��klama
FROM Restoranlar r
JOIN Men�ler m ON r.RestoranID = m.RestoranID;




INSERT INTO M��teriler (Ad, Soyad, Telefon, Email, Adres)
VALUES ('Mehmet', '�bi�', '05551234567', 'mehmetibis@email.com', '�stanbul');


INSERT INTO Restoranlar (RestoranAd�, Telefon, Adres, Email, A��l��Saati, Kapan��Saati)
VALUES ('Nevada', '02161234567', 'Fatih, �stanbul', 'nevada@email.com', '15:00', '22:00');


INSERT INTO Sipari�ler (M��teriID, RestoranID, ToplamTutar, TeslimatDurumu, TeslimatAdresi)
VALUES (1, 2, 125.50, 'Haz�rlan�yor', 'Bak�rk�y, �stanbul');
