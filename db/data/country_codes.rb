#!/usr/bin/env ruby

country_codes = [
  { :name => "Afghanistan", :code => "AF", :disabled => true },
  { :name => "Aland Islands", :code => "AX", :disabled => true },
  { :name => "Albania", :code => "AL", :disabled => true },
  { :name => "Algeria", :code => "DZ", :disabled => true },
  { :name => "American Samoa", :code => "AS", :disabled => true },
  { :name => "Andorra", :code => "AD", :disabled => true },
  { :name => "Angola", :code => "AO", :disabled => true },
  { :name => "Anguilla", :code => "AI", :disabled => true },
  { :name => "Antarctica", :code => "AQ", :disabled => true },
  { :name => "Antigua And Barbuda", :code => "AG", :disabled => true },
  { :name => "Argentina", :code => "AR", :disabled => true },
  { :name => "Armenia", :code => "AM", :disabled => true },
  { :name => "Aruba", :code => "AW", :disabled => true },
  { :name => "Australia", :code => "AU", :disabled => true },
  { :name => "Austria", :code => "AT", :disabled => true },
  { :name => "Azerbaijan", :code => "AZ", :disabled => true },
  { :name => "Bahamas", :code => "BS", :disabled => true },
  { :name => "Bahrain", :code => "BH", :disabled => true },
  { :name => "Bangladesh", :code => "BD", :disabled => true },
  { :name => "Barbados", :code => "BB", :disabled => true },
  { :name => "Belarus", :code => "BY", :disabled => true },
  { :name => "Belgium", :code => "BE", :disabled => true },
  { :name => "Belize", :code => "BZ", :disabled => true },
  { :name => "Benin", :code => "BJ", :disabled => true },
  { :name => "Bermuda", :code => "BM", :disabled => true },
  { :name => "Bhutan", :code => "BT", :disabled => true },
  { :name => "Bosnia And Herzegovina", :code => "BA", :disabled => true },
  { :name => "Botswana", :code => "BW", :disabled => true },
  { :name => "Bouvet Island", :code => "BV", :disabled => true },
  { :name => "Brazil", :code => "BR", :disabled => true },
  { :name => "British Indian Ocean Territory", :code => "IO", :disabled => true },
  { :name => "Brunei Darussalam", :code => "BN", :disabled => true },
  { :name => "Bulgaria", :code => "BG", :disabled => true },
  { :name => "Burkina Faso", :code => "BF", :disabled => true },
  { :name => "Burundi", :code => "BI", :disabled => true },
  { :name => "Cambodia", :code => "KH", :disabled => true },
  { :name => "Cameroon", :code => "CM", :disabled => true },
  { :name => "Canada", :code => "CA", :disabled => true },
  { :name => "Cape Verde", :code => "CV", :disabled => true },
  { :name => "Cayman Islands", :code => "KY", :disabled => true },
  { :name => "Central African Republic", :code => "CF", :disabled => true },
  { :name => "Chad", :code => "TD", :disabled => true },
  { :name => "Chile", :code => "CL", :disabled => true },
  { :name => "China", :code => "CN", :disabled => true },
  { :name => "Christmas Island", :code => "CX", :disabled => true },
  { :name => "Cocos (Keeling) Islands", :code => "CC", :disabled => true },
  { :name => "Colombia", :code => "CO", :disabled => true },
  { :name => "Comoros", :code => "KM", :disabled => true },
  { :name => "Congo", :code => "CG", :disabled => true },
  { :name => "Cook Islands", :code => "CK", :disabled => true },
  { :name => "Costa Rica", :code => "CR", :disabled => true },
  { :name => "Cote D'Ivoire", :code => "CI", :disabled => true },
  { :name => "Croatia", :code => "HR", :disabled => true },
  { :name => "Cuba", :code => "CU", :disabled => true },
  { :name => "Cyprus", :code => "CY", :disabled => true },
  { :name => "Czech Republic", :code => "CZ", :disabled => true },
  { :name => "Denmark", :code => "DK", :disabled => true },
  { :name => "Djibouti", :code => "DJ", :disabled => true },
  { :name => "Dominica", :code => "DM", :disabled => true },
  { :name => "Dominican Republic", :code => "DO", :disabled => true },
  { :name => "Ecuador", :code => "EC", :disabled => true },
  { :name => "Egypt", :code => "EG", :disabled => true },
  { :name => "El Salvador", :code => "SV", :disabled => true },
  { :name => "Equatorial Guinea", :code => "GQ", :disabled => true },
  { :name => "Eritrea", :code => "ER", :disabled => true },
  { :name => "Estonia", :code => "EE", :disabled => true },
  { :name => "Ethiopia", :code => "ET", :disabled => true },
  { :name => "Falkland Islands (Malvinas)", :code => "FK", :disabled => true },
  { :name => "Faroe Islands", :code => "FO", :disabled => true },
  { :name => "Fiji", :code => "FJ", :disabled => true },
  { :name => "Finland", :code => "FI", :disabled => true },
  { :name => "France", :code => "FR", :disabled => true },
  { :name => "French Guiana", :code => "GF", :disabled => true },
  { :name => "French Polynesia", :code => "PF", :disabled => true },
  { :name => "French Southern Territories", :code => "TF", :disabled => true },
  { :name => "Gabon", :code => "GA", :disabled => true },
  { :name => "Gambia", :code => "GM", :disabled => true },
  { :name => "Georgia", :code => "GE", :disabled => true },
  { :name => "Germany", :code => "DE", :disabled => true },
  { :name => "Ghana", :code => "GH", :disabled => true },
  { :name => "Gibraltar", :code => "GI", :disabled => true },
  { :name => "Greece", :code => "GR", :disabled => true },
  { :name => "Greenland", :code => "GL", :disabled => true },
  { :name => "Grenada", :code => "GD", :disabled => true },
  { :name => "Guadeloupe", :code => "GP", :disabled => true },
  { :name => "Guam", :code => "GU", :disabled => true },
  { :name => "Guatemala", :code => "GT", :disabled => true },
  { :name => "Guernsey", :code => "GG", :disabled => true },
  { :name => "Guinea", :code => "GN", :disabled => true },
  { :name => "Guinea-Bissau", :code => "GW", :disabled => true },
  { :name => "Guyana", :code => "GY", :disabled => true },
  { :name => "Haiti", :code => "HT", :disabled => true },
  { :name => "Heard Island And Mcdonald Islands", :code => "HM", :disabled => true },
  { :name => "Holy See (Vatican City State)", :code => "VA", :disabled => true },
  { :name => "Honduras", :code => "HN", :disabled => true },
  { :name => "Hong Kong", :code => "HK", :disabled => true },
  { :name => "Hungary", :code => "HU", :disabled => true },
  { :name => "Iceland", :code => "IS", :disabled => true },
  { :name => "India", :code => "IN", :disabled => true },
  { :name => "Indonesia", :code => "ID", :disabled => true },
  { :name => "Iraq", :code => "IQ", :disabled => true },
  { :name => "Ireland", :code => "IE", :disabled => true },
  { :name => "Isle Of Man", :code => "IM", :disabled => true },
  { :name => "Israel", :code => "IL", :disabled => true },
  { :name => "Italy", :code => "IT", :disabled => true },
  { :name => "Jamaica", :code => "JM", :disabled => true },
  { :name => "Japan", :code => "JP", :disabled => true },
  { :name => "Jersey", :code => "JE", :disabled => true },
  { :name => "Jordan", :code => "JO", :disabled => true },
  { :name => "Kazakhstan", :code => "KZ", :disabled => true },
  { :name => "Kenya", :code => "KE", :disabled => true },
  { :name => "Kiribati", :code => "KI", :disabled => true },
  { :name => "Democratic People'S Republic Of Korea", :code => "KP", :disabled => true },
  { :name => "Republic Of Korea", :code => "KR", :disabled => true },
  { :name => "Kuwait", :code => "KW", :disabled => true },
  { :name => "Kyrgyzstan", :code => "KG", :disabled => true },
  { :name => "Lao People'S Democratic Republic", :code => "LA", :disabled => true },
  { :name => "Latvia", :code => "LV", :disabled => true },
  { :name => "Lebanon", :code => "LB", :disabled => true },
  { :name => "Lesotho", :code => "LS", :disabled => true },
  { :name => "Liberia", :code => "LR", :disabled => true },
  { :name => "Libyan Arab Jamahiriya", :code => "LY", :disabled => true },
  { :name => "Liechtenstein", :code => "LI", :disabled => true },
  { :name => "Lithuania", :code => "LT", :disabled => true },
  { :name => "Luxembourg", :code => "LU", :disabled => true },
  { :name => "Macao", :code => "MO", :disabled => true },
  { :name => "Madagascar", :code => "MG", :disabled => true },
  { :name => "Malawi", :code => "MW", :disabled => true },
  { :name => "Malaysia", :code => "MY", :disabled => true },
  { :name => "Maldives", :code => "MV", :disabled => true },
  { :name => "Mali", :code => "ML", :disabled => true },
  { :name => "Malta", :code => "MT", :disabled => true },
  { :name => "Marshall Islands", :code => "MH", :disabled => true },
  { :name => "Martinique", :code => "MQ", :disabled => true },
  { :name => "Mauritania", :code => "MR", :disabled => true },
  { :name => "Mauritius", :code => "MU", :disabled => true },
  { :name => "Mayotte", :code => "YT", :disabled => true },
  { :name => "Mexico", :code => "MX", :disabled => true },
  { :name => "Monaco", :code => "MC", :disabled => true },
  { :name => "Mongolia", :code => "MN", :disabled => true },
  { :name => "Montenegro", :code => "ME", :disabled => true },
  { :name => "Montserrat", :code => "MS", :disabled => true },
  { :name => "Morocco", :code => "MA", :disabled => true },
  { :name => "Mozambique", :code => "MZ", :disabled => true },
  { :name => "Myanmar", :code => "MM", :disabled => true },
  { :name => "Namibia", :code => "NA", :disabled => true },
  { :name => "Nauru", :code => "NR", :disabled => true },
  { :name => "Nepal", :code => "NP", :disabled => true },
  { :name => "Netherlands", :code => "NL", :disabled => true },
  { :name => "Netherlands Antilles", :code => "AN", :disabled => true },
  { :name => "New Caledonia", :code => "NC", :disabled => true },
  { :name => "New Zealand", :code => "NZ", :disabled => true },
  { :name => "Nicaragua", :code => "NI", :disabled => true },
  { :name => "Niger", :code => "NE", :disabled => true },
  { :name => "Nigeria", :code => "NG", :disabled => true },
  { :name => "Niue", :code => "NU", :disabled => true },
  { :name => "Norfolk Island", :code => "NF", :disabled => true },
  { :name => "Northern Mariana Islands", :code => "MP", :disabled => true },
  { :name => "Norway", :code => "NO", :disabled => true },
  { :name => "Oman", :code => "OM", :disabled => true },
  { :name => "Pakistan", :code => "PK", :disabled => true },
  { :name => "Palau", :code => "PW", :disabled => true },
  { :name => "Panama", :code => "PA", :disabled => true },
  { :name => "Papua New Guinea", :code => "PG", :disabled => true },
  { :name => "Paraguay", :code => "PY", :disabled => true },
  { :name => "Peru", :code => "PE", :disabled => true },
  { :name => "Philippines", :code => "PH", :disabled => true },
  { :name => "Pitcairn", :code => "PN", :disabled => true },
  { :name => "Poland", :code => "PL", :disabled => true },
  { :name => "Portugal", :code => "PT", :disabled => true },
  { :name => "Puerto Rico", :code => "PR", :disabled => true },
  { :name => "Qatar", :code => "QA", :disabled => true },
  { :name => "Reunion", :code => "RE", :disabled => true },
  { :name => "Romania", :code => "RO", :disabled => true },
  { :name => "Russian Federation", :code => "RU", :disabled => true },
  { :name => "Rwanda", :code => "RW", :disabled => true },
  { :name => "Saint Barthelemy", :code => "BL", :disabled => true },
  { :name => "Saint Kitts And Nevis", :code => "KN", :disabled => true },
  { :name => "Saint Lucia", :code => "LC", :disabled => true },
  { :name => "Saint Martin", :code => "MF", :disabled => true },
  { :name => "Saint Pierre And Miquelon", :code => "PM", :disabled => true },
  { :name => "Saint Vincent And The Grenadines", :code => "VC", :disabled => true },
  { :name => "Samoa", :code => "WS", :disabled => true },
  { :name => "San Marino", :code => "SM", :disabled => true },
  { :name => "Sao Tome And Principe", :code => "ST", :disabled => true },
  { :name => "Saudi Arabia", :code => "SA", :disabled => true },
  { :name => "Senegal", :code => "SN", :disabled => true },
  { :name => "Serbia", :code => "RS", :disabled => true },
  { :name => "Seychelles", :code => "SC", :disabled => true },
  { :name => "Sierra Leone", :code => "SL", :disabled => true },
  { :name => "Singapore", :code => "SG", :disabled => true },
  { :name => "Slovakia", :code => "SK", :disabled => true },
  { :name => "Slovenia", :code => "SI", :disabled => true },
  { :name => "Solomon Islands", :code => "SB", :disabled => true },
  { :name => "Somalia", :code => "SO", :disabled => true },
  { :name => "South Africa", :code => "ZA", :disabled => true },
  { :name => "South Georgia And The South Sandwich Islands", :code => "GS", :disabled => true },
  { :name => "Spain", :code => "ES", :disabled => true },
  { :name => "Sri Lanka", :code => "LK", :disabled => true },
  { :name => "Sudan", :code => "SD", :disabled => true },
  { :name => "Suriname", :code => "SR", :disabled => true },
  { :name => "Svalbard And Jan Mayen", :code => "SJ", :disabled => true },
  { :name => "Swaziland", :code => "SZ", :disabled => true },
  { :name => "Sweden", :code => "SE", :disabled => true },
  { :name => "Switzerland", :code => "CH", :disabled => true },
  { :name => "Syrian Arab Republic", :code => "SY", :disabled => true },
  { :name => "Tajikistan", :code => "TJ", :disabled => true },
  { :name => "Thailand", :code => "TH", :disabled => true },
  { :name => "Timor-Leste", :code => "TL", :disabled => true },
  { :name => "Togo", :code => "TG", :disabled => true },
  { :name => "Tokelau", :code => "TK", :disabled => true },
  { :name => "Tonga", :code => "TO", :disabled => true },
  { :name => "Trinidad And Tobago", :code => "TT", :disabled => true },
  { :name => "Tunisia", :code => "TN", :disabled => true },
  { :name => "Turkey", :code => "TR", :disabled => true },
  { :name => "Turkmenistan", :code => "TM", :disabled => true },
  { :name => "Turks And Caicos Islands", :code => "TC", :disabled => true },
  { :name => "Tuvalu", :code => "TV", :disabled => true },
  { :name => "Uganda", :code => "UG", :disabled => true },
  { :name => "Ukraine", :code => "UA", :disabled => true },
  { :name => "United Arab Emirates", :code => "AE", :disabled => true },
  { :name => "United Kingdom", :code => "GB", :disabled => true },
  { :name => "United States", :code => "US", :disabled => true },
  { :name => "United States Minor Outlying Islands", :code => "UM", :disabled => true },
  { :name => "Uruguay", :code => "UY", :disabled => true },
  { :name => "Uzbekistan", :code => "UZ", :disabled => true },
  { :name => "Vanuatu", :code => "VU", :disabled => true },
  { :name => "Viet Nam", :code => "VN", :disabled => true },
  { :name => "Wallis And Futuna", :code => "WF", :disabled => true },
  { :name => "Western Sahara", :code => "EH", :disabled => true },
  { :name => "Yemen", :code => "YE", :disabled => true },
  { :name => "Zambia", :code => "ZM", :disabled => true },
  { :name => "Zimbabwe", :code => "ZW", :disabled => true },
]

Country.create( country_codes )
