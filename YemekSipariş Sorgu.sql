use YemekSiparisi;



UPDATE Müþteriler
SET Adres = 'Yeni Adres Örneði, Ýstanbul'
WHERE MüþteriID = 1;


UPDATE Restoranlar
SET AçýlýþSaati = '09:00'
WHERE RestoranID = 2;


UPDATE Menüler
SET Fiyat = 45.99
WHERE MenuID = 3;


DELETE FROM Müþteriler
WHERE MüþteriID = 5;


DELETE FROM Restoranlar
WHERE RestoranID = 2;


DELETE FROM SipariþDetaylarý
WHERE SipariþDetayID = 7;




SELECT * FROM Restoranlar;


SELECT m.Ad, m.Soyad, s.ToplamTutar
FROM Müþteriler m
JOIN Sipariþler s ON m.MüþteriID = s.MüþteriID;


SELECT RestoranAdý, MenuAdý, Açýklama
FROM Restoranlar r
JOIN Menüler m ON r.RestoranID = m.RestoranID;




INSERT INTO Müþteriler (Ad, Soyad, Telefon, Email, Adres)
VALUES ('Mehmet', 'Ýbiþ', '05551234567', 'mehmetibis@email.com', 'Ýstanbul');


INSERT INTO Restoranlar (RestoranAdý, Telefon, Adres, Email, AçýlýþSaati, KapanýþSaati)
VALUES ('Nevada', '02161234567', 'Fatih, Ýstanbul', 'nevada@email.com', '15:00', '22:00');


INSERT INTO Sipariþler (MüþteriID, RestoranID, ToplamTutar, TeslimatDurumu, TeslimatAdresi)
VALUES (1, 2, 125.50, 'Hazýrlanýyor', 'Bakýrköy, Ýstanbul');
