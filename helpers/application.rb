module ApplicationHelpers
	def self.included(mod)
    ::Hash.class_eval do
    	def ninvert
		    inject({}) { |h,(k,v)| (h[v] ||= []) << k; h }
		  end
		end

		::Array.class_eval do
			def get_mode
		    (inject(Hash.new(0)) { |h,e| h[e] += 1; h }.ninvert.max || 
		    [[]]).last
		  end
		end
	end
end