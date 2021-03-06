control "V-72055" do
  title "If the cron.allow file exists it must be group-owned by root."
  desc  "If the group owner of the \"cron.allow\" file is not set to root,
sensitive information could be viewed or edited by unauthorized users."
  impact 0.5
  tag "severity": nil
  tag "gtitle": "SRG-OS-000480-GPOS-00227"
  tag "gid": "V-72055"
  tag "rid": "SV-86679r1_rule"
  tag "stig_id": "RHEL-07-021120"
  tag "fix_id": "F-78407r1_fix"
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
  tag "check": "Verify that the \"cron.allow\" file is group-owned by
root.Check the group owner of the \"cron.allow\" file with the following
command:# ls -al /etc/cron.allow-rw------- 1 root root 6 Mar  5  2011
/etc/cron.allowIf the \"cron.allow\" file exists and has a group owner other
than root, this is a finding."
  tag "fix": "Set the group owner on the \"/etc/cron.allow\" file to root with
the following command:# chgrp root /etc/cron.allow"
end

