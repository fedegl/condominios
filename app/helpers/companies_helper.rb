module CompaniesHelper
	def has_tools?
		if (@company.security || @company.cleaning || @company.gardening || 
				@company.personnel || @company.providers || @company.money_collect || 
				@company.finance || @company.procedures || @company.maintenance)
			true
		else
			false
		end
	end

end
