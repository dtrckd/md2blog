@linux
@sound


https://fedoramagazine.org/diy-project-digital-jukebox-part-2/

list sound hardware

    cat /proc/asound/cards


show th PCH (e.g.) interface

    cat /proc/asound/card0/pcm0p/info

Note the numbers beside card and device to configure ALSA (e.g.).


For example in `~/.config/xmms2/xmms2.conf`, we can set `mixer` property to Master, and `mixer_dev` to hw:x (again where x is the card number)

	<section name="alsa">
		 <property name="device">hw:1,0</property>
		 <property name="mixer">Master</property>
		 <property name="mixer_dev">hw:1</property>
		 <property name="mixer_index">0</property>
	</section>


Setup the socket, in the `core` section, replace the `unix://...` by  (<property name="ipcsocket">unix:///tmp/xmms-ipc-dtrckd</property>)
<property name="ipcsocket">tcp://192.168.1.48:6600</property>


To change the plugin from pulse to alse:

<section name="output">
     <property name="buffersize">32768</property>
     <property name="flush_on_pause">1</property>
     <property name="plugin">alsa</property>
</section>
