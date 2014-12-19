require 'rspec'
require './lib/prime_table.rb'

describe 'prime_table' do
  describe '#find_primes' do
    # given a number n, return an array of the first n primes

    it 'returns empty array for 0' do
      expect(find_primes(0)).to eq([])
    end
    
    it 'returns the first prime number' do
      expect(find_primes(1)).to eq([2])
    end

    it 'returns the first five prime numbers' do
      expect(find_primes(5)).to eq([2, 3, 5, 7, 11])
    end

    it 'returns the first ten prime numbers' do
      expect(find_primes(10)).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

  end

  describe '#populate_primes' do
    # given an array of numbers length n, and a table
    # returns table with numbers populate in first row and first colum
    # ie. [1,2] => 
    # 
    # [ nil, 1, 2 ] 
    # [ 1, nil, nil]
    # [ 2, nil, nil]

    let(:empty_table) {[[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]}
    

    it 'populates first row of table' do
      expect((populate_primes(empty_table, [2,3]))[0]).to eq([nil, 2, 3])
    end

    it 'populates first column of table' do
      expect(populate_primes(empty_table, [2,3])).to eq([[nil, 2, 3],[2, nil, nil], [3, nil, nil]])
    end

    it 'does not change other cells' do
      populated_table = [[nil, nil, nil], [nil, 1, 1], [nil, 1, 1]]
      expect(populate_primes(populated_table, [2,3])).to eq([[nil, 2, 3],[2, 1, 1], [3, 1, 1]])
    end

  end

  describe '#populate_table' do
    # given an array of numbers length n, and a table
    # returns table where cell[x][y] = table[0][x] * table[y][0] 
    # ie. [2, 3] => 
    # 
    # [ nil, 2, 3 ] 
    # [   2, 4, 6 ]
    # [   3, 6, 9 ]

    let(:empty_table) {[[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]}

    it 'does not change first row of table' do
      table_with_primes = [[nil, 2, 3], [2, nil, nil], [3, nil, nil]]
      expect((populate_table(table_with_primes, [9, 10]))[0]).to eq([nil, 2, 3])
    end

    it 'populates cells properly' do
      expect(populate_table(empty_table, [2,3])).to eq([[nil, nil, nil],[nil, 4, 6], [nil, 6, 9]])
    end
  end

  describe '#prime_table' do
    # integration test

    it 'properly returns table of two primes' do
      completed_table = [[nil, 2, 3], [2, 4, 6], [3, 6, 9]]
      expect(prime_table(2)).to eq(completed_table)
    end

    it 'properly returns table of three primes' do
      completed_table = [[nil, 2, 3, 5], [2, 4, 6, 10], [3, 6, 9, 15], [5, 10, 15, 25]]
      expect(prime_table(3)).to eq(completed_table)
    end
  end
end
