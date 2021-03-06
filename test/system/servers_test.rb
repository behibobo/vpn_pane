require "application_system_test_case"

class ServersTest < ApplicationSystemTestCase
  setup do
    @server = servers(:one)
  end

  test "visiting the index" do
    visit servers_url
    assert_selector "h1", text: "Servers"
  end

  test "creating a Server" do
    visit servers_url
    click_on "New Server"

    fill_in "Country", with: @server.country
    fill_in "Flag", with: @server.flag
    fill_in "Ip", with: @server.ip
    fill_in "Password", with: @server.password
    check "Premuim" if @server.premuim
    fill_in "Username", with: @server.username
    click_on "Create Server"

    assert_text "Server was successfully created"
    click_on "Back"
  end

  test "updating a Server" do
    visit servers_url
    click_on "Edit", match: :first

    fill_in "Country", with: @server.country
    fill_in "Flag", with: @server.flag
    fill_in "Ip", with: @server.ip
    fill_in "Password", with: @server.password
    check "Premuim" if @server.premuim
    fill_in "Username", with: @server.username
    click_on "Update Server"

    assert_text "Server was successfully updated"
    click_on "Back"
  end

  test "destroying a Server" do
    visit servers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Server was successfully destroyed"
  end
end
