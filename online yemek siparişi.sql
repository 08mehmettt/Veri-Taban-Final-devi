
CREATE DATABASE Yemeksiparis;
GO

CREATE TABLE Müþteriler (
    MüþteriID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Telefon NVARCHAR(15),
    Email NVARCHAR(100),
    Adres NVARCHAR(MAX),
    KayýtTarihi DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Restoranlar (
    RestoranID INT IDENTITY(1,1) PRIMARY KEY,
    RestoranAdý NVARCHAR(100),
    Telefon NVARCHAR(15),
    Adres NVARCHAR(MAX),
    Email NVARCHAR(100),
    AçýlýþSaati TIME,
    KapanýþSaati TIME
);
GO


CREATE TABLE Menüler (
    MenuID INT IDENTITY(1,1) PRIMARY KEY,
    RestoranID INT,
    MenuAdý NVARCHAR(100),
    Açýklama NVARCHAR(MAX),
    Fiyat DECIMAL(10, 2),
    StokDurumu BIT DEFAULT 1,
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID)
);
GO


CREATE TABLE Sipariþler (
    SipariþID INT IDENTITY(1,1) PRIMARY KEY,
    MüþteriID INT,
    RestoranID INT,
    SipariþTarihi DATETIME DEFAULT GETDATE(),
    ToplamTutar DECIMAL(10, 2),
    TeslimatDurumu NVARCHAR(50), 
    TeslimatAdresi NVARCHAR(MAX),
    FOREIGN KEY (MüþteriID) REFERENCES Müþteriler(MüþteriID),
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID)
);
GO


CREATE TABLE SipariþDetaylarý (
    SipariþDetayID INT IDENTITY(1,1) PRIMARY KEY,
    SipariþID INT,
    MenuID INT,
    Adet INT,
    BirimFiyat DECIMAL(10, 2),
    FOREIGN KEY (SipariþID) REFERENCES Sipariþler(SipariþID),
    FOREIGN KEY (MenuID) REFERENCES Menüler(MenuID)
);
GO


CREATE TABLE Ödemeler (
    OdemeID INT IDENTITY(1,1) PRIMARY KEY,
    SipariþID INT,
    OdemeTarihi DATETIME DEFAULT GETDATE(),
    OdemeTutari DECIMAL(10, 2),
    OdemeYontemi NVARCHAR(50),
    OdemeDurumu NVARCHAR(50), 
    FOREIGN KEY (SipariþID) REFERENCES Sipariþler(SipariþID)
);
GO


CREATE TABLE Yorumlar (
    YorumID INT IDENTITY(1,1) PRIMARY KEY,
    MüþteriID INT,
    RestoranID INT,
    YorumTarihi DATETIME DEFAULT GETDATE(),
    YorumMetni NVARCHAR(MAX),
    Puan INT,
    FOREIGN KEY (MüþteriID) REFERENCES Müþteriler(MüþteriID),
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID)
);
GO


CREATE TABLE Teslimatlar (
    TeslimatID INT IDENTITY(1,1) PRIMARY KEY,
    SipariþID INT,
    TeslimatTarihi DATETIME DEFAULT GETDATE(),
    TeslimatAdresi NVARCHAR(MAX),
    TeslimatDurumu NVARCHAR(50),
    FOREIGN KEY (SipariþID) REFERENCES Sipariþler(SipariþID)
);
GO


CREATE TABLE RestoranÇalýþanlarý (
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
    ÝndirimOrani DECIMAL(5, 2),
    BaslangicTarihi DATETIME,
    BitisTarihi DATETIME,
    FOREIGN KEY (RestoranID) REFERENCES Restoranlar(RestoranID)
);
GO

