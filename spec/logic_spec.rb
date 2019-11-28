# frozen_string_literal: true

require './lib/logic.rb'

RSpec.describe Logic do
  let(:runx) { Logic.new('p1', 'p2') }
  describe '#move' do
    1.upto(9) do |x|
      it 'return true if the moves are correct' do
        expect(runx.move(x)).to eql(true)
      end
      it 'return false if the move are not available' do
        expect(runx.move(x * 9)).to eql(false)
      end
      it 'return false if the selsected move in not wuthin the range' do
        expect(runx.move(x - 10)).to be_falsey
      end
    end
  end

  describe '#game_end' do
    [1, 2, 3, 4, 6, 5, 8, 9, 7].each do |x|
      if x == 7
        it 'Check if tied' do
          runx.move(x)
          expect(runx.game_end).to be_truthy
        end
      else
        it "Checks win condition for #{x}" do
          runx.move(x)
          expect(runx.game_end).to eql(-1)
        end
      end
      it 'Checks win condition on third column' do
        runx.move(7)
        expect(runx.game_end).to be_truthy
      end

      it 'Checks win condition on third column' do
        runx.move(8)
        expect(runx.game_end).to be_truthy
      end

      it 'Checks win condition on third column' do
        runx.move(9)
        expect(runx.game_end).to be_truthy
      end

      it 'Checks win condition on the first row' do
        runx.move(3)
        expect(runx.game_end).to be_truthy
      end

      it 'Checks win condition on the second row' do
        runx.move(6)
        expect(runx.game_end).to be_truthy
      end

      it 'Checks win condition on the third row' do
        runx.move(8)
        expect(runx.game_end).to be_truthy
      end

      it 'Checks win condition on the first diagonal' do
        runx.move(9)
        expect(runx.game_end).to be_truthy
      end

      it 'Checks win condition on the second diagonal' do
        runx.move(7)
        expect(runx.game_end).to be_truthy
      end
    end
  end

  describe '#current_player' do
    it 'Checks if the current player is the first one' do
      expect(runx.current_player).to eql('p1')
    end
    it 'Checks if the current player is the second one' do
      runx.game_end
      expect(runx.current_player).to eql('p2')
    end
  end

  describe '#play_again' do
    it 'Returns the original board if user selects true' do
      expect(runx.play_again).to be_truthy
    end
  end

  describe '#initialize' do
    it 'Returns true if the inputs are a string' do
      expect(runx).to be_truthy
    end
  end
end
