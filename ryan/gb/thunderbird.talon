app: Thunderbird
-

go accounts: user.menu_select('Thunderbird|Account Settings')

new account: user.menu_select('File|New|Email Account…')

go (mail | mailboxes | inbox | inboxes): key(ctrl-1)

[thunderbird] (out | outbound) port: insert("587")
[thunderbird] (in | inbound | imap | eye map | i map) port: insert("993")

mail server:  insert("cloudhost-3267334.us-midwest-1.nxcli.net")
