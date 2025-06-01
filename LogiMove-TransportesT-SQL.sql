--Tabela de Motoristas (Drivers):
CREATE TABLE Drivers ( DriverID INT IDENTITY(1,1) PRIMARY KEY, Nome VARCHAR(100) NOT NULL, CNH VARCHAR(20) NOT NULL, Endereço VARCHAR(200), Contato VARCHAR(50) );
GO

--Tabela de Clientes (Clients):
CREATE TABLE Clients ( ClientID INT IDENTITY(1,1) PRIMARY KEY, Nome VARCHAR(100) NOT NULL, Empresa VARCHAR(100), Endereço VARCHAR(200), Contato VARCHAR(50) );
GO

--Tabela de Pedidos (Orders):
CREATE TABLE Orders ( OrderID INT IDENTITY(1,1) PRIMARY KEY, ClientID INT NOT NULL, DriverID INT NOT NULL, DetalhesPedido TEXT, DataEntrega DATE, Status VARCHAR(50), FOREIGN KEY (ClientID) REFERENCES Clients(ClientID), FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) );
GO

--Tabela de Histórico de Viagens (TravelHistory):
CREATE TABLE TravelHistory ( TravelID INT IDENTITY(1,1) PRIMARY KEY, DriverID INT NOT NULL, DataViagem DATE, Destino VARCHAR(200), DuraçãoMinutos INT, FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) );
GO

--CRUDS
--Drivers
INSERT INTO Drivers (Nome, CNH, Endereço, Contato) VALUES ('João Silva', '1234567890', 'Rua A, 123', '99999-9999');
GO

UPDATE Drivers SET Contato = '88888-8888' WHERE DriverID = 1;
GO

SELECT * FROM Drivers;
GO

DELETE FROM Drivers WHERE DriverID = 1;
GO

--Clients
INSERT INTO Clients (Nome, Empresa, Endereço, Contato) VALUES ('Maria Oliveira', 'Empresa XYZ', 'Avenida B, 456', '98888-8888');
GO

UPDATE Clients SET Empresa = 'Nova Empresa XYZ' WHERE ClientID = 1;
GO

SELECT * FROM Clients;
GO

DELETE FROM Clients WHERE ClientID = 1;
GO

--Orders
INSERT INTO Orders (ClientID, DriverID, DetalhesPedido, DataEntrega, Status) VALUES (2, 2, 'Entrega de produtos eletrônicos', '2023-10-15', 'Em andamento');
GO

UPDATE Orders SET Status = 'Entregue' WHERE OrderID = 1; 
GO

SELECT * FROM Orders;
GO

DELETE FROM Orders WHERE OrderID = 1;
GO

--TravelHistory
INSERT INTO TravelHistory (DriverID, DataViagem, Destino, DuraçãoMinutos) VALUES (2, '2023-10-10', 'Rua C, 789', 30);
GO

UPDATE TravelHistory SET DuraçãoMinutos = 35 WHERE TravelID = 1;
GO

SELECT * FROM TravelHistory;
GO

DELETE FROM TravelHistory WHERE TravelID = 1;
GO
