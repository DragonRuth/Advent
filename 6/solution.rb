# change length to switch between parts a and b.
File.read('input.txt').chars.each_with_index.reduce{|buff, (char, idx)| (buff[0].length < 14 ? [buff[0] + char, idx + 1] : (buff[0].chars.uniq.length == buff[0].length ? (puts buff; break) : [buff[0].chars.drop(1).join() + char, idx + 1]))}