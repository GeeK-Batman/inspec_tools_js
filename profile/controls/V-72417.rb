control "V-72417" do
  title "The operating system must have the required packages for multifactor
authentication installed."
  desc  "Using an authentication device, such as a CAC or token that is
separate from the information system, ensures that even if the information
system is compromised, that compromise will not affect credentials stored on
the authentication device.Multifactor solutions that require devices separate
from information systems gaining access include, for example, hardware tokens
providing time-based or challenge-response authenticators and smart cards such
as the U.S. Government Personal Identity Verification card and the DoD Common
Access Card.A privileged account is defined as an information system account
with authorizations of a privileged user.Remote access is access to DoD
nonpublic information systems by an authorized user (or an information system)
communicating through an external, non-organization-controlled network. Remote
access methods include, for example, dial-up, broadband, and wireless.This
requirement only applies to components where this is specific to the function
of the device or has the concept of an organizational user (e.g., VPN, proxy
capability). This does not apply to authentication for the purpose of
configuring the device itself (management).Requires further clarification from
NIST."
  impact 0.5
  tag "severity": nil
  tag "gtitle": "SRG-OS-000375-GPOS-00160"
  tag "satisfies": ["SRG-OS-000375-GPOS-00160", "SRG-OS-000375-GPOS-00161",
"SRG-OS-000375-GPOS-00162"]
  tag "gid": "V-72417"
  tag "rid": "SV-87041r2_rule"
  tag "stig_id": "RHEL-07-041001"
  tag "fix_id": "F-78769r3_fix"
  tag "cci": ["CCI-001948", "CCI-001953", "CCI-001954"]
  tag "nist": ["IA-2 (11)", "IA-2 (12)", "IA-2 (12)", "Rev_4"]
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
  tag "check": "Verify the operating system has the packages required for
multifactor authentication installed.Check for the presence of the packages
required to support multifactor authentication with the following commands:#
yum list installed escesc-1.1.0-26.el7.noarch.rpm# yum list installed
pam_pkcs11pam_pkcs11-0.6.2-14.el7.noarch.rpm# yum list installed
authconfig-gtkauthconfig-gtk-6.1.12-19.el7.noarch.rpmIf the \"esc\",
\"pam_pkcs11\", and \"authconfig-gtk\" packages are not installed, this is a
finding."
  tag "fix": "Configure the operating system to implement multifactor
authentication by installing the required packages.Install the \"esc\",
\"pam_pkcs11\", \"authconfig\", and \"authconfig-gtk\" packages on the system
with the following command:# yum install esc pam_pkcs11 authconfig-gtk"
end

