#!/usr/local/bin/php -q
<?php
	require_once("/etc/inc/notices.inc");
  $ovpnlog = fopen("/var/log/ovpndt.log", "a");
	$local_connect_value = " \n user_name: " . getenv('common_name') . " \n vpn_client_ip: " . getenv('ifconfig_pool_remote_ip') ." connected from " . getenv('trusted_ip') . " on " . date('F j, Y, g:i a');
	if ( strrchr (__FILE__ , 'disconnect') ) {
	$local_connect_value .= ", \n duration : " . round(((getenv('time_duration'))/3600),2) . "  hours, or " . round(((getenv('time_duration'))/60),2) . "  minutes, or " . getenv('time_duration') . "  seconds,\n upload from vpn-client (received) : " . round(((getenv('bytes_received'))/1048576),2) . " MB, \n download to vpn-client (send) : " . round(((getenv('bytes_sent'))/1048576),2) ." MB. \n DISCONNECTED.";
	}
  $logfile_update = date('F d H:i:s') . ", " . getenv('common_name') . ", " . getenv('ifconfig_pool_remote_ip') . ", " . getenv('trusted_ip') . ", " . getenv('time_duration') . ", " . getenv('bytes_received') . ", " . getenv('bytes_sent');
	notify_all_remote($local_connect_value);
  fwrite($ovpnlog, $logfile_update . "\n");
  fclose($ovpnlog);
?>
