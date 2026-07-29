import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure Poset (Carrier : Type u) where
  le : Carrier → Carrier → Prop
  le_refl : ∀ a : Carrier, le a a
  le_trans : ∀ a b c : Carrier, le a b → le b c → le a c
  le_antisymm : ∀ a b : Carrier, le a b → le b a → a = b

structure Chain (P : Poset Car) where
  elements : List Car
  chain_prop : ∀ a ∈ elements, ∀ b ∈ elements, P.le a b ∨ P.le b a

structure Antichain (P : Poset Car) where
  elements : List Car
  antichain_prop : ∀ a ∈ elements, ∀ b ∈ elements, a ≠ b → ¬(P.le a b) ∧ ¬(P.le b a)

def width (P : Poset Car) : ℕ := sorry

def height (P : Poset Car) : ℕ := sorry

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse