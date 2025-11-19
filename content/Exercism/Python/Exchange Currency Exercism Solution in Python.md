---
tags:
  - exercism
  - python
  - dsa
description: Notes and solutions for the exchange currency Exercism challenge in Python
---
## Intro

- https://exercism.org/tracks/python/exercises/currency-exchange

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/python

## Solution

```python
def exchange_money(budget, exchange_rate):
    """
    :param budget: float - amount of money you are planning to exchange.
    :param exchange_rate: float - unit value of the foreign currency.
    :return: float - exchanged value of the foreign currency you can receive.
    """

    return budget / exchange_rate


def get_change(budget, exchanging_value):
    """
    :param budget: float - amount of money you own.
    :param exchanging_value: float - amount of your money you want to exchange now.
    :return: float - amount left of your starting currency after exchanging.
    """

    return budget - exchanging_value


def get_value_of_bills(denomination, number_of_bills):
    """
    :param denomination: int - the value of a bill.
    :param number_of_bills: int - total number of bills.
    :return: int - calculated value of the bills.
    """

    return denomination * number_of_bills


def get_number_of_bills(amount, denomination):
    """
    :param amount: float - the total starting value.
    :param denomination: int - the value of a single bill.
    :return: int - number of bills that can be obtained from the amount.
    """

    return amount // denomination


def get_leftover_of_bills(amount, denomination):
    """
    :param amount: float - the total starting value.
    :param denomination: int - the value of a single bill.
    :return: float - the amount that is "leftover", given the current denomination.
    """

    return amount % denomination


def exchangeable_value(budget, exchange_rate, spread, denomination):
    """
    Computes the maximum exchange value in the target currency.

    The spread is threated as a percentage and added to the exchange
    rate.

    Because there are no fractional bills, it is likely that some
    remainder amount will be lost in some transactions.

    :param budget: float - the amount of your money you are planning to exchange.
    :param exchange_rate: float - the unit value of the foreign currency.
    :param spread: int - percentage that is taken as an exchange fee.
    :param denomination: int - the value of a single bill.
    :return: int - maximum value you can get.
    """

    ##
    # New exchange rate taking the spread into consideration.
    #
    rate_with_spread = exchange_rate + (spread / 100 * exchange_rate)

    ##
    # The total target currency.
    #
    exchanged_money = exchange_money(budget, rate_with_spread)

    ##
    # The number of complete bills (not fractional) in the target
    # currency.
    #
    exchanged_bills = get_number_of_bills(exchanged_money, denomination)

    ##
    # The maxium value in the target currency consisting only of
    # complete bills.
    #
    return exchanged_bills * denomination
```

### Explanation

The functions to be implemented in this challenge are mostly easy. The last one, however, `exchangeable_value()` can be a bit tricky. But here is what it boils down to.

- First, we need to treat the spread as a percentage and add it to the exchange rate. To do that, divide the spread by 100 and multiply that result by the exchange rate and add that result to the exchange rate.
- Then, from that result, compute the amount in the target currency using the `exchange_money()` function previously implemented.
- From the amount in the target currency, compute how many (entire) bills can be had given the denomination using the `get_number_of_bills()` function previously implemented. Some left over fractional will potentially be lost because of this.
- Finally, multiply the number of bills in the target currency by the denomination to get the final result.
