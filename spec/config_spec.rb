RSpec.describe StackMaster::Config do
  subject(:loaded_config) { StackMaster::Config.load!('spec/fixtures/stack_master.yml') }
  let(:base_dir) { File.expand_path('spec/fixtures') }
  let(:myapp_vpc_definition) {
    StackMaster::Config::StackDefinition.new(
      region: 'us-east-1',
      stack_name: 'myapp-vpc',
      template: 'myapp_vpc.json',
      tags: { 'environment' => 'production' },
      base_dir: base_dir
    )
  }

  it 'returns an object that can find stack definitions' do
    stack = loaded_config.find_stack('us-east-1', 'myapp-vpc')
    expect(stack).to eq(myapp_vpc_definition)
  end

  it 'can find things with underscores instead of hyphens' do
    stack = loaded_config.find_stack('us_east_1', 'myapp_vpc')
    expect(stack).to eq(myapp_vpc_definition)
  end

  it 'exposes the base_dir' do
    expect(loaded_config.base_dir).to eq base_dir
  end
end
