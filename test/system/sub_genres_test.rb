require "application_system_test_case"

class SubGenresTest < ApplicationSystemTestCase
  setup do
    @sub_genre = sub_genres(:one)
  end

  test "visiting the index" do
    visit sub_genres_url
    assert_selector "h1", text: "Sub Genres"
  end

  test "creating a Sub genre" do
    visit sub_genres_url
    click_on "New Sub Genre"

    click_on "Create Sub genre"

    assert_text "Sub genre was successfully created"
    click_on "Back"
  end

  test "updating a Sub genre" do
    visit sub_genres_url
    click_on "Edit", match: :first

    click_on "Update Sub genre"

    assert_text "Sub genre was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub genre" do
    visit sub_genres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub genre was successfully destroyed"
  end
end
