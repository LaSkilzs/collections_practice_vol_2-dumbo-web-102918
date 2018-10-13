def begins_with_r(array)
  array.all? {|word| word[0..0] == "r"}
end

def contain_a(array)
  result = array.select{|word| word.include?("a") }
  result
end

def first_wa(array)
  result = ""
  array.each do |word|
    if word[0..1] == "wa"
      result = word
      break
    end
  end
  result
end


def remove_non_strings(array)
  array.select{|el| el.class ==  String}
end

def count_elements(array)
  result = []
 array.each{|el|result << {:count => array.count(el) }.merge(el) }
 result.uniq
end

def merge_data(keys,data)
  data_hsh = data[0]

  result = []
    data_hsh.each{|k,v|keys.each do |el|
      result << el.merge(v) if el.values.include?(k)
    end}
  result
end

def find_cool(cool)
  result = []
  cool.each_with_index do |array, idx|
  array.each{|k,v| result << cool[idx] if v == "cool"}
  end
  result
end

def organize_schools(schools)
  result = Hash.new {|h,k| h[k] = []}

schools.each do |array|
  array.each_with_index do |el,idx|
    if array[idx].class == Hash && array[idx].values == ["Chicago"]
      city = array[idx].values.join(" ")
      result[city] += [array[idx-1]]
    elsif array[idx].class == Hash && array[idx].values == ["NYC"]
      city = array[idx].values.join(" ")
      result[city] += [array[idx-1]]
    elsif array[idx].class == Hash && array[idx].values == ["SF"]
      city = array[idx].values.join(" ")
      result[city] += [array[idx-1]]
     end
   end
 end
 result.sort_by{|k,v|k}.to_h
end
