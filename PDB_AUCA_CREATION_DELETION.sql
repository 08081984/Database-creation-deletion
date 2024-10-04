
ALTER SESSION SET CONTAINER = CDB$ROOT;
//This command switches the context to the root container (cdb$root), which is necessary for managing PDBs.
SHOW CON_NAME;
//This command lists all pluggable databases in the CDB name

CREATE PLUGGABLE DATABASE plsql_class2024_db
ADMIN USER ne_plsqlauca IDENTIFIED BY 1223
FILE_NAME_CONVERT = ('/opt/oracle/oradata/ORCLCDB/pdbseed/', '/opt/oracle/oradata/ORCLCDB/plsql_class2024_db/');
//This creates a new pluggable database called plsql_class2024_db with an administrative user ne-plsqlauca, identified by the password 1223.

ALTER PLUGGABLE DATABASE plsql_class2024_db OPEN;
//Verify the PDB is created: You can check the status of the PDB

ALTER PLUGGABLE DATABASE plsql_class2024_db SAVE STATE;
//The save state command ensures that the PDB will automatically open whenever the CDB is restarted.

CREATE PLUGGABLE DATABASE ne_to_delete_pdb
ADMIN USER ne_admin IDENTIFIED BY delete_password
FILE_NAME_CONVERT = ('/opt/oracle/oradata/ORCLCDB/pdbseed/', '/opt/oracle/oradata/ORCLCDB/fne_to_delete_pdb/');
//This creates a new pluggable database called ne_to_delete_pdb with an administrative user ne-plsqlauca, identified by the password delete_password.

ALTER PLUGGABLE DATABASE ne_to_delete_pdb OPEN;
//These commands open the newly created de_to_delete_pdb PDB 

ALTER PLUGGABLE DATABASE ne_to_delete_pdb CLOSE IMMEDIATE;
DROP PLUGGABLE DATABASE ne_to_delete_pdb INCLUDING DATAFILES;
//This the process of closing and dropping the ne_to_delete_pdb.


