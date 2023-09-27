-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/b634Cz
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Users` (
    `UserID` int  NOT NULL ,
    `Username` string  NOT NULL ,
    `Email` string  NOT NULL ,
    `Password` string  NOT NULL ,
    `ProfilePicture` string  NOT NULL ,
    PRIMARY KEY (
        `UserID`
    )
);

CREATE TABLE `Recipes` (
    `RecipeID` int  NOT NULL ,
    `UserID` int  NOT NULL ,
    `RecipeName` string  NOT NULL ,
    `Ingredients` string  NOT NULL ,
    `Instructions` string  NOT NULL ,
    `CookingTime` int  NOT NULL ,
    `DifficultyLevel` string  NOT NULL ,
    PRIMARY KEY (
        `RecipeID`
    )
);

CREATE TABLE `Reviews` (
    `ReviewID` int  NOT NULL ,
    `RecipeID` int  NOT NULL ,
    `UserID` int  NOT NULL ,
    `Rating` int  NOT NULL ,
    `ReviewText` string  NOT NULL ,
    PRIMARY KEY (
        `ReviewID`
    )
);

CREATE TABLE `Favorites` (
    `FavoriteID` int  NOT NULL ,
    `RecipeID` int  NOT NULL ,
    `UserID` int  NOT NULL ,
    PRIMARY KEY (
        `FavoriteID`
    )
);

CREATE TABLE `Followers` (
    `ConnectionID` int  NOT NULL ,
    `FollowerID` int  NOT NULL ,
    `FollowingID` int  NOT NULL ,
    PRIMARY KEY (
        `ConnectionID`
    )
);

ALTER TABLE `Recipes` ADD CONSTRAINT `fk_Recipes_UserID` FOREIGN KEY(`UserID`)
REFERENCES `Users` (`UserID`);

ALTER TABLE `Reviews` ADD CONSTRAINT `fk_Reviews_RecipeID` FOREIGN KEY(`RecipeID`)
REFERENCES `Recipes` (`RecipeID`);

ALTER TABLE `Reviews` ADD CONSTRAINT `fk_Reviews_UserID` FOREIGN KEY(`UserID`)
REFERENCES `Users` (`UserID`);

ALTER TABLE `Favorites` ADD CONSTRAINT `fk_Favorites_RecipeID` FOREIGN KEY(`RecipeID`)
REFERENCES `Recipes` (`RecipeID`);

ALTER TABLE `Favorites` ADD CONSTRAINT `fk_Favorites_UserID` FOREIGN KEY(`UserID`)
REFERENCES `Users` (`UserID`);

ALTER TABLE `Followers` ADD CONSTRAINT `fk_Followers_FollowerID` FOREIGN KEY(`FollowerID`)
REFERENCES `Users` (`UserID`);

ALTER TABLE `Followers` ADD CONSTRAINT `fk_Followers_FollowingID` FOREIGN KEY(`FollowingID`)
REFERENCES `Users` (`UserID`);

