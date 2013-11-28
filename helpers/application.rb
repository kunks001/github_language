class Array
  def get_mode
    group_by{ |e| e }.map{ |k,v| [k,v.count] }.max{ |a,b| a[1] <=> b[1] }.shift
  end
end