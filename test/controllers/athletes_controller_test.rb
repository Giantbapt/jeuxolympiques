require 'test_helper'

class AthletesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @athlete = athletes(:one)
  end

  test "should get index" do
    get athletes_url
    assert_response :success
  end

  test "should get new" do
    get new_athlete_url
    assert_response :success
  end

  test "should create athlete" do
    assert_difference('Athlete.count') do
      post athletes_url, params: { athlete: { bronze: @athlete.bronze, edition: @athlete.edition, first_participation: @athlete.first_participation, gold: @athlete.gold, name: @athlete.name, nationality: @athlete.nationality, number_of_medals: @athlete.number_of_medals, number_of_paticipations: @athlete.number_of_paticipations, silver: @athlete.silver, sport: @athlete.sport, year_of_birth: @athlete.year_of_birth } }
    end

    assert_redirected_to athlete_url(Athlete.last)
  end

  test "should show athlete" do
    get athlete_url(@athlete)
    assert_response :success
  end

  test "should get edit" do
    get edit_athlete_url(@athlete)
    assert_response :success
  end

  test "should update athlete" do
    patch athlete_url(@athlete), params: { athlete: { bronze: @athlete.bronze, edition: @athlete.edition, first_participation: @athlete.first_participation, gold: @athlete.gold, name: @athlete.name, nationality: @athlete.nationality, number_of_medals: @athlete.number_of_medals, number_of_paticipations: @athlete.number_of_paticipations, silver: @athlete.silver, sport: @athlete.sport, year_of_birth: @athlete.year_of_birth } }
    assert_redirected_to athlete_url(@athlete)
  end

  test "should destroy athlete" do
    assert_difference('Athlete.count', -1) do
      delete athlete_url(@athlete)
    end

    assert_redirected_to athletes_url
  end
end
