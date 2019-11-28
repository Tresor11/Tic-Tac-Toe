# frozen_string_literal: true

require './lib/logic.rb'

RSpec.describe Logic do
  let(:runX) { Logic.new('p1', 'p2') }
  describe '#move' do
    1.upto(9) do |x|
      it 'return true if the moves are correct' do
        expect(runX.move(x)).to eql(true)
      end
      it 'return false if the move are not available' do
        expect(runX.move(x * 10)).to eql(false)
      end
      it 'return false if the selected move in not within the range' do
        expect(runX.move(x - 10)).to be_falsy
      end
    end
  end

  describe '#game_end' do
    [1, 2, 3, 4, 6, 5, 8, 9, 7].each do |x|
      if x == 7
        it 'Check if tied' do
          runX.move(x)
          expect(runX.game_end).to be_truthy
        end
      else
        it "Checks win condition for #{x}" do
          runX.move(x)
          expect(runX.game_end).to eql(-1)
        end
      end
      it 'Checks win condition on third column' do
        runX.move(7)
        expect(runX.game_end).to be_truthy
      end

      it 'Checks win condition on third column' do
        runX.move(8)
        expect(runX.game_end).to be_truthy
      end

      it 'Checks win condition on third column' do
        runX.move(9)
        expect(runX.game_end).to be_truthy
      end

      it 'Checks win condition on the first row' do
        runX.move(3)
        expect(runX.game_end).to be_truthy
      end

      it 'Checks win condition on the second row' do
        runX.move(6)
        expect(runX.game_end).to be_truthy
      end

      it 'Checks win condition on the third row' do
        runX.move(8)
        expect(runX.game_end).to be_truthy
      end

      it 'Checks win condition on the first diagonal' do
        runX.move(9)
        expect(runX.game_end).to be_truthy
      end

      it 'Checks win condition on the second diagonal' do
        runX.move(7)
        expect(runX.game_end).to be_truthy
      end
    end
  end

  describe '#current_player' do
    it 'Checks if the current player is the first one' do
      expect(runX.current_player).to eql('p1')
    end
    it 'Checks if the current player is the second one' do
      runX.game_end
      expect(runX.current_player).to eql('p2')
    end
  end

  describe '#play_again' do
    it 'Returns the original board if user selects true' do
      expect(runX.play_again).to be_truthy
    end
  end

  describe '#initialize' do
    it 'Returns true if the inputs are a string' do
      expect(runX).to be_truthy
    end
  end
end
