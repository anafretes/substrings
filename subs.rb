
def substrings(str, dict)
  # separate str into an array of strings
  new_str = str.downcase.split(" ").sort
  # remove any astray punctuation. didn't test if it was necessary but oh well
  new_str = new_str.map {|i| i.gsub(/[,!\?\.]/, "")}

  # integrate dictionary words and count of how many times every word was found
  count_hash = dict.inject(Hash.new(0)) do |a, v|
    # count item if word is included in the value being checked on dict against new_str
    a[v]= new_str.count { |item| item.include?(v) }
    a
  end

  # delete items that count to zero aka weren't found
  count_hash = count_hash.delete_if {|k, v| v < 1}
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
