# frozen_string_literal: true

# spec/caesar_cipher_spec.rb

require_relative '../My_Ruby/caesar_cipher' # Adjust the path as needed
require 'spec_helper'

RSpec.describe '#caesar_cipher' do
  it 'shifts lowercase letters correctly' do
    expect(caesar_cipher('abc', 3)).to eq('def')
  end

  it 'shifts uppercase letters correctly' do
    expect(caesar_cipher('ABC', 3)).to eq('DEF')
  end

  it 'wraps around the alphabet for lowercase' do
    expect(caesar_cipher('xyz', 3)).to eq('abc')
  end

  it 'wraps around the alphabet for uppercase' do
    expect(caesar_cipher('XYZ', 3)).to eq('ABC')
  end

  it 'does not shift non-letter characters' do
    expect(caesar_cipher('Hello, World!', 3)).to eq('Khoor, Zruog!')
  end
end
