import CGT.Set

class SemiGroup (G : Type) where
  mul : G → G → G
  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)

notation a " + " b => SemiGroup.mul a b

class Monoid (G : Type) extends (SemiGroup G) where
  e : G
  one_mul : ∀ a : G, mul e a = a
  mul_one : ∀ a : G, mul a e = a
