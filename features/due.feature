Feature: Due

  So that I can see what needs to be done
  As a user
  I want to get a list of due items

  Background:
    Given a default config exists

  Scenario: Show todays date
    Given a todofile exists
    When I run `todotxt due` interactively
    Then it should pass with todays date

  Scenario: List due items
    Given the date is "2012-12-12"
    And a todofile with the following items exists:
      | todo                                                     |
      | 2012-11-17 Install todotxt due:2012-12-17 @cli +todotxt  |
      | Read documentation +todotxt                              |
      | Buy GTD book due:2012-12-12 @amazon +wishlist            |
      | Evaluate installation due:2012-12-19 +todotxt            |
    When I run `todotxt due` interactively
    Then it should pass with exactly:
      """
      Due today (2012-12-12)
      3. Buy GTD book due:2012-12-12 @amazon +wishlist

      Past-due items

      Due 7 days in advance
      1. 2012-11-17 Install todotxt due:2012-12-17 @cli +todotxt
      4. Evaluate installation due:2012-12-19 +todotxt

      """

  Scenario: list overdue items
    Given the date is "2012-12-12"
    And a todofile with the following items exists:
      | todo                                                     |
      | Install todotxt due:2012-12-17 @cli +todotxt             |
      | Read documentation +todotxt                              |
      | 2012-10-11 Buy GTD book due:2012-11-11 @amazon +wishlist |
    When I run `todotxt due` interactively
    Then it should pass with:
      """
      Past-due items
      3. 2012-10-11 Buy GTD book due:2012-11-11 @amazon +wishlist
      """
