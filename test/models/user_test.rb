#!/usr/bin/env ruby
Coveralls.wear!
require_relative '../spec_helper'
require_relative '../../config/environment'
require 'minitest/spec'
require 'minitest/autorun'
require 'coveralls'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Tony', email: 'maraco@negosio.com', password: '12345')
    @user.instructor = false
  end

  test 'usuario válido' do
    assert @user.valid?
  end

  test 'inválido sin nombre' do
    @user.name = nil
    refute @user.valid?, 'el usuario no es válido, se requiere el nombre'
    assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'inválido sin email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end
end