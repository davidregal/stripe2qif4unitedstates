stripe2qif4unitedstates
=======================

# Summary

Pulls data through Stripe API to get the card processing fees in QIF format file.

QIF file can be uploaded to QuickBooks Online or, my purpose, Xero cloud accounting software.

I need to get the card processing fees into Xero so all my expenses are accounted for Techborder, LLC. I created a separate account called 'Stripe' and import statments every quarter. Make sure you keep track of your last import to avoid duplicate transactions.

# Modified version of stripe2qif

Forked from stripe2qif (Thanks).

## Date format changed

Uses U.S. formatted dates of "MM/DD/YYYY".

## Only exports card processing fees.

You can easily modify to include net and gross amount. See the fork from or older versions for the code.

# Example Usage and Workflow

## Setup your API key in Stripe

Google for help from Stripe for how to do this.

This API key will got in the parameter for argument "--api-key".


## Create the QIF export.

`ruby stripe2qif.rb --api-key your_stripe_api_key_here_this_is_not_mylivekey --from 01/04/2014 > ~/tmp/stripe-card-processing-fees.qif`

## If using Xero, switch to your test account in Xero.

## Create a test account called 'Stripe'.

## Import the QIF file

## Reconcile the transactions and see if this works for you.

## Switch to your real Xero account, create a Stripe account, import and happy reconcilition with card processing fees!

# Details of motivation

Stripe will deposit money directly to my bank, Wells Fargo, but I think Stripe is not a bank in itself. Xero dedects the deposits to Wells Fargo but these amounts are after credit card process fees were taken. Either Stripe is not a bank or an institution that Xero can integrate with. Bottomline Xero cannot pull bank feeds from Stripe so Xero does not pickup the card processsing fees (expenses) that I need to be detected for true bookkeeping and accurate accounting.
