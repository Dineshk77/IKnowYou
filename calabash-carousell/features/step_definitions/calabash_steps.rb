require 'calabash-android/calabash_steps'

Given /^I load properties for "([^"]*)" feature$/ do|scenario|
    if scenario == "search"
        require File.join(File.dirname(__FILE__),'Config/searchProperties.rb')
    end
end

Then /^I wait for "([^"]*)" screen$/ do|location|
    checkId = SearchProperties::PROPERTIES["screen"][location]["pageCheckId"]
    wait_for(:timeout => 4) { element_exists("* id:'"+checkId+"'") }
end

Then /^I click "([^"]*)" button at "([^"]*)" screen$/ do|clickItem,location|
    clickId = SearchProperties::PROPERTIES["screen"][location]["button"][clickItem]
    touch("* id:'"+clickId+"'")
end

Then /^I fill "([^"]*)" form for "([^"]*)"$/ do |location,option|
    checkId = SearchProperties::PROPERTIES["screen"][location]["pageCheckId"]
    wait_for(:timeout => 4) { element_exists("* id:'"+checkId+"'") }
    formProps = SearchProperties::PROPERTIES["form"][location]
    forms = Forms.new formProps
    forms.submitForm(location)
end

Then /I "([^"]*)" the "([^"]*)" notification$/ do |action,popup|
    notificationProps = SearchProperties::PROPERTIES["notification"][popup]
    notification = Notification.new notificationProps
    notification.notificationAction(action)
end

Then /^I search for item "([^"]*)" at "([^"]*)" screen$/ do |text,location|
    searchProps = SearchProperties::PROPERTIES["search"][location]
    search = Search.new searchProps,text
    notificationProps = SearchProperties::PROPERTIES["notification"]["search"]
    search.searchItem(notificationProps)
    search.validateSearch()
end




