Feature: Add A Poem

  In order to make my voice heard
  As a contributor
  I want to be able to write a poem and publish it on the site
  
  Scenario: A user write a poem and submits it
    
    When I go to the new poem page
    Then I should see a form
    
    When I fill in "Your Poem" with "some poem text"
    And I press "That's my poem"
    
    Then I should see "success"
    And I should see "some poem text"