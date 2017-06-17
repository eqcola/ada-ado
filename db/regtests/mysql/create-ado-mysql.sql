/* Copied from ado-mysql.sql*/
/* File generated automatically by dynamo */
/* Entity types */
CREATE TABLE entity_type (
  /* the entity type identifier */
  `id` INTEGER  AUTO_INCREMENT,
  /* the entity type name (table name) */
  `name` VARCHAR(127) UNIQUE NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Sequence generator */
CREATE TABLE sequence (
  /* the sequence name */
  `name` VARCHAR(127) NOT NULL,
  /* the sequence record version */
  `version` int ,
  /* the sequence value */
  `value` BIGINT ,
  /* the sequence block size */
  `block_size` BIGINT ,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;;
INSERT INTO entity_type (name) VALUES
("entity_type")
,("sequence")
;
/* Copied from ado-mysql.sql*/
/* File generated automatically by dynamo */
/* The Comment table records a user comment associated with a database entity.
                 The comment can be associated with any other database record. */
CREATE TABLE TEST_COMMENTS (
  /* the comment identifier */
  `ID` INTEGER ,
  /* the comment version. */
  `version` int NOT NULL,
  /* the comment publication date. */
  `DATE` TIMESTAMP NOT NULL,
  /* the comment message. */
  `MESSAGE` VARCHAR(256) NOT NULL,
  /* the entity identifier to which this comment is associated. */
  `ENTITY_ID` INTEGER NOT NULL,
  /* the user who posted this comment */
  `USER_FK` INTEGER NOT NULL,
  /* the entity type that correspond to the entity associated with this comment. */
  `ENTITY__TYPE_FK` INTEGER NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*  */
CREATE TABLE test_image (
  /* the image identifier */
  `id` INTEGER ,
  /* the image version. */
  `version` int NOT NULL,
  /* the message creation date */
  `create_date` DATETIME NOT NULL,
  /* the image data */
  `image` BLOB ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Record representing a user */
CREATE TABLE allocate (
  /* the user id */
  `ID` BIGINT NOT NULL,
  /* the allocate version. */
  `version` int NOT NULL,
  /* the sequence value */
  `NAME` VARCHAR(255) ,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Record representing a user */
CREATE TABLE test_user (
  /* the user id */
  `ID` BIGINT NOT NULL,
  /* the comment version. */
  `version` int NOT NULL,
  /* the sequence value */
  `VALUE` BIGINT NOT NULL,
  /* the user name */
  `NAME` VARCHAR(255) ,
  /* the user name */
  `select` VARCHAR(255) ,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Record representing a user */
CREATE TABLE test_nullable_table (
  /* the user id */
  `ID` BIGINT NOT NULL,
  /* the comment version. */
  `version` int NOT NULL,
  /* an identifier value */
  `ID_VALUE` BIGINT ,
  /* an integer value */
  `INT_VALUE` INTEGER ,
  /* a boolean value */
  `BOOL_VALUE` INTEGER ,
  /* a string value */
  `STRING_VALUE` VARCHAR(255) ,
  /* a time value */
  `TIME_VALUE` DATETIME ,
  /* an entity value */
  `ENTITY_VALUE` INTEGER ,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Record representing a user */
CREATE TABLE test_table (
  /* the user id */
  `ID` BIGINT NOT NULL,
  /* the comment version. */
  `version` int NOT NULL,
  /* an identifier value */
  `ID_VALUE` BIGINT NOT NULL,
  /* an integer value */
  `INT_VALUE` INTEGER NOT NULL,
  /* a boolean value */
  `BOOL_VALUE` INTEGER NOT NULL,
  /* a string value */
  `STRING_VALUE` VARCHAR(255) NOT NULL,
  /* a time value */
  `TIME_VALUE` DATETIME NOT NULL,
  /* an entity value */
  `ENTITY_VALUE` INTEGER NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO entity_type (name) VALUES
("TEST_COMMENTS")
,("test_image")
,("allocate")
,("test_user")
,("test_nullable_table")
,("test_table")
;
