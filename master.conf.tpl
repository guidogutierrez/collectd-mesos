LoadPlugin write_graphite
<Plugin "write_graphite">
    <Carbon>
        Host "{{ GRAPHITE_HOST }}"
        Port "2003"
        Protocol "tcp"
        Prefix "mesos-master."
        EscapeCharacter "."
        StoreRates true
        AlwaysAppendDS false
        SeparateInstances true
    </Carbon>
</Plugin>

<LoadPlugin "python">
    Globals true
</LoadPlugin>

<Plugin "python">
    ModulePath "/usr/share/collectd/plugins/mesos"

    Import "mesos-master"
    <Module "mesos-master">
        Host "{{ MESOS_HOST }}"
        Port "5050"
    </Module>
</Plugin>
