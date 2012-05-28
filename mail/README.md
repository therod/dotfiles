# Mail with mutt, offlineimap, msmtp and mu

**Important:** Make sure that you have all the necessary dependencies installed first. If you are on OS X just run `rake dependencies` from the
.dotfiles root directory.

## mutt

This is the application that will be used for reading, writing and sending emails. 
Following configuraiton files need to be updated to your needs:

1. ``/mutt.symlink/account.example``
Duplicate this file for each Account that you want to configure and rename it to
something like "gmail" or "workexchange". Edit the content of the file. Further
information is documented inside the file.

2. ``./mutt.symlink/muttrc``
This is the main mutt configuration file. Use it to configure application
behaviour and keybindings.<br> **Important:** Make sure to modify the
"Main configuration" section according to your account information.

3. ``./mutt.symlink/mailcap``
This file tells mutt what applications should be used for certain filetypes.

4. ``./mutt.symlink/cnametrans.py``
Python script that translates Gmail IMAP folder names to something more usable.

5. ``./mutt.symlink/colors``
Color scheme for mutt. Disable it in muttrc if you don't need custom colors.

6. ``./mutt.symlink/sig.example``
Rename this file into `sig` and put your custom Signature in it.

## offlineimap

1. ``./offlineimaprc.symlink.example``
Rename this file into `offlineimaprc.symlink` and configure your email account.
More information can be found inside the file.

After initial setup run `offlineimap` from the command line to sync down all
email messages.

## msmtp

1. ``./msmtprc.symlink.example``
Rename this file into `msmtprc.symlink` and configure the SMTP server.

### Helpful links
[mutt cheatsheet](http://sheet.shiar.nl/mutt)
