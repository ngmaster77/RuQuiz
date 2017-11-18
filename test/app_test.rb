#!/usr/bin/env ruby
require_relative 'spec_helper'
require_relative '../config/environment'
require 'rspec'
require 'rspec/expectations'
require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'

Capybara.app = ApplicationController

describe '# Prueba de rutas', type: :feature do
  it 'Carga la página principal' do
    visit '/'
    expect(200).to eq(page.status_code)
  end

  it 'Carga la página de login' do
    visit '/login'
    expect(200).to eq(page.status_code)
  end

  it 'Carga la página de registro' do
    visit '/registro'
    expect(200).to eq(page.status_code)
  end
end

describe '# Prueba inicio de sesión/registro', type: :feature do
  it 'Login con usuario profesor' do
    visit '/login'
    fill_in 'name', with: 'profesor'
    fill_in 'password', with: '12345'
    click_button 'Log in'
    expect(200).to eq(page.status_code)
    expect(current_path).to eql('/home_profesor')
  end

  it 'Registro de usuario' do
    visit '/registro'
    fill_in 'name', with: 'testuser'
    fill_in 'email', with: 'testuser@test.com'
    fill_in 'password', with: '12345'
    choose('exampleRadios2') # no es profesor
    click_button 'Registro'
    expect(200).to eq(page.status_code)
    expect(current_path).to eql('/home_alumno')
    User.find_by(name: 'testuser').delete
  end
end
