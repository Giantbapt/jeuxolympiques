require "application_system_test_case"

class AthletesTest < ApplicationSystemTestCase
  setup do
    @athlete = athletes(:one)
  end

  test "visiting the index" do
    visit athletes_url
    assert_selector "h1", text: "Athletes"
  end

  test "creating a Athlete" do
    visit athletes_url
    click_on "New Athlete"

    fill_in "Bronze", with: @athlete.bronze
    fill_in "Edition", with: @athlete.edition
    fill_in "First participation", with: @athlete.first_participation
    fill_in "Gold", with: @athlete.gold
    fill_in "Name", with: @athlete.name
    fill_in "Nationality", with: @athlete.nationality
    fill_in "Number of medals", with: @athlete.number_of_medals
    fill_in "Number of paticipations", with: @athlete.number_of_paticipations
    fill_in "Silver", with: @athlete.silver
    fill_in "Sport", with: @athlete.sport
    fill_in "Year of birth", with: @athlete.year_of_birth
    click_on "Create Athlete"

    assert_text "Athlete was successfully created"
    click_on "Back"
  end

  test "updating a Athlete" do
    visit athletes_url
    click_on "Edit", match: :first

    fill_in "Bronze", with: @athlete.bronze
    fill_in "Edition", with: @athlete.edition
    fill_in "First participation", with: @athlete.first_participation
    fill_in "Gold", with: @athlete.gold
    fill_in "Name", with: @athlete.name
    fill_in "Nationality", with: @athlete.nationality
    fill_in "Number of medals", with: @athlete.number_of_medals
    fill_in "Number of paticipations", with: @athlete.number_of_paticipations
    fill_in "Silver", with: @athlete.silver
    fill_in "Sport", with: @athlete.sport
    fill_in "Year of birth", with: @athlete.year_of_birth
    click_on "Update Athlete"

    assert_text "Athlete was successfully updated"
    click_on "Back"
  end

  test "destroying a Athlete" do
    visit athletes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Athlete was successfully destroyed"
  end
end
