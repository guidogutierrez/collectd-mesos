LoadPlugin write_graphite
<Plugin "write_graphite">
    <Carbon>
        Host "{{ GRAPHITE_HOST }}"
        Port "2003"
        Protocol "tcp"
        Prefix "mesos-slave."
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

    Import "mesos-slave"
    <Module "mesos-slave">
        Host "{{ MESOS_HOST }}"
        Port "5051"
    </Module>
</Plugin>
