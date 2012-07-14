require 'test_helper'

class PageTest < ActiveSupport::TestCase
  fixtures :pages
  
test "the truth" do
    assert true
end

test "Page attributes must not be empty" do
page = Page.new
assert page.invalid?
assert page.errors[:title].any?
assert page.errors[:permalink].any?
assert page.errors[:body].any?
end

test "page is not valid without a unique title" do
page=Page.new(:title => pages(:ruby).title,
:permalink => 'www.ruby.com',
:body => "af;lkasjdflkasjfasdf;lkajfdk",
:created_at =>'2011-08-01 23:30:24',
:updated_at =>'2011-08-01 23:30:24')
assert !page.save
assert_equal "has already been taken", page.errors[:title].join('; ')
end

test "page is not valid without a unique title - i18n" do
page=Page.new(:title => pages(:ruby).title,
:permalink => 'www.ruby.com',
:body => "af;lkasjdflkasjfasdf;lkajfdk",
:created_at =>'2011-08-01 23:30:24',
:updated_at =>'2011-08-01 23:30:24')
assert !page.save
assert_equal I18n.translate('activerecord.errors.messages.taken'),
page.errors[:title].join('; ')
end

end


