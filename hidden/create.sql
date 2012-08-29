CREATE TABLE tGlobal (
  cId INTEGER PRIMARY KEY,
  cKey TEXT UNIQUE COLLATE NOCASE,
  cValue TEXT
);

INSERT INTO tGlobal (cKey, cValue) VALUES ('version', '2');

CREATE TABLE tUsers (
  cId INTEGER PRIMARY KEY,
  cName TEXT UNIQUE COLLATE NOCASE,
  cJoin_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tPictures (
  cId INTEGER PRIMARY KEY,
  cRel_path TEXT NOT NULL,
  cUser_id INT NOT NULL,
  cQuestion TEXT NOT NULL,
  cUpload_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(cUser_id) REFERENCES tUsers(cId) ON DELETE CASCADE
);

CREATE TABLE tAnswers (
  cId INTEGER PRIMARY KEY,
  cPicture_id INT NOT NULL,
  cUser_id INT NOT NULL,
  cAnswer TEXT NOT NULL,
  cDate TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(cPicture_id) REFERENCES tPictures(cId) ON DELETE CASCADE,
  FOREIGN KEY(cUser_id) REFERENCES tUsers(cId) ON DELETE CASCADE
);



