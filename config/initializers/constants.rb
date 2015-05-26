#!/usr/bin/env ruby

MAX_NAME_LENGTH = 20
MAX_MAC_LENGTH = 36
MAX_IP_LENGTH = 32

ARTICATECH_REGEX = /@articatech\.com/
ARTICATECH_CLIENT_EMAIL = 'david@articatech.com'

SISLAND_REGEX = /^sisland_/
SISLAND_CLIENT_EMAIL = 'info@sislandsoft.com'
SISLAND_EMAILS = [ 'demo@sislandsoft.com' ]

SEQURE_REGEX = /@sequreisp\.com/
SEQURE_CLIENT_EMAIL = 'lsalas@sequre.com.ar'

MAC_REGEX = /^[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]$/
IP_REGEX = /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
