require 'rails_helper'

describe 'Project' do
	let(:project) { create(:project)}

	describe 'validations' do

		it 'is valid' do
			expect(project).to be_valid
		end

		it 'is not valid without name' do
			project.name = nil
			expect(project).not_to be_valid
		end

		context 'when the name is longer than 30 chars' do
			it 'is not valid' do
				project.name = 'kjuideufi fdeuf ieufie foieu f eofie steryteyrtutyituiyuo'
				expect(project).not_to be_valid
			end
		end

		context 'when the name is alreade taken' do
			it 'is not valid' do
				Project.create(name: 'Project 1')
				project.name = 'Project 1'
				expect(project).not_to be_valid
			end
		end

		context 'when the name has special characters' do
			it 'is not valid' do
				project.name = '123Diana!'
				expect(project).not_to be_valid
			end
		end
	end
end
