# File Created by Joseph Freivald
# Copyright (c) 2015
# All Rights Reserved. Use pursuant to Joseph Freivald's instructions.

RSpec.configure do |config|
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
