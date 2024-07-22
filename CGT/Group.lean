import CGT.Set
import CGT.Monoid

class Group (G : Type) extends (Monoid G) where
  inv : G → G
  mul_left_inv : ∀ a : G, mul (inv a) a = one
  mul_right_inv : ∀ a : G, mul a (inv a) = one
notation x " ⁻¹ " => Group.inv x
