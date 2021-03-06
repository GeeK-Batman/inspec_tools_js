control "V-72249" do
  title "The SSH daemon must not allow authentication using known hosts
authentication."
  desc  "Configuring this setting for the SSH daemon provides additional
assurance that remote logon via SSH will require a password, even in the event
of misconfiguration elsewhere."
  impact 0.5
  tag "severity": nil
  tag "gtitle": "SRG-OS-000480-GPOS-00227"
  tag "gid": "V-72249"
  tag "rid": "SV-86873r2_rule"
  tag "stig_id": "RHEL-07-040380"
  tag "fix_id": "F-78603r2_fix"
  tag "cci": ["CCI-000366"]
  tag "nist": ["CM-6 b", "Rev_4"]
  tag "false_negatives": nil
  tag "false_positives": nil
  tag "documentable": false
  tag "mitigations": nil
  tag "severity_override_guidance": false
  tag "potential_impacts": nil
  tag "third_party_tools": nil
  tag "mitigation_controls": nil
  tag "responsibility": nil
  tag "ia_controls": nil
  tag "check": "Verify the SSH daemon does not allow authentication using known
hosts authentication.To determine how the SSH daemon's \"IgnoreUserKnownHosts\"
option is set, run the following command:# grep -i IgnoreUserKnownHosts
/etc/ssh/sshd_configIgnoreUserKnownHosts yesIf the value is returned as \"no\",
the returned line is commented out, or no output is returned, this is a
finding."
  tag "fix": "Configure the SSH daemon to not allow authentication using known
hosts authentication.Add the following line in \"/etc/ssh/sshd_config\", or
uncomment the line and set the value to \"yes\":IgnoreUserKnownHosts yesThe SSH
service must be restarted for changes to take effect."
end

