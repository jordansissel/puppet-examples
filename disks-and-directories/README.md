# Disks and Directories

output:

    % sudo rm -rf /tmp/hadoop-example
    % sudo puppet apply --modulepath modules manifests/site.pp
    notice: Scope(Class[Hadoop::Basedir]): basedir: /tmp/hadoop-example
    notice: Scope(Hadoop::Disk[/dev/sdb1]): default: /tmp/hadoop-example/sdb1
    notice: Scope(Hadoop::Disk[/dev/sdc1]): default: /tmp/hadoop-example/sdc1
    notice: Scope(Hadoop::Disk[/dev/sdd1]): default: /tmp/hadoop-example/sdd1
    notice: Scope(Hadoop::Disk[/dev/sde1]): default: /tmp/hadoop-example/sde1
    notice: /Stage[main]/Hadoop::Basedir/File[/tmp/hadoop-example]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sdc1]/File[/tmp/hadoop-example/sdc1]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sdc1]/File[/tmp/hadoop-example/sdc1/mapred]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sdc1]/File[/tmp/hadoop-example/sdc1/hdfs]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sdb1]/File[/tmp/hadoop-example/sdb1]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sdb1]/File[/tmp/hadoop-example/sdb1/hdfs]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sdb1]/File[/tmp/hadoop-example/sdb1/mapred]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sde1]/File[/tmp/hadoop-example/sde1]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sde1]/File[/tmp/hadoop-example/sde1/hdfs]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sde1]/File[/tmp/hadoop-example/sde1/mapred]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sdd1]/File[/tmp/hadoop-example/sdd1]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sdd1]/File[/tmp/hadoop-example/sdd1/hdfs]/ensure: created
    notice: /Stage[main]//Hadoop::Disk[/dev/sdd1]/File[/tmp/hadoop-example/sdd1/mapred]/ensure: created

