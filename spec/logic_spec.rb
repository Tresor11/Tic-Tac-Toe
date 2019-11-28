# frozen_string_literal: true

require './lib/logic.rb'

RSpec.describe Logic do
  describe '#move' do
    run = Logic.new('p1', 'p2')
    1.upto(9) do |x|
      it 'return true if the moves are correct' do
        expect(run.move(x)).to eql(true)
      end
      it 'return false if the move are not vailable' do
        expect(run.move(x + 9)).to eql(false)
      end
    end
  end

  describe '#game_end' do
    run1 = Logic.new('P1', 'P2')
    [1, 2, 3, 4, 6, 5, 8, 9, 7].each do |x|
      if x == 7
        it 'Check if tied' do
          run1.move(x)
          expect(run1.game_end).to be_falsy
        end
      else
        it "Checks win condition for #{x}" do
          run1.move(x)
          expect(run1.game_end).to eql(-1)
        end
      end
    end

    run2 = Logic.new('P1', 'P2')
    [1, 2, 4, 3, 7, 7].each do |x|
      run2.move(x)
      next unless x == 7

      it 'Checks win condition on first column' do
        expect(run2.game_end).to be_truthy
      end
    end

    run3 = Logic.new('P1', 'P2')
    [2, 1, 5, 3, 8].each do |x|
      run3.move(x)
      next unless x == 8

      it 'Checks win condition on second column' do
        expect(run3.game_end).to be_truthy
      end
    end
    run4 = Logic.new('P1', 'P2')
    [3, 1, 6, 2, 9].each do |x|
      run4.move(x)
      next unless x == 9

      it 'Checks win condition on third column' do
        expect(run4.game_end).to be_truthy
      end
    end

    run5 = Logic.new('P1', 'P2')
    [1, 4, 2, 5, 3].each do |x|
      run5.move(x)
      next unless x == 3

      it 'Checks win condition on first row' do
        expect(run5.game_end).to be_truthy
      end
    end

    run6 = Logic.new('P1', 'P2')
    [4, 1, 5, 2, 6].each do |x|
      run6.move(x)
      next unless x == 6

      it 'Checks win condition on first row' do
        expect(run6.game_end).to be_truthy
      end
    end

    run7 = Logic.new('P1', 'P2')
    [7, 1, 8, 2, 9].each do |x|
      run7.move(x)

      next unless x == 9

      it 'Checks win condition on first row ' do
        expect(run7.game_end).to be_truthy
      end
    end

    run8 = Logic.new('P1', 'P2')
    [1, 2, 5, 3, 9].each do |x|
      run8.move(x)
      next unless x == 9

      it 'Checks win condition on first diagonal' do
        expect(run8.game_end).to be_truthy
      end
    end

    run9 = Logic.new('P1', 'P2')
    [3, 2, 5, 1, 7].each do |x|
      run9.move(x)
      next unless x == 7

      it 'Checks win condition on second diagonal' do
        expect(run9.game_end).to be_truthy
      end
    end
  end

  describe '#current_player' do
    run10 = Logic.new('P1', 'P2')
    it 'Checks if the current player is the first one' do
      expect(run10.current_player).to eql('P1')
    end
    it 'Checks if the current player is the second one' do
      run10.game_end
      expect(run10.current_player).to eql('P2')
    end
  end
end
