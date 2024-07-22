import CGT.Set
import CGT.Nat

-- Sequence 型の定義
inductive Sequence (α : Type) where
  | single : α -> Sequence α
  | consolidated : α -> Sequence α -> Sequence α

namespace Sequence
-- Sequence のヘッドを取得する関数
def head {α : Type} : Sequence α -> α
  | (single x) => x
  | (consolidated x _) => x

-- Sequence の tail を取得する関数
def tail {α : Type} : Sequence α -> Option (Sequence α)
  | (single _) => none
  | (consolidated _ xs) => some xs

-- Sequence の長さを取得する関数
def length {α : Type} : Sequence α -> ℕ
  | (single _) => (0 : ℕ)
  | (consolidated _ xs) => (1 : ℕ) + length xs

end Sequence

-- ImpartialGame 型クラスの定義
class ImpartialGame (G : Type) where
  Next : G -> Set G

namespace ImpartialGame

def add (G H: Type) [ImpartialGame G] [ImpartialGame H]: ImpartialGame (G × H):=
    {
      Next := fun (g, h) => (fun (g_, h_) => ((g_ ∈ ImpartialGame.Next g) ∧ h_ = h) ∨ (g_ = g ∧ (h_ ∈ ImpartialGame.Next h)))
    }
  notation a " + " b => add a b
end ImpartialGame

-- FiniteImpartialGame 型クラスの定義
class FiniteImpartialGame (G : Type) extends (ImpartialGame G) where
  finite_length : ∀ g : G, ∃ N : ℕ, ∀ s : Sequence G, Sequence.head s = g -> Sequence.length s ≤ N

namespace FiniteImpartialGame


end FiniteImpartialGame
