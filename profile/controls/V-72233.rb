control "V-72233" do
  title "All networked systems must have SSH installed."
  desc  "Without protection of the transmitted information, confidentiality and
integrity may be compromised because unprotected communications can be
intercepted and either read or altered. This requirement applies to both
internal and external networks and all types of information system components
from which information can be transmitted (e.g., servers, mobile devices,
notebook computers, printers, copiers, scanners, and facsimile machines).
Communication paths outside the physical protection of a controlled boundary
are exposed to the possibility of interception and modification. Protecting the
confidentiality and integrity of organizational information can be accomplished
by physical means (e.g., employing physical distribution systems) or by logical
means (e.g., employing cryptographic techniques). If physical means of
protection are employed, logical means (cryptography) do not have to be
employed, and vice versa."
  impact 0.5
  tag "severity": nil
  tag "gtitle": "SRG-OS-000423-GPOS-00187"
  tag "satisfies": ["SRG-OS-000423-GPOS-00187", "SRG-OS-000424-GPOS-00188",
"SRG-OS-000425-GPOS-00189", "SRG-OS-000426-GPOS-00190"]
  tag "gid": "V-72233"
  tag "rid": "SV-86857r2_rule"
  tag "stig_id": "RHEL-07-040300"
  tag "fix_id": "F-78587r2_fix"
  tag "cci": ["CCI-002418", "CCI-002420", "CCI-002421", "CCI-002422"]
  tag "nist": ["SC-8", "SC-8 (2)", "SC-8 (1)", "SC-8 (2)", "Rev_4"]
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
  tag "check": "Check to see if sshd is installed with the following command:#
yum list installed | grep  sshlibssh2.x86_64
1.4.3-8.el7               @anaconda/7.1openssh.x86_64
6.6.1p1-11.el7            @anaconda/7.1openssh-clients.x86_64
6.6.1p1-11.el7            @anaconda/7.1openssh-server.x86_64
6.6.1p1-11.el7            @anaconda/7.1If the \"SSH server\" package is not
installed, this is a finding.If the \"SSH client\" package is not installed,
this is a finding."
  tag "fix": "Install SSH packages onto the host with the following commands:#
yum install openssh-clients.x86_64# yum install openssh-server.x86_64"
end

