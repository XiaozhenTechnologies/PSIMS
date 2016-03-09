CREATE TABLE IF NOT EXISTS `Tables` (
  `Table` varchar(50) NOT NULL,
  `Key` varchar(50) NOT NULL,
  `Alias` varchar(50) DEFAULT NULL,
  `MaxRecords` smallint(6) NOT NULL,
  `UniqueMultiColumnIndex` varchar(255) DEFAULT NULL,
  `TimeUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` varchar(12) DEFAULT NULL,
  `TimeCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(12) DEFAULT NULL,
  `RecordCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Table`),
  KEY `IX_Tables` (`Alias`)
  )
;

CREATE TABLE IF NOT EXISTS `TableFields` (
  `TableFieldID` varchar(255) NOT NULL,
  `Table` varchar(50) NOT NULL,
  `Field` varchar(255) NOT NULL,
  `Alias` varchar(50) NOT NULL,
  `Sequence` int(11) NOT NULL DEFAULT '0',
  `Sort` varchar(4) DEFAULT NULL,
  `DataType` varchar(18) NOT NULL,
  `Length` int(11) NOT NULL DEFAULT '12',
  `Required` tinyint(1) NOT NULL,
  `DefaultValue` varchar(25) DEFAULT NULL,
  `Duplicates` tinyint(1) NOT NULL,
  `Aggregate` varchar(12) DEFAULT NULL,
  `DisplayInParent` tinyint(1) NOT NULL,
  `DisplayInSubs` tinyint(1) NOT NULL,
  `TableJoinID` varchar(100) DEFAULT NULL,
  `SelectMethod` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Values` varchar(4000) DEFAULT NULL,
  `RefFieldDisplay` varchar(50) DEFAULT NULL,
  `RefFieldFilter` varchar(1000) DEFAULT NULL,
  `LocalFieldFilter` varchar(255) DEFAULT NULL,
  `IndexName` varchar(100) DEFAULT NULL,
  `TimeUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` varchar(12) DEFAULT NULL,
  `TimeCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`TableFieldID`),
  UNIQUE KEY `IX_TableFields` (`Table`,`Field`,`Sequence`),
  UNIQUE KEY `IX_TableFields_1` (`Field`,`Table`),
  UNIQUE KEY `IX_TableFields_3` (`Alias`,`Table`)
) 
;

CREATE TABLE IF NOT EXISTS `TableJoins` (
  `TableJoinID` varchar(100) NOT NULL,
  `Table` varchar(50) NOT NULL,
  `JoinFromTableAs` varchar(50) NOT NULL,
  `JoinType` varchar(5) NOT NULL,
  `RefTable` varchar(50) NOT NULL,
  `RefTableAs` varchar(50) NOT NULL,
  `JoinFromField` varchar(50) DEFAULT NULL,
  `RefField` varchar(50) NOT NULL,
  `RefTableJoinOn` varchar(255) DEFAULT NULL,
  `TimeUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` varchar(12) DEFAULT NULL,
  `TimeCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`TableJoinID`),
  UNIQUE KEY `IX_TableJoins` (`Table`,`RefTableAs`,`JoinFromField`),
  CONSTRAINT `FK_TableJoins_Tables` FOREIGN KEY (`Table`) REFERENCES `Tables` (`Table`) ON DELETE CASCADE ON UPDATE CASCADE
)
;


INSERT IGNORE INTO `Tables`
(`Table`
,`Key`
,MaxRecords
,`Alias`
,UpdatedBy
,CreatedBy)
SELECT 
'Tables' AS `Table` 
 , 'Table' AS `Key` 
 ,25 AS MaxRecords 
 , 'Table' AS `Alias` 
 , 'Import' AS UpdatedBy 
 , 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'Tables.Table' AS `TableFieldID`, 'Tables' AS `Table`, 'Table' AS `Field` 
, 'Table' AS `Alias` 
, 1 AS `Sequence`, Null AS `Sort`, 'AutoNumber' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 0 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'Tables.Key' AS `TableFieldID`, 'Tables' AS `Table`, 'Key' AS `Field` 
, 'Key' AS `Alias` 
, 2 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'Tables.Alias' AS `TableFieldID`, 'Tables' AS `Table`, 'Alias' AS `Field` 
, 'Alias' AS `Alias` 
, 3 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'Tables.MaxRecords' AS `TableFieldID`, 'Tables' AS `Table`, 'MaxRecords' AS `Field` 
, 'MaxRecords' AS `Alias` 
, 4 AS `Sequence`, Null AS `Sort`, 'Integer' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'Tables.UniqueMultiColumnIndex' AS `TableFieldID`, 'Tables' AS `Table`, 'UniqueMultiColumnIndex' AS `Field` 
, 'UniqueMultiColumnIndex' AS `Alias` 
, 5 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 255 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'Tables.TimeUpdated' AS `TableFieldID`, 'Tables' AS `Table`, 'TimeUpdated' AS `Field` 
, 'TimeUpdated' AS `Alias` 
, 100 AS `Sequence`, Null AS `Sort`, 'DateTime' AS `DataType`, 24 AS `Length`, 'NOW()' AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'Tables.UpdatedBy' AS `TableFieldID`, 'Tables' AS `Table`, 'UpdatedBy' AS `Field` 
, 'UpdatedBy' AS `Alias` 
, 101 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'Tables.TimeCreated' AS `TableFieldID`, 'Tables' AS `Table`, 'TimeCreated' AS `Field` 
, 'TimeCreated' AS `Alias` 
, 102 AS `Sequence`, Null AS `Sort`, 'DateTime' AS `DataType`, 24 AS `Length`, 'NOW()' AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'Tables.CreatedBy' AS `TableFieldID`, 'Tables' AS `Table`, 'CreatedBy' AS `Field` 
, 'CreatedBy' AS `Alias` 
, 103 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'Tables.RecordCount' AS `TableFieldID`, 'Tables' AS `Table`, 'RecordCount' AS `Field` 
, 'RecordCount' AS `Alias` 
, 10 AS `Sequence`, Null AS `Sort`, 'Integer' AS `DataType`, 12 AS `Length`, '0' AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `Tables`
(`Table`
,`Key`
,MaxRecords
,`Alias`
,UpdatedBy
,CreatedBy)
SELECT 
'TableFields' AS `Table` 
 , 'TableFieldID' AS `Key` 
 ,25 AS MaxRecords 
 , 'Table Fields' AS `Alias` 
 , 'Import' AS UpdatedBy 
 , 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.TableFieldID' AS `TableFieldID`, 'TableFields' AS `Table`, 'TableFieldID' AS `Field` 
, 'TableFieldID' AS `Alias` 
, 1 AS `Sequence`, Null AS `Sort`, 'AutoNumber' AS `DataType`, 255 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 0 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.Table' AS `TableFieldID`, 'TableFields' AS `Table`, 'Table' AS `Field` 
, 'Table' AS `Alias` 
, 2 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , 'Table' AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.Field' AS `TableFieldID`, 'TableFields' AS `Table`, 'Field' AS `Field` 
, 'Field' AS `Alias` 
, 3 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 255 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.Alias' AS `TableFieldID`, 'TableFields' AS `Table`, 'Alias' AS `Field` 
, 'Alias' AS `Alias` 
, 4 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.Sequence' AS `TableFieldID`, 'TableFields' AS `Table`, 'Sequence' AS `Field` 
, 'Sequence' AS `Alias` 
, 5 AS `Sequence`, Null AS `Sort`, 'Integer' AS `DataType`, 12 AS `Length`, '0' AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.Sort' AS `TableFieldID`, 'TableFields' AS `Table`, 'Sort' AS `Field` 
, 'Sort' AS `Alias` 
, 6 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 4 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.DataType' AS `TableFieldID`, 'TableFields' AS `Table`, 'DataType' AS `Field` 
, 'DataType' AS `Alias` 
, 7 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 18 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.Length' AS `TableFieldID`, 'TableFields' AS `Table`, 'Length' AS `Field` 
, 'Length' AS `Alias` 
, 8 AS `Sequence`, Null AS `Sort`, 'Integer' AS `DataType`, 12 AS `Length`, '12' AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.Required' AS `TableFieldID`, 'TableFields' AS `Table`, 'Required' AS `Field` 
, 'Required' AS `Alias` 
, 9 AS `Sequence`, Null AS `Sort`, 'Integer' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.DefaultValue' AS `TableFieldID`, 'TableFields' AS `Table`, 'DefaultValue' AS `Field` 
, 'DefaultValue' AS `Alias` 
, 10 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 25 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.Duplicates' AS `TableFieldID`, 'TableFields' AS `Table`, 'Duplicates' AS `Field` 
, 'Duplicates' AS `Alias` 
, 11 AS `Sequence`, Null AS `Sort`, 'Integer' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.Aggregate' AS `TableFieldID`, 'TableFields' AS `Table`, 'Aggregate' AS `Field` 
, 'Aggregate' AS `Alias` 
, 12 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.DisplayInParent' AS `TableFieldID`, 'TableFields' AS `Table`, 'DisplayInParent' AS `Field` 
, 'DisplayInParent' AS `Alias` 
, 13 AS `Sequence`, Null AS `Sort`, 'Integer' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.DisplayInSubs' AS `TableFieldID`, 'TableFields' AS `Table`, 'DisplayInSubs' AS `Field` 
, 'DisplayInSubs' AS `Alias` 
, 14 AS `Sequence`, Null AS `Sort`, 'Integer' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.TableJoinID' AS `TableFieldID`, 'TableFields' AS `Table`, 'TableJoinID' AS `Field` 
, 'TableJoinID' AS `Alias` 
, 15 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 100 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.SelectMethod' AS `TableFieldID`, 'TableFields' AS `Table`, 'SelectMethod' AS `Field` 
, 'SelectMethod' AS `Alias` 
, 16 AS `Sequence`, Null AS `Sort`, 'Integer' AS `DataType`, 12 AS `Length`, '0' AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.Values' AS `TableFieldID`, 'TableFields' AS `Table`, 'Values' AS `Field` 
, 'Values' AS `Alias` 
, 17 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 4000 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.RefFieldDisplay' AS `TableFieldID`, 'TableFields' AS `Table`, 'RefFieldDisplay' AS `Field` 
, 'RefFieldDisplay' AS `Alias` 
, 18 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.RefFieldFilter' AS `TableFieldID`, 'TableFields' AS `Table`, 'RefFieldFilter' AS `Field` 
, 'RefFieldFilter' AS `Alias` 
, 19 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 1000 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.LocalFieldFilter' AS `TableFieldID`, 'TableFields' AS `Table`, 'LocalFieldFilter' AS `Field` 
, 'LocalFieldFilter' AS `Alias` 
, 20 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 255 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.IndexName' AS `TableFieldID`, 'TableFields' AS `Table`, 'IndexName' AS `Field` 
, 'IndexName' AS `Alias` 
, 21 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 100 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.TimeUpdated' AS `TableFieldID`, 'TableFields' AS `Table`, 'TimeUpdated' AS `Field` 
, 'TimeUpdated' AS `Alias` 
, 100 AS `Sequence`, Null AS `Sort`, 'DateTime' AS `DataType`, 24 AS `Length`, 'NOW()' AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.UpdatedBy' AS `TableFieldID`, 'TableFields' AS `Table`, 'UpdatedBy' AS `Field` 
, 'UpdatedBy' AS `Alias` 
, 101 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.TimeCreated' AS `TableFieldID`, 'TableFields' AS `Table`, 'TimeCreated' AS `Field` 
, 'TimeCreated' AS `Alias` 
, 102 AS `Sequence`, Null AS `Sort`, 'DateTime' AS `DataType`, 24 AS `Length`, 'NOW()' AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableFields.CreatedBy' AS `TableFieldID`, 'TableFields' AS `Table`, 'CreatedBy' AS `Field` 
, 'CreatedBy' AS `Alias` 
, 103 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;

INSERT IGNORE INTO `Tables`
(`Table`
,`Key`
,MaxRecords
,`Alias`
,UpdatedBy
,CreatedBy)
SELECT 
'TableJoins' AS `Table` 
 , 'TableJoinID' AS `Key` 
 ,25 AS MaxRecords 
 , 'TableJoins' AS `Alias` 
 , 'Import' AS UpdatedBy 
 , 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.TableJoinID' AS `TableFieldID`, 'TableJoins' AS `Table`, 'TableJoinID' AS `Field` 
, 'TableJoinID' AS `Alias` 
, 1 AS `Sequence`, Null AS `Sort`, 'AutoNumber' AS `DataType`, 100 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 0 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.Table' AS `TableFieldID`, 'TableJoins' AS `Table`, 'Table' AS `Field` 
, 'Table' AS `Alias` 
, 2 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , 'Table' AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.JoinFromTableAs' AS `TableFieldID`, 'TableJoins' AS `Table`, 'JoinFromTableAs' AS `Field` 
, 'JoinFromTableAs' AS `Alias` 
, 3 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.JoinType' AS `TableFieldID`, 'TableJoins' AS `Table`, 'JoinType' AS `Field` 
, 'JoinType' AS `Alias` 
, 4 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 5 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.RefTable' AS `TableFieldID`, 'TableJoins' AS `Table`, 'RefTable' AS `Field` 
, 'RefTable' AS `Alias` 
, 5 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.RefTableAs' AS `TableFieldID`, 'TableJoins' AS `Table`, 'RefTableAs' AS `Field` 
, 'RefTableAs' AS `Alias` 
, 6 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.JoinFromField' AS `TableFieldID`, 'TableJoins' AS `Table`, 'JoinFromField' AS `Field` 
, 'JoinFromField' AS `Alias` 
, 7 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.RefField' AS `TableFieldID`, 'TableJoins' AS `Table`, 'RefField' AS `Field` 
, 'RefField' AS `Alias` 
, 8 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 50 AS `Length`, Null AS DefaultValue, 1 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.RefTableJoinOn' AS `TableFieldID`, 'TableJoins' AS `Table`, 'RefTableJoinOn' AS `Field` 
, 'RefTableJoinOn' AS `Alias` 
, 9 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 255 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 1 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.TimeUpdated' AS `TableFieldID`, 'TableJoins' AS `Table`, 'TimeUpdated' AS `Field` 
, 'TimeUpdated' AS `Alias` 
, 100 AS `Sequence`, Null AS `Sort`, 'DateTime' AS `DataType`, 24 AS `Length`, 'NOW()' AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.UpdatedBy' AS `TableFieldID`, 'TableJoins' AS `Table`, 'UpdatedBy' AS `Field` 
, 'UpdatedBy' AS `Alias` 
, 101 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.TimeCreated' AS `TableFieldID`, 'TableJoins' AS `Table`, 'TimeCreated' AS `Field` 
, 'TimeCreated' AS `Alias` 
, 102 AS `Sequence`, Null AS `Sort`, 'DateTime' AS `DataType`, 24 AS `Length`, 'NOW()' AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;


INSERT IGNORE INTO `TableFields`
(
  TableFieldID, `Table`, Field, `Alias`
, Sequence, Sort
, DataType, `Length`, DefaultValue
, `Required`, Duplicates
, DisplayInSubs, DisplayInParent
, `Values`
, TableJoinID, RefFieldDisplay
, SelectMethod
, UpdatedBy, CreatedBy
)
SELECT 'TableJoins.CreatedBy' AS `TableFieldID`, 'TableJoins' AS `Table`, 'CreatedBy' AS `Field` 
, 'CreatedBy' AS `Alias` 
, 103 AS `Sequence`, Null AS `Sort`, 'Text' AS `DataType`, 12 AS `Length`, Null AS DefaultValue, 0 AS `Required`, 1 AS Duplicates, 0 AS DisplayInSubs , 1 AS DisplayInParent, Null AS `Values` 
 , Null AS TableJoinID
 , Null AS RefFieldDisplay
 , 0 AS `SelectMethod`  
 , 'Import' AS UpdatedBy, 'Import' AS CreatedBy 
;




