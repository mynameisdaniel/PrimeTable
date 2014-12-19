require 'terminal-table'

def prime_table(num)
	table = Array.new(num + 1) {Array.new(num + 1)}
	primes = find_primes(num)
  table = populate_primes(table, primes)
  table = populate_table(table, primes)
  table
end

def populate_primes(table, primes)
  primes.each_with_index do |val, index|
   table[0][index+1] = val
   table[index+1][0] = val
  end
  table
end

def populate_table(table, primes)
	primes.each_with_index do |num1, index|
		fixed_index = index + 1
		variable_index = index + 1
		primes[index..-1].each do |num2|
			product = num1 * num2
			table[fixed_index][variable_index] = product
			table[variable_index][fixed_index] = product 
			variable_index += 1
		end
	end
	table
end

def find_primes(num)
  primes = []
  i = 2
  while primes.length < num
  	is_prime = true
  	primes.each do |el|
      if i%el == 0
      	is_prime = false 
      	break
      end
  	end
  	primes << i if is_prime
    i += 1 
  end
  primes
end

def display(table)
   puts Terminal::Table.new :rows => table
end

p "This is program will generate a prime number multiplication table"
p  "How many prime numbers do you want the table to contain?"
num = gets.chomp.to_i
puts display(prime_table(num))