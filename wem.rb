module Parent
  def public_method_in_parent
    'public-method-in-parent'
  end
  public :public_method_in_parent

  def protected_method_in_parent
    'protected_method-in-parent'
  end
  protected :protected_method_in_parent

  def private_method_in_parent
    'private-method-in-parent'
  end
  private :private_method_in_parent
end

p Parent.public_methods(false).length
p Parent.protected_methods(false).length
p Parent.private_methods(false).length
puts
p Parent.public_methods(true).length
p Parent.protected_methods(true).length
p Parent.private_methods(true).length

p Module.new.private_methods(true) - Module.new.private_methods(false)
# puts
# p Parent.public_methods.include?(:protected_method_in_parent)
# p Parent.protected_methods.include?(:protected_method_in_parent)
# p Parent.private_methods.include?(:protected_method_in_parent)
# puts
# p Parent.public_methods.include?(:private_method_in_parent)
# p Parent.protected_methods.include?(:private_method_in_parent)
# p Parent.private_methods.include?(:private_method_in_parent)
puts

p Parent.public_methods(false).include?(:public_method_in_parent)
p Parent.protected_methods(false).include?(:public_method_in_parent)
p Parent.private_methods(false).include?(:public_method_in_parent)
puts
p Parent.public_methods(false).include?(:protected_method_in_parent)
p Parent.protected_methods(false).include?(:protected_method_in_parent)
p Parent.private_methods(false).include?(:protected_method_in_parent)
puts
p Parent.public_methods(false).include?(:private_method_in_parent)
p Parent.protected_methods(false).include?(:private_method_in_parent)
p Parent.private_methods(false).include?(:private_method_in_parent)
puts

module Child1
  extend Parent
end

p Child1.public_methods(false).include?(:public_method_in_parent)
p Child1.protected_methods(false).include?(:public_method_in_parent)
p Child1.private_methods(false).include?(:public_method_in_parent)
puts
p Child1.public_methods(false).include?(:protected_method_in_parent)
p Child1.protected_methods(false).include?(:protected_method_in_parent)
p Child1.private_methods(false).include?(:protected_method_in_parent)
puts
p Child1.public_methods(false).include?(:private_method_in_parent)
p Child1.protected_methods(false).include?(:private_method_in_parent)
p Child1.private_methods(false).include?(:private_method_in_parent)
puts

module Child2
  class << self
    include Parent
    alias_method :new_public_method_in_parent, :public_method_in_parent
    alias_method :new_protected_method_in_parent, :protected_method_in_parent
    alias_method :new_private_method_in_parent, :private_method_in_parent
  end
end

# p Child2.send(:public_method_in_parent)
# p Child2.send(:protected_method_in_parent)
# p Child2.send(:private_method_in_parent)

p Child2.public_methods(false).include?(:new_public_method_in_parent)
p Child2.protected_methods(false).include?(:new_public_method_in_parent)
p Child2.private_methods(false).include?(:new_public_method_in_parent)
puts
p Child2.public_methods(false).include?(:new_protected_method_in_parent)
p Child2.protected_methods(false).include?(:new_protected_method_in_parent)
p Child2.private_methods(false).include?(:new_protected_method_in_parent)
puts
p Child2.public_methods(false).include?(:new_private_method_in_parent)
p Child2.protected_methods(false).include?(:new_private_method_in_parent)
p Child2.private_methods(false).include?(:new_private_method_in_parent)
puts

__END__

Remove ModuleMethod#method_exists?

This was made redundant by e87c03b068efc48267fbcd5a295514077c52b901.

I'm fairly confident that e87c03b068efc48267fbcd5a295514077c52b901 didn't change the behaviour for modules.
