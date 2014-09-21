stripe2qif4unitedstates
=======================

Pulls data through Stripe API to get the list of transfers and exports in QIF format file.

QIF file can be uploaded to QuickBooks Online or, my purpose, Xero cloud accounting software.

I need to get the card processing feeds into Xero. I created a separate account called 'Stripe' and import statments every quarter. Make sure you keep track of your last import to avoid duplicate transactions.


DETAILS:

The motivation for this is Stripe will deposit money directly to my bank, Wells Fargo, but Stripe is not a bank in itself. Xero dedects the deposits to Wells Fargo but these amounts are after credit card process fees were taken. Stripe is not a bank or an institution that Xero can integrate with so Xero cannot pull bank feeds from Stripe and Xero does not pickup the credit card processsing fees (expenses)
