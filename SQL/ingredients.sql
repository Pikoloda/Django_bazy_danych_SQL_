USE pikoloda
GO

CREATE TABLE Ingredients(
IngredientID INT IDENTITY PRIMARY KEY ,
IgredientName VARCHAR(255) UNIQUE NOT NULL,
Calories FLOAT NOT NULL ,
Protein FLOAT NOT NULL,
Fat FLOAT NOT NULL,
Carbs FLOAT NOT NULL,
Fiber FLOAT NOT NULL,
TypeID VARCHAR(100)
);

INSERT INTO Ingredients (IgredientName, Calories, Protein, Fat, Carbs, Fiber, TypeID)
VALUES ('SŚŚĆ', 1,1,1,2,2,'ŚĆĆŚĆ')
SELECT * FROM Ingredients

