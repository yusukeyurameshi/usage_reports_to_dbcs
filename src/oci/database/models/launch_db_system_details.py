# coding: utf-8
# Copyright (c) 2016, 2017, Oracle and/or its affiliates. All rights reserved.


from ...util import formatted_flat_dict


class LaunchDbSystemDetails(object):

    def __init__(self):

        self.swagger_types = {
            'availability_domain': 'str',
            'backup_subnet_id': 'str',
            'cluster_name': 'str',
            'compartment_id': 'str',
            'cpu_core_count': 'int',
            'data_storage_percentage': 'int',
            'database_edition': 'str',
            'db_home': 'CreateDbHomeDetails',
            'disk_redundancy': 'str',
            'display_name': 'str',
            'domain': 'str',
            'hostname': 'str',
            'shape': 'str',
            'ssh_public_keys': 'list[str]',
            'subnet_id': 'str'
        }

        self.attribute_map = {
            'availability_domain': 'availabilityDomain',
            'backup_subnet_id': 'backupSubnetId',
            'cluster_name': 'clusterName',
            'compartment_id': 'compartmentId',
            'cpu_core_count': 'cpuCoreCount',
            'data_storage_percentage': 'dataStoragePercentage',
            'database_edition': 'databaseEdition',
            'db_home': 'dbHome',
            'disk_redundancy': 'diskRedundancy',
            'display_name': 'displayName',
            'domain': 'domain',
            'hostname': 'hostname',
            'shape': 'shape',
            'ssh_public_keys': 'sshPublicKeys',
            'subnet_id': 'subnetId'
        }

        self._availability_domain = None
        self._backup_subnet_id = None
        self._cluster_name = None
        self._compartment_id = None
        self._cpu_core_count = None
        self._data_storage_percentage = None
        self._database_edition = None
        self._db_home = None
        self._disk_redundancy = None
        self._display_name = None
        self._domain = None
        self._hostname = None
        self._shape = None
        self._ssh_public_keys = None
        self._subnet_id = None

    @property
    def availability_domain(self):
        """
        Gets the availability_domain of this LaunchDbSystemDetails.
        The Availability Domain where the DB System is located.


        :return: The availability_domain of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._availability_domain

    @availability_domain.setter
    def availability_domain(self, availability_domain):
        """
        Sets the availability_domain of this LaunchDbSystemDetails.
        The Availability Domain where the DB System is located.


        :param availability_domain: The availability_domain of this LaunchDbSystemDetails.
        :type: str
        """
        self._availability_domain = availability_domain

    @property
    def backup_subnet_id(self):
        """
        Gets the backup_subnet_id of this LaunchDbSystemDetails.
        The OCID of the backup network subnet the DB System is associated with. Applicable only to Exadata.

        **Subnet Restrictions:** See above subnetId's **Subnet Restriction**.


        :return: The backup_subnet_id of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._backup_subnet_id

    @backup_subnet_id.setter
    def backup_subnet_id(self, backup_subnet_id):
        """
        Sets the backup_subnet_id of this LaunchDbSystemDetails.
        The OCID of the backup network subnet the DB System is associated with. Applicable only to Exadata.

        **Subnet Restrictions:** See above subnetId's **Subnet Restriction**.


        :param backup_subnet_id: The backup_subnet_id of this LaunchDbSystemDetails.
        :type: str
        """
        self._backup_subnet_id = backup_subnet_id

    @property
    def cluster_name(self):
        """
        Gets the cluster_name of this LaunchDbSystemDetails.
        Cluster name for Exadata and 2-node RAC DB Systems. The cluster name must begin with an an alphabetic character, and may contain hyphens (-). Underscores (_) are not permitted. The cluster name can be no longer than 11 characters and is not case sensitive.


        :return: The cluster_name of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._cluster_name

    @cluster_name.setter
    def cluster_name(self, cluster_name):
        """
        Sets the cluster_name of this LaunchDbSystemDetails.
        Cluster name for Exadata and 2-node RAC DB Systems. The cluster name must begin with an an alphabetic character, and may contain hyphens (-). Underscores (_) are not permitted. The cluster name can be no longer than 11 characters and is not case sensitive.


        :param cluster_name: The cluster_name of this LaunchDbSystemDetails.
        :type: str
        """
        self._cluster_name = cluster_name

    @property
    def compartment_id(self):
        """
        Gets the compartment_id of this LaunchDbSystemDetails.
        The Oracle Cloud ID (OCID) of the compartment the DB System  belongs in.


        :return: The compartment_id of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._compartment_id

    @compartment_id.setter
    def compartment_id(self, compartment_id):
        """
        Sets the compartment_id of this LaunchDbSystemDetails.
        The Oracle Cloud ID (OCID) of the compartment the DB System  belongs in.


        :param compartment_id: The compartment_id of this LaunchDbSystemDetails.
        :type: str
        """
        self._compartment_id = compartment_id

    @property
    def cpu_core_count(self):
        """
        Gets the cpu_core_count of this LaunchDbSystemDetails.
        The number of CPU cores to enable. The valid values depend on the specified shape:

        - BM.DenseIO1.36 and BM.HighIO1.36 - Specify a multiple of 2, from 2 to 36.
        - BM.RACLocalStorage1.72 - Specify a multiple of 4, from 4 to 72.
        - Exadata.Quarter1.84 - Specify a multiple of 2, from 22 to 84.
        - Exadata.Half1.168 - Specify a multiple of 4, from 44 to 168.
        - Exadata.Full1.336 - Specify a multiple of 8, from 88 to 336.


        :return: The cpu_core_count of this LaunchDbSystemDetails.
        :rtype: int
        """
        return self._cpu_core_count

    @cpu_core_count.setter
    def cpu_core_count(self, cpu_core_count):
        """
        Sets the cpu_core_count of this LaunchDbSystemDetails.
        The number of CPU cores to enable. The valid values depend on the specified shape:

        - BM.DenseIO1.36 and BM.HighIO1.36 - Specify a multiple of 2, from 2 to 36.
        - BM.RACLocalStorage1.72 - Specify a multiple of 4, from 4 to 72.
        - Exadata.Quarter1.84 - Specify a multiple of 2, from 22 to 84.
        - Exadata.Half1.168 - Specify a multiple of 4, from 44 to 168.
        - Exadata.Full1.336 - Specify a multiple of 8, from 88 to 336.


        :param cpu_core_count: The cpu_core_count of this LaunchDbSystemDetails.
        :type: int
        """
        self._cpu_core_count = cpu_core_count

    @property
    def data_storage_percentage(self):
        """
        Gets the data_storage_percentage of this LaunchDbSystemDetails.
        The percentage assigned to DATA storage (user data and database files).
        The remaining percentage is assigned to RECO storage (database redo logs, archive logs, and recovery manager backups).
        Specify 80 or 40. The default is 80 percent assigned to DATA storage.


        :return: The data_storage_percentage of this LaunchDbSystemDetails.
        :rtype: int
        """
        return self._data_storage_percentage

    @data_storage_percentage.setter
    def data_storage_percentage(self, data_storage_percentage):
        """
        Sets the data_storage_percentage of this LaunchDbSystemDetails.
        The percentage assigned to DATA storage (user data and database files).
        The remaining percentage is assigned to RECO storage (database redo logs, archive logs, and recovery manager backups).
        Specify 80 or 40. The default is 80 percent assigned to DATA storage.


        :param data_storage_percentage: The data_storage_percentage of this LaunchDbSystemDetails.
        :type: int
        """
        self._data_storage_percentage = data_storage_percentage

    @property
    def database_edition(self):
        """
        Gets the database_edition of this LaunchDbSystemDetails.
        The Oracle Database Edition that applies to all the databases on the DB System.

        Exadata DB Systems and 2-node RAC DB Systems require ENTERPRISE_EDITION_EXTREME_PERFORMANCE.

        Allowed values for this property are: "STANDARD_EDITION", "ENTERPRISE_EDITION", "ENTERPRISE_EDITION_EXTREME_PERFORMANCE", "ENTERPRISE_EDITION_HIGH_PERFORMANCE"


        :return: The database_edition of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._database_edition

    @database_edition.setter
    def database_edition(self, database_edition):
        """
        Sets the database_edition of this LaunchDbSystemDetails.
        The Oracle Database Edition that applies to all the databases on the DB System.

        Exadata DB Systems and 2-node RAC DB Systems require ENTERPRISE_EDITION_EXTREME_PERFORMANCE.


        :param database_edition: The database_edition of this LaunchDbSystemDetails.
        :type: str
        """
        allowed_values = ["STANDARD_EDITION", "ENTERPRISE_EDITION", "ENTERPRISE_EDITION_EXTREME_PERFORMANCE", "ENTERPRISE_EDITION_HIGH_PERFORMANCE"]
        if database_edition not in allowed_values:
            raise ValueError(
                "Invalid value for `database_edition`, must be one of {0}"
                .format(allowed_values)
            )
        self._database_edition = database_edition

    @property
    def db_home(self):
        """
        Gets the db_home of this LaunchDbSystemDetails.

        :return: The db_home of this LaunchDbSystemDetails.
        :rtype: CreateDbHomeDetails
        """
        return self._db_home

    @db_home.setter
    def db_home(self, db_home):
        """
        Sets the db_home of this LaunchDbSystemDetails.

        :param db_home: The db_home of this LaunchDbSystemDetails.
        :type: CreateDbHomeDetails
        """
        self._db_home = db_home

    @property
    def disk_redundancy(self):
        """
        Gets the disk_redundancy of this LaunchDbSystemDetails.
        The type of redundancy configured for the DB System.
        Normal is 2-way redundancy, recommended for test and development systems.
        High is 3-way redundancy, recommended for production systems.

        Allowed values for this property are: "HIGH", "NORMAL"


        :return: The disk_redundancy of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._disk_redundancy

    @disk_redundancy.setter
    def disk_redundancy(self, disk_redundancy):
        """
        Sets the disk_redundancy of this LaunchDbSystemDetails.
        The type of redundancy configured for the DB System.
        Normal is 2-way redundancy, recommended for test and development systems.
        High is 3-way redundancy, recommended for production systems.


        :param disk_redundancy: The disk_redundancy of this LaunchDbSystemDetails.
        :type: str
        """
        allowed_values = ["HIGH", "NORMAL"]
        if disk_redundancy not in allowed_values:
            raise ValueError(
                "Invalid value for `disk_redundancy`, must be one of {0}"
                .format(allowed_values)
            )
        self._disk_redundancy = disk_redundancy

    @property
    def display_name(self):
        """
        Gets the display_name of this LaunchDbSystemDetails.
        The user-friendly name for the DB System. It does not have to be unique.


        :return: The display_name of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._display_name

    @display_name.setter
    def display_name(self, display_name):
        """
        Sets the display_name of this LaunchDbSystemDetails.
        The user-friendly name for the DB System. It does not have to be unique.


        :param display_name: The display_name of this LaunchDbSystemDetails.
        :type: str
        """
        self._display_name = display_name

    @property
    def domain(self):
        """
        Gets the domain of this LaunchDbSystemDetails.
        A domain name used for the DB System. If the Oracle-provided Internet and VCN
        Resolver is enabled for the specified subnet, the domain name for the subnet is used
        (don't provide one). Otherwise, provide a valid DNS domain name. Hyphens (-) are not permitted.


        :return: The domain of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._domain

    @domain.setter
    def domain(self, domain):
        """
        Sets the domain of this LaunchDbSystemDetails.
        A domain name used for the DB System. If the Oracle-provided Internet and VCN
        Resolver is enabled for the specified subnet, the domain name for the subnet is used
        (don't provide one). Otherwise, provide a valid DNS domain name. Hyphens (-) are not permitted.


        :param domain: The domain of this LaunchDbSystemDetails.
        :type: str
        """
        self._domain = domain

    @property
    def hostname(self):
        """
        Gets the hostname of this LaunchDbSystemDetails.
        The host name for the DB System. The host name must begin with an alphabetic character and
        can contain a maximum of 30 alphanumeric characters, including hyphens (-).

        The maximum length of the combined hostname and domain is 63 characters.

        **Note:** The hostname must be unique within the subnet. If it is not unique,
        the DB System will fail to provision.


        :return: The hostname of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._hostname

    @hostname.setter
    def hostname(self, hostname):
        """
        Sets the hostname of this LaunchDbSystemDetails.
        The host name for the DB System. The host name must begin with an alphabetic character and
        can contain a maximum of 30 alphanumeric characters, including hyphens (-).

        The maximum length of the combined hostname and domain is 63 characters.

        **Note:** The hostname must be unique within the subnet. If it is not unique,
        the DB System will fail to provision.


        :param hostname: The hostname of this LaunchDbSystemDetails.
        :type: str
        """
        self._hostname = hostname

    @property
    def shape(self):
        """
        Gets the shape of this LaunchDbSystemDetails.
        The shape of the DB System. The shape determines the CPU cores, storage, and memory allocated to the DB System. To get a list of shapes, use the :func:`list_db_system_shapes` operation.


        :return: The shape of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._shape

    @shape.setter
    def shape(self, shape):
        """
        Sets the shape of this LaunchDbSystemDetails.
        The shape of the DB System. The shape determines the CPU cores, storage, and memory allocated to the DB System. To get a list of shapes, use the :func:`list_db_system_shapes` operation.


        :param shape: The shape of this LaunchDbSystemDetails.
        :type: str
        """
        self._shape = shape

    @property
    def ssh_public_keys(self):
        """
        Gets the ssh_public_keys of this LaunchDbSystemDetails.
        The public key portion of the key pair to use for SSH access to the DB System. Multiple public keys can be provided. The length of the combined keys cannot exceed 10,000 characters.


        :return: The ssh_public_keys of this LaunchDbSystemDetails.
        :rtype: list[str]
        """
        return self._ssh_public_keys

    @ssh_public_keys.setter
    def ssh_public_keys(self, ssh_public_keys):
        """
        Sets the ssh_public_keys of this LaunchDbSystemDetails.
        The public key portion of the key pair to use for SSH access to the DB System. Multiple public keys can be provided. The length of the combined keys cannot exceed 10,000 characters.


        :param ssh_public_keys: The ssh_public_keys of this LaunchDbSystemDetails.
        :type: list[str]
        """
        self._ssh_public_keys = ssh_public_keys

    @property
    def subnet_id(self):
        """
        Gets the subnet_id of this LaunchDbSystemDetails.
        The OCID of the subnet the DB System is associated with.

        **Subnet Restrictions:**
        - For 1- and 2-node RAC DB Systems, do not use a subnet that overlaps with 192.168.16.16/28
        - For Exadata DB Systems, do not use a subnet that overlaps with 192.168.128.0/20

        These subnets are used by the Oracle Clusterware private interconnect on the database instance.
        Specifying an overlapping subnet will cause the private interconnect to malfunction.
        This restriction applies to both the client subnet and backup subnet.


        :return: The subnet_id of this LaunchDbSystemDetails.
        :rtype: str
        """
        return self._subnet_id

    @subnet_id.setter
    def subnet_id(self, subnet_id):
        """
        Sets the subnet_id of this LaunchDbSystemDetails.
        The OCID of the subnet the DB System is associated with.

        **Subnet Restrictions:**
        - For 1- and 2-node RAC DB Systems, do not use a subnet that overlaps with 192.168.16.16/28
        - For Exadata DB Systems, do not use a subnet that overlaps with 192.168.128.0/20

        These subnets are used by the Oracle Clusterware private interconnect on the database instance.
        Specifying an overlapping subnet will cause the private interconnect to malfunction.
        This restriction applies to both the client subnet and backup subnet.


        :param subnet_id: The subnet_id of this LaunchDbSystemDetails.
        :type: str
        """
        self._subnet_id = subnet_id

    def __repr__(self):
        return formatted_flat_dict(self)

    def __eq__(self, other):
        if other is None:
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        return not self == other