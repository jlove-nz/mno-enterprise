# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app, class: MnoEnterprise::App do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "TestApp#{n}" }
    nid { name.parameterize }

    description "This is a description"
    created_at 1.day.ago
    updated_at 2.hours.ago
    logo "https://cdn.somedomain.com/app/2f4g2r474.jpg"
    website "https://www.testapp.com"
    slug { "#{id}-myapp" }
    categories ["CRM"]
    tags ['Foo', 'Bar']
    key_benefits ['Super', 'Hyper', 'Good']
    key_features ['Super', 'Hyper', 'Good']
    key_workflows ['1st workflow', '2nd workflow']
    known_limitations "No limitations"
    testimonials [{text: 'Bla', company: 'Doe Pty Ltd', author: 'John'}]
    worldwide_usage 120000
    tiny_description "A great app"
    stack 'cube'
    terms_url "http://opensource.org/licenses/MIT"
    support_url "http://example.com/su  pport"
    getting_started "Let's get started"
    appinfo { {} }
    average_rating { rand(1..5) }
    sequence(:rank) { |n| n }
    running_instances_count { rand(0..10) }
    pricing_plans { {
      'default' => [{name: 'Monthly Plan', price: '20.0', currency: 'AUD', factor: '/month'}]
    } }

    shared_entities { [] }

    trait :cloud do
      stack 'cloud'
    end

    trait :connector do
      stack 'connector'
    end

    factory :cloud_app, traits: [:cloud]
    factory :connector_app, traits: [:connector]

    # Properly build the resource with Her
    initialize_with { new(attributes).tap { |e| e.clear_attribute_changes! } }
  end
end
