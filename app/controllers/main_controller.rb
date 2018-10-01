class MainController < ApplicationController
	def index
		@result = ""
	end

	def calculate(a,b,c)
		disc = b*b - (4*a*c)
		if disc < 0
			return "NaN"
			exit()
		end


		if (a == 0 && b == 0 && c == 0) || (a == 0 && b == c)
			return "*"
		end

		if a == 0
			return "Not a quadratic equation!"
			exit()
		end


		x1 = ((-b + Math.sqrt(disc))/2*a).round(3)
		x2 = ((-b - Math.sqrt(disc))/2*a).round(3)

		if disc == 0
			return x1
		else
			return "#{x1},#{x2}" 
			
		end

	end

	def create
		a = params["a"].to_i
		b = params["b"].to_i
		c = params["c"].to_i
		res = calculate(a,b,c)
		#page["result"].value = result
		#render plain: "Result is " + result
		@result = "x1, x2 = " + res
		render "index"
	end
end
