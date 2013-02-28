module TabsParserHelper
	def self.validate( str )
		#refactor into strategy if required
		#match first char is | or  -
		#either -, 1|2digit , 1|2digit<h/p/b/s>2digit
		if(!str.is_a?(String)) 
			return false
		end

		if (str.length==0)
			 return false
		end
		
		match_first_result = false
		match_rest_result = false

		match_first_char = /^[|,\-,\d]/.match( str )
		
		if (!match_first_char.nil?)
			match_first_result = match_first_char[0] == str[0]
		end

		if (str.length==1 || !match_first_result )
			return match_first_result
		end

		if (str.slice(-1..-1) != '|')
			return false
		end		

		match_rest = /((?>\-\d{1,2}[hpbs]{1}\d{1,2})|(?>\-\d{1,2})|(?>\-))+/.match(str.slice(1..-2))
		
		if (!match_rest.nil?)
			match_rest_result = match_rest.to_s == str.slice(1..-2) 
		end

		return (match_first_result && match_rest_result)
		
	end

end
