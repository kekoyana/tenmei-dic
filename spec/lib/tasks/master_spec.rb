# frozen_string_literal: true

require 'rails_helper'
require 'rake'

describe 'rake task master' do
  include_context 'stub http master_seed'
  before do
    Rake.application.tasks.each(&:reenable)
  end

  describe 'master:fetch' do
    subject(:task) { Rake.application['master:fetch'] }

    it 'is succeed.' do
      expect(task.invoke).to be_truthy
    end
  end
end
