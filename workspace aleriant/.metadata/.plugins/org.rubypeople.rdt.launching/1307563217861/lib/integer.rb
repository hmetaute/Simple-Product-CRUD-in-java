=begin
--------------------------------------------------------- Class: Integer
     Add double dispatch to Integer

------------------------------------------------------------------------


Instance methods:
-----------------
     to_bn

=end
class Integer < Numeric
  include Precision
  include Comparable

  def self.yaml_tag_subclasses?
  end

  def self.induced_from(arg0)
  end

  def gcd(arg0)
  end

  def taguri=(arg0, arg1, *rest)
  end

  def lcm(arg0)
  end

  def round
  end

  def next
  end

  def times
  end

  def floor
  end

  def chr
  end

  def upto(arg0)
  end

  def numerator
  end

  def ceil
  end

  def to_int
  end

  def taguri
  end

  def to_i
  end

  def to_r
  end

  def integer?
  end

  def gcdlcm(arg0)
  end

  def truncate
  end

  def downto(arg0)
  end

  def succ
  end

  def denominator
  end

end
