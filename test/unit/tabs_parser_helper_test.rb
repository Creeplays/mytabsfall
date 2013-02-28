require './app/helpers/tabs_parser_helper.rb'
require 'test/unit'

class TabsParserHelperTest < Test::Unit::TestCase
  def test_rejects_start_pipe_only
    tab = "|---"
    assert(!TabsParserHelper.validate(tab))
  end
end
