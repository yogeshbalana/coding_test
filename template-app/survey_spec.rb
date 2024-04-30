require_relative 'questionnaire' # Adjust the path accordingly

RSpec.describe 'Questionnaire' do
  describe '#do_prompt' do
    it 'should add answers to the store file' do
      # adding stubs
      allow_any_instance_of(Object).to receive(:gets).and_return('yes', 'yes', 'no', 'yes', 'no')

      expect_any_instance_of(Object).to receive(:add_answers).with({
        q1: 'yes',
        q2: 'yes',
        q3: 'no',
        q4: 'yes',
        q5: 'no'
      }).once

      do_prompt
    end
  end

  describe '#calculate_completion_percentage' do
    it 'should correctly calculate the completion percentage' do
      answers = {
        q1: 'yes',
        q2: 'no',
        q3: 'yes',
        q4: 'yes',
        q5: 'no'
      }
    end
  end

  describe '#evaluate_survey_average' do
    it 'should correctly evaluate the survey average' do
      # Stubbing PStore transactions for testing
      store_double = double('PStore')
      allow(PStore).to receive(:new).and_return(store_double)
      allow(store_double).to receive(:transaction).and_yield
      allow(store_double).to receive_message_chain(:[], :each).and_yield(
        q1: 'yes',
        q2: 'yes',
        q3: 'no',
        q4: 'yes',
        q5: 'no'
      )

      expect { evaluate_survey_average }.to output("Average rating across all runs: 60.0%\n").to_stdout
    end
  end
end
