Feature: Manage battle_mechs
  In order to manage BattleMechs
  The mech engineer
  wants correct crud operations
  
  Scenario: Go to the BattleMech index
    Given I am on the home page
    When I follow "BattleMechs"
    Then I should be on the BattleMech list
      And I should see "BattleMech list"
  
  Scenario: Create new BattleMech
    Given I am on the new BattleMech form
    When I fill in "battle_mech_code" with "QKD-4G"
      And I fill in "battle_mech_name" with "Quickdraw"
      And I fill in "battle_mech_mass" with "60"
      And I fill in "battle_mech_manufacturer" with "Technicron Manufacturing"
      And I fill in "battle_mech_chassis" with "Technicron Type E"
      And I fill in "battle_mech_power_plant" with "Vlar 300"
      And I fill in "battle_mech_jump_jets" with "Chilton 460"
      And I fill in "battle_mech_armor" with "Riese-47S"
      And I fill in "battle_mech_comm_system" with "Garret T12E"
      And I fill in "battle_mech_tt_system" with "Dynatec 2180"
      And I fill in "battle_mech_cruising_speed" with "42"
      And I fill in "battle_mech_maximum_speed" with "67"
      And I fill in "battle_mech_jump_capacity" with "150"
      And I press "Done"
    Then I should be on "QKD-4G" show BattleMech page
      And I should see "BattleMech was successfully created."
      And I should see "QKD-4G"

  Scenario: Show BattleMech
    Given the following battle_mechs:
      | code   | name      | mass | manufacturer                 | chassis        | power_plant | jump_jets | armor      | comm_system     | tt_system      | cruising_speed | maximum_speed | jump_capacity |
      | BNC-3E | Banshee   | 95   | Star League Weapons Research | Star League XT | GM 380      |           | Starshield | Dalban Commline | Dalban HiRez-B | 43             | 65            | 0             |
      And I am on the BattleMech list
    When I follow "Show"
    Then I should be on "BNC-3E" show BattleMech page
      And I should see "BNC-3E"
      
  Scenario: Edit BattleMech
    Given the following battle_mechs:
      | code   | name      | mass | manufacturer                 | chassis        | power_plant | jump_jets | armor      | comm_system     | tt_system      | cruising_speed | maximum_speed | jump_capacity |
      | BNC-3E | Banshee   | 95   | Star League Weapons Research | Star League XT | GM 380      |           | Starshield | Dalban Commline | Dalban HiRez-B | 43             | 65            | 0             |
      And I am on the BattleMech list
    When I follow "Edit"
    Then I should be on "BNC-3E" edit BattleMech form
      
  Scenario: Update BattleMech
    Given the following battle_mechs:
      | code   | name      | mass | manufacturer                 | chassis        | power_plant | jump_jets | armor      | comm_system     | tt_system      | cruising_speed | maximum_speed | jump_capacity |
      | BNC-3E | Banshee   | 95   | Star League Weapons Research | Star League XT | GM 380      |           | Starshield | Dalban Commline | Dalban HiRez-B | 43             | 65            | 0             |
      And I am on "BNC-3E" edit BattleMech form
    When I fill in "battle_mech_code" with "BNC-3S"
      And I press "Done"
    Then I should be on "BNC-3S" show BattleMech page
      And I should see "BNC-3S"
      And I should not see "BNC-3E"
      
  Scenario: Delete BattleMech
    Given the following battle_mechs:
      | code   | name      | mass | manufacturer                     | chassis             | power_plant | jump_jets   | armor                  | comm_system         | tt_system            | cruising_speed | maximum_speed | jump_capacity |
      | BNC-3E | Banshee   | 95   | Star League Weapons Research     | Star League XT      | GM 380      |             | Starshield             | Dalban Commline     | Dalban HiRez-B       | 43             | 65            | 0             |
      | CP10-Z | Cyclops   | 90   | Stormvanger Assemblies Unlimited | Stormvanger HV-7    | Hermes 360  |             | Starshield Special     | Olmstead 840 NavSat | Tracticon Tracer 280 | 42             | 62            | 0             |
      | AS7-D  | Atlas     | 100  | Na'ir, Hesperus, Quentin         | Foundation Type 10X | Vlar 300    |             | Durallex Heavy Special | Army Comm. Class 5  | Army Comp. Type 29K  | 32             | 54            | 0             |
      | WSP-1A | Wasp      | 20   | General Mechanics Incorporated   | 1A Type 3           | GM 120      | Rawlings 52 | Durallex light         | Duoteck 65          | Radcom TXX           | 66             | 95            | 180           |
      And I am on the BattleMech list
    When I delete the 3rd battle_mech
    Then I should see the following battle_mechs:
      | code   | name      | mass | manufacturer                     | chassis             | power_plant | jump_jets   | armor                  | comm_system         | tt_system            | cruising_speed | maximum_speed | jump_capacity |
      | BNC-3E | Banshee   | 95   | Star League Weapons Research     | Star League XT      | GM 380      |             | Starshield             | Dalban Commline     | Dalban HiRez-B       | 43             | 65            | 0             |
      | CP10-Z | Cyclops   | 90   | Stormvanger Assemblies Unlimited | Stormvanger HV-7    | Hermes 360  |             | Starshield Special     | Olmstead 840 NavSat | Tracticon Tracer 280 | 42             | 62            | 0             |
      | WSP-1A | Wasp      | 20   | General Mechanics Incorporated   | 1A Type 3           | GM 120      | Rawlings 52 | Durallex light         | Duoteck 65          | Radcom TXX           | 66             | 95            | 180           |
      
  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity/Celerity or Selenium2 (webdriver) when pages rely
  # on Javascript events. Only Culerity/Celerity supports clicking on confirmation
  # dialogs.
  #
  # Since Culerity/Celerity and Selenium2 has some overhead, Cucumber-Rails will
  # detect the presence of Javascript behind Delete links and issue a DELETE request 
  # instead of a GET request.
  #
  # You can turn this emulation off by tagging your scenario with @no-js-emulation.
  # Turning on browser testing with @selenium, @culerity, @celerity or @javascript
  # will also turn off the emulation. (See the Capybara documentation for 
  # details about those tags). If any of the browser tags are present, Cucumber-Rails
  # will also turn off transactions and clean the database with DatabaseCleaner 
  # after the scenario has finished. This is to prevent data from leaking into 
  # the next scenario.
  #
  # Another way to avoid Cucumber-Rails' javascript emulation without using any
  # of the tags above is to modify your views to use <button> instead. You can
  # see how in http://github.com/jnicklas/capybara/issues#issue/12
  #
  #Scenario: Delete battle_mech
  #  Given the following battle_mechs:
  #    ||
  #    ||
  #    ||
  #    ||
  #    ||
  #  When I delete the 3rd battle_mech
  #  Then I should see the following battle_mechs:
  #    ||
  #    ||
  #    ||
  #    ||
