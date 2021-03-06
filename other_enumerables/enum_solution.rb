# Exercise 2:
  # make your own enumerables

  class Array
    # Research enumerables here if you are unfamiliar with them
    # (http://ruby-doc.org/core-2.3.1/Enumerable.html)

    # - you will need to use #another_each to make your enumerables work. 
    # - do not use the standard #each inside your new methods only use #another_each provided below <<<<<<<<<<<<<<<<<<<<<
    # - research what yield does in ruby and look at the #another_each example below for reference
    def another_each
      self.length.times do |i|
        yield(self[i])
      end
    end

    # another_reject
    # Duplicates what the #reject method does. do not use #reject
    # Returns an array for all elements of enum for which the given block returns false.

    # Precode
    
    # Method
    def another_reject
      #use another_each
      collection = []
      another_each do |i|
        if yield(i) == false
          collection << i
        end
      end
      collection    
    end

    # another_find
    # Duplicates what the #find method does. do not use #find
    # Returns the first element for which block is not false. if no element meets the criteria in the block #another_find will return nil
    
    # Precode
    
    # Method
    def another_find
      #use another_each
      answer = nil
      another_each do |i|
        if answer == nil && yield(i) == true
            answer = 1
        end
      end
        answer    
    end

    # another_map
    # Duplicates what the #map method does. do not use #map
    # Returns a new array with the results of running block once for every element in the original array

    # Precode
    
    # Method
    def another_map
      #use another_each
      array = []
      another_each do |i|
        array <<  yield(i)
      end  
      p array
    end

  end

   #Bonus *******************************************

    # another_map!
    # Duplicates what the #map! method does. do not use #map!
    # replaces the original array with the results of running block once for every element in the original array
    # the bang at the end of the method means that it is desctructive, this means that if replaces the object that it is called on.
    # look at #replace

    def another_map!
      # another_map test
      destructive_map_example_array = [1,2,3,4]
      first_object_id = destructive_map_example_array.object_id
      destructive_map_example_array.another_map! { |x| x * x }
      destructive_map_example_test = destructive_map_example_array == [1, 4, 9, 16]
      second_object_id = destructive_map_example_array.object_id

      if destructive_map_example_test && first_object_id == second_object_id
        puts "Bonus Level Unlocked"
      else
        puts "Bonus Level Locked"
      end
    end

  # Exercise 2 Driver Code

    # another_reject test
    reject_example_array = [1, 2, 3, 4, 5]

    if reject_example_array.another_reject { |num| num.even? } == [1, 3, 5]
      puts "#another_reject - Pass"
    else
      puts "#another_reject - F"
    end

    # another_find test
    find_example_test_1 = (1..10).to_a.another_find { |i| i % 5 == 0 && i % 7 == 0 } == nil
    find_example_test_2 = (1..100).to_a.another_find { |i| i % 5 == 0 && i % 7 == 0 } == 35

    if find_example_test_1 && find_example_test_2
      puts "#another_find - Pass"
    else
      puts "#another_find - F"
    end


    # another_map test
    map_example_test_1 = [1,2,3,4].another_map { |x| x * x } == [1, 4, 9, 16]
    map_example_test_2 = [1,2,3,4].another_map { |num| num.to_s + " cat" } == ["1 cat", "2 cat", "3 cat", "4 cat"]

    if map_example_test_1 && map_example_test_2
      puts "#another_map - Pass"
    else
      puts "#another_map - F"
    end

    # another_map test
    destructive_map_example_array = [1,2,3,4]
    first_object_id = destructive_map_example_array.object_id
    destructive_map_example_array.another_map! { |x| x * x }
    destructive_map_example_test = destructive_map_example_array == [1, 4, 9, 16]
    second_object_id = destructive_map_example_array.object_id

    if destructive_map_example_test && first_object_id == second_object_id
      puts "Bonus Level Unlocked"
    else
      puts "Bonus Level Locked"
    end
