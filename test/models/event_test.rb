require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new(name: 'Weekend bashment', description: 'parte after parte after parte',
                       location: 'kampala', date: '2020-10-31, 16:13:09 ', creator_id: 1)
  end

  test 'name of event should be present' do
    @event.name = ' '
    assert_not @event.valid?
  end

  test 'event description should be present' do
    @event.description = ' '
    assert_not @event.valid?
  end

  test 'event location should be present' do
    @event.location = ' '
    assert_not @event.valid?
  end
end
