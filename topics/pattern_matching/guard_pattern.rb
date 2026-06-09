def guard_pattern input
  value = true
  
  begin
    case input
    in input if value
      puts :match
    end
  rescue NoMatchingPatternError => e
    puts e
  end
end

guard_pattern 5