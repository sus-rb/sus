
require_relative 'context'

module Sus
	class Base
		def initialize(assertions)
			@assertions = assertions
		end
		
		def before
		end
		
		def after
		end
		
		def around
			self.before
			
			return yield
		ensure
			self.after
		end
		
		def assert(...)
			@assertions.assert(...)
		end
		
		def refute(...)
			@assertions.refute(...)
		end
	end
	
	def self.base(description = nil)
		base = Class.new(Base)
		base.extend(Context)
		base.description = description
		
		return base
	end
end
