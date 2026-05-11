# Storage groups
In DB2, a storage group is a logical collection of storage volumes (disk storage) used to store database objects such as tables, indexes, and tablespaces. 
Storage groups help manage physical storage efficiently and allow administrators to control where database objects reside within the DB2 environment.

Purpose:
- Efficient storage managment
- Storage distribution
- Flexibility


``` db2
CREATE STOGROUP storage_group_name
VOLUMES (volume_name1, volume_name2, ...)
VCAT catalog_name
[DATACLAS dataclass-name
MGMTCLAS mgntclass-name
STORCLAS storageclass-name]
[NO KEY LABEL/KEY LABEL key-label-name]
[ERASE YES | NO];
```

- storage_group_name: The name of the storage group.
- VOLUMES: Specifies the disk volumes associated with the storage group. We can list multiple volumes, allowing DB2 to use any of the volumes as needed.
- VCAT: Specifies the catalog name where DB2 will store information about the storage group. This is required.
- DATACLAS: (Optional) Uses to identify the SMS data class name to associate with the DB2 storage group.
- MGMTCLAS: (Optional) Uses to identifies the SMS management class name to associate with the Db2 storage group.
- STORCLAS: (Optional) Uses to identifies the SMS storage class name to associate with the Db2 storage group.
- ERASE: (Optional) Specifies whether to erase data when it is no longer needed (YES to erase, NO to retain).
