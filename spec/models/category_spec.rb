require 'rails_helper'

RSpec.describe(Category) do
  describe 'create' do
    subject { Category.create(params) }

    let(:params) { { title: title, description: description, task: task } }
    let(:title) { 'Valid Title' }
    let(:description) { 'Valid Description' }
    let(:task) { 'Valid Task' }

    context 'when the values are valid' do
      it { is_expected.to be_valid }
    end

    context 'when the title is empty' do
      let(:title) { '' }

      it { is_expected.not_to be_valid }
    end

    context 'when the title is longer than 20 characters' do
      let(:title) { 'A' * 21 }

      it { is_expected.not_to be_valid }
    end

    context 'when the description empty' do
      let(:description) { '' }

      it { is_expected.not_to be_valid }
    end

    context 'when the description is shorter than 10 characters' do
      let(:description) { 'A' * 9 }

      it { is_expected.not_to be_valid }
    end

    context 'when the description is longer than 100 characters' do
      let(:description) { 'A' * 101 }

      it { is_expected.not_to be_valid }
    end
  end

  describe 'update' do
    subject { category.update(params) }

    let!(:category) { Category.create(title: 'Valid title', description: 'Valid description') }
    let(:params) { { title: title, description: description } }
    let(:title) { 'Valid Title' }
    let(:description) { 'Valid Description' }

    context 'when the values are valid' do
      it { is_expected.to be_truthy }
    end

    context 'when the title is empty' do
      let(:title) { '' }

      it { is_expected.to be_falsey }
    end

    context 'when the title is longer than 20 characters' do
      let(:title) { 'A' * 21 }

      it { is_expected.to be_falsey }
    end

    context 'when the description empty' do
      let(:description) { '' }

      it { is_expected.to be_falsey }
    end

    context 'when the description is shorter than 10 characters' do
      let(:description) { 'A' * 9 }

      it { is_expected.to be_falsey }
    end

    context 'when the description is longer than 100 characters' do
      let(:description) { 'A' * 101 }

      it { is_expected.to be_falsey }
    end

    context 'when the task is empty' do
      let(:task) {''}

      it { is_expected.not_to be_valid }
    end
  end
end
