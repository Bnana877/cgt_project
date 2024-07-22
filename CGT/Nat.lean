inductive ℕ where
  | zero : ℕ
  | succ : ℕ → ℕ
namespace ℕ

-- OfNat 型クラスのインスタンスを定義
instance : OfNat ℕ 0 where
  ofNat := zero

instance {n : Nat} [OfNat ℕ n] : OfNat ℕ (n + 1) where
  ofNat := succ (OfNat.ofNat n)

-- MyNat 型の値を Nat に変換する関数を定義
def myNatToNat (n : ℕ) : Nat :=
  match n with
  | zero     => 0
  | succ n'  => 1 + myNatToNat n'

-- MyNat 型の Repr インスタンスを定義
instance : Repr ℕ where
  reprPrec n _ := repr (myNatToNat n)

-- 自然数の加算を定義
def add (a b : ℕ) : ℕ :=
  match a with
  | zero     => b
  | succ a'  => succ (add a' b)
notation a " + " b => add a b

-- 自然数の順序を定義
def le (a b : ℕ) : Prop := ∃ (c : ℕ), b = a + c
notation a " ≤ " b => le a b

end ℕ
