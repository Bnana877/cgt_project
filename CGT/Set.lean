
import CGT.Nat
def Set (α : Type) := α → Prop

namespace Set

  def Member {α : Type} (a : α) (s : Set α) : Prop := s a
  notation a " ∈ " A => Member a A

  def Subset {α : Type} (A : Set α) (B : Set α) : Prop :=
    ∀(x : α), (x ∈ A) -> (x ∈ B)
  notation A " ⊆ " B => Subset A B

  def EmptySet {α : Type} : Set α := fun _ => False
  notation "∅" => EmptySet

  def UniversalSet {α : Type} : Set α := fun _ => True
  notation "𝕌" => UniversalSet

  def Union {α : Type} (A B: Set α): Set α :=
    fun p => A p ∨ B p
  notation A " ∪ " B => Union A B

 def Product {α β : Type} (A : Set α) (B : Set β) :=
    fun p => ∃ (a : α) (b : β), (p = (a, b)) ∧ (a ∈ A) ∧ (b ∈ B)
  notation A " × " B => Product A B

def Power {α : Type} (A : Set α) : Set (Set α) :=
  fun S => (S ⊆ A)

end Set
