stripe2qif4unitedstates
=======================

# U.S. Version of stripe2qi

Uses U.S. formatted dates of "MM/DD/YYYY".

Pulls data through Stripe API to get the list of transfers and exports in QIF format file.

QIF file can be uploaded to QuickBooks Online or, my purpose, Xero cloud accounting software.

I need to get the card processing feeds into Xero. I created a separate account called 'Stripe' and import statments every quarter. Make sure you keep track of your last import to avoid duplicate transactions.

# Example Usage and Workflow

## Setup your API key in Stripe

Google for help from Stripe for how to do this.

This API key will got in the parameter for argument "--api-key".


## Create the QIF export.

`ruby stripe2qif.rb --api-key your_stripe_api_key_here_this_is_not_mylivekey --from 01/04/2014 > ~/tmp/stripe-transactions-2014-07-11-with-net.txt`

## If using Xero, switch to your test account in Xero.

## Create a test account called 'Stripe'.

## Import the QIF file

## Reconcile the transactions and see if this works for you.

## Switch to your real Xero account, create a Stripe account, import and happy reconcilition with card processing fees!

# Details and Motivation

Stripe will deposit money directly to my bank, Wells Fargo, but I think Stripe is not a bank in itself. Xero dedects the deposits to Wells Fargo but these amounts are after credit card process fees were taken. Either Stripe is not a bank or an institution that Xero can integrate with. Bottomline Xero cannot pull bank feeds from Stripe so Xero does not pickup the card processsing fees (expenses) that I need to be detected for true bookkeeping and accurate accounting.
