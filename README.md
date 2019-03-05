# pwCheck
A simple bash script to use hashcat to test password strength.

It *must* be run in your hashcat directory.

It takes the password, MD5 hashes it, then runs the hash against rockyou with best64.rule. A simple way to identify low hanging fruit for your friends and family and illustrate just how weak some passwords are.
