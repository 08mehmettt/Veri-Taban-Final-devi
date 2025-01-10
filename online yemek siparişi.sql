
CREATE DATABASE Yemeksiparis;
GO

CREATE TABLE M��teriler (
    M��teriID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Telefon NVARCHAR(15),
    Email NVARCHAR(100),
    Adres NVARCHAR(MAX),
    Kay�tTarihi DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Restoranlar (
    RestoranID INT IDENTITY(1,1) PRIMARY KEY,
    RestoranAd� NVARCHAR(100),
    Telefon NVARCHAR(15),
    Adres NVARCHAR(MAX),
    Email NVARCHAR(100),
    A��l��Saati TIME,
    Kapan��Saati TIME
);
GO


CREATE TABLE Men�ler (
    MenuID INT IDENTITY(1,1) PRIMARY KEY,
    RestoranID INT,
    MenuAd� NVARCHAR(100),
    A��klama NVARCHAR(MAX),
    Fiyat DECIMAL(10, 2),
    StokDurumu BIT DEFAULT 1,
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID)
);
GO


CREATE TABLE Sipari�ler (
    Sipari�ID INT IDENTITY(1,1) PRIMARY KEY,
    M��teriID INT,
    RestoranID INT,
    Sipari�Tarihi DATETIME DEFAULT GETDATE(),
    ToplamTutar DECIMAL(10, 2),
    TeslimatDurumu NVARCHAR(50), 
    TeslimatAdresi NVARCHAR(MAX),
    FOREIGN KEY (M��teriID) REFERENCES M��teriler(M��teriID),
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID)
);
GO


CREATE TABLE Sipari�Detaylar� (
    Sipari�DetayID INT IDENTITY(1,1) PRIMARY KEY,
    Sipari�ID INT,
    MenuID INT,
    Adet INT,
    BirimFiyat DECIMAL(10, 2),
    FOREIGN KEY (Sipari�ID) REFERENCES Sipari�ler(Sipari�ID),
    FOREIGN KEY (MenuID) REFERENCES Men�ler(MenuID)
);
GO


CREATE TABLE �demeler (
    OdemeID INT IDENTITY(1,1) PRIMARY KEY,
    Sipari�ID INT,
    OdemeTarihi DATETIME DEFAULT GETDATE(),
    OdemeTutari DECIMAL(10, 2),
    OdemeYontemi NVARCHAR(50),
    OdemeDurumu NVARCHAR(50), 
    FOREIGN KEY (Sipari�ID) REFERENCES Sipari�ler(Sipari�ID)
);
GO


CREATE TABLE Yorumlar (
    YorumID INT IDENTITY(1,1) PRIMARY KEY,
    M��teriID INT,
    RestoranID INT,
    YorumTarihi DATETIME DEFAULT GETDATE(),
    YorumMetni NVARCHAR(MAX),
    Puan INT,
    FOREIGN KEY (M��teriID) REFERENCES M��teriler(M��teriID),
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID)
);
GO


CREATE TABLE Teslimatlar (
    TeslimatID INT IDENTITY(1,1) PRIMARY KEY,
    Sipari�ID INT,
    TeslimatTarihi DATETIME DEFAULT GETDATE(),
    TeslimatAdresi NVARCHAR(MAX),
    TeslimatDurumu NVARCHAR(50),
    FOREIGN KEY (Sipari�ID) REFERENCES Sipari�ler(Sipari�ID)
);
GO


CREATE TABLE Restoran�al��anlar� (
    CalisanID INT IDENTITY(1,1) PRIMARY KEY,
    RestoranID INT,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Pozisyon NVARCHAR(50), 
    Telefon NVARCHAR(15),
    Email NVARCHAR(100),
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID)
);
GO


CREATE TABLE Promosyonlar (
    PromosyonID INT IDENTITY(1,1) PRIMARY KEY,
    RestoranID INT,
    PromosyonKodu NVARCHAR(50),
    �ndirimOrani DECIMAL(5, 2),
    BaslangicTarihi DATETIME,
    BitisTarihi DATETIME,
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID)
);
GO

