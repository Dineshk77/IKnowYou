Feature: Search feature

  Scenario: To check on the search result

  	Given I load properties for "search" feature
  	Then I wait for "home" screen
  	Then I click "emailLogin" button at "home" screen
  	Then I fill "login" form for "emailLogin"
  	Then I search for item "Porsche" at "home" screen
