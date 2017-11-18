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
  
  it "Carga la página de registro" do
    visit '/registro'
    expect(200).to eq(page.status_code)
  end
end
