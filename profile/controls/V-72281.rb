control "V-72281" do
  title "For systems using DNS resolution, at least two name servers must be
configured."
  desc  "To provide availability for name resolution services, multiple
redundant name servers are mandated. A failure in name resolution could lead to
the failure of security functions requiring name resolution, which may include
time synchronization, centralized authentication, and remote system logging."
  impact 0.3
  tag "severity": nil
  tag "gtitle": "SRG-OS-000480-GPOS-00227"
  tag "gid": "V-72281"
  tag "rid": "SV-86905r1_rule"
  tag "stig_id": "RHEL-07-040600"
  tag "fix_id": "F-78635r1_fix"
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
  tag "check": "Determine whether the system is using local or DNS name
resolution with the following command:# grep hosts /etc/nsswitch.confhosts:
files dnsIf the DNS entry is missing from the host’s line in the
\"/etc/nsswitch.conf\" file, the \"/etc/resolv.conf\" file must be empty.Verify
the \"/etc/resolv.conf\" file is empty with the following command:# ls -al
/etc/resolv.conf-rw-r--r--  1 root root        0 Aug 19 08:31 resolv.confIf
local host authentication is being used and the \"/etc/resolv.conf\" file is
not empty, this is a finding.If the DNS entry is found on the host’s line of
the \"/etc/nsswitch.conf\" file, verify the operating system is configured to
use two or more name servers for DNS resolution.Determine the name servers used
by the system with the following command:# grep nameserver
/etc/resolv.confnameserver 192.168.1.2nameserver 192.168.1.3If less than two
lines are returned that are not commented out, this is a finding."
  tag "fix": "Configure the operating system to use two or more name servers
for DNS resolution.Edit the \"/etc/resolv.conf\" file to uncomment or add the
two or more \"nameserver\" option lines with the IP address of local
authoritative name servers. If local host resolution is being performed, the
\"/etc/resolv.conf\" file must be empty. An empty \"/etc/resolv.conf\" file can
be created as follows:# echo -n > /etc/resolv.confAnd then make the file
immutable with the following command:# chattr +i /etc/resolv.confIf the
\"/etc/resolv.conf\" file must be mutable, the required configuration must be
documented with the Information System Security Officer (ISSO) and the file
must be verified by the system file integrity tool."
end

