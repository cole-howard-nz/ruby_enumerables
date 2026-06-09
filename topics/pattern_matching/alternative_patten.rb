def alternative_pattern input
  begin
    case input
    in 1 | 2 | 3
      puts :match
    end
  rescue NoMatchingPatternError => e
    puts e
  end
end

alternative_pattern 3
alternative_pattern 5


def alternative_pattern_two input
  begin
    case input
    in (1..5) | String
      puts :match
    end
  rescue NoMatchingPatternError => e
    puts e
  end
end

alternative_pattern_two 2
alternative_pattern_two 5
alternative_pattern_two 6
alternative_pattern_two '6'