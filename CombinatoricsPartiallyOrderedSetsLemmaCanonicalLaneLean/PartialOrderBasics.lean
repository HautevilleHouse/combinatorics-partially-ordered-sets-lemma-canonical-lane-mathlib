import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure PartialOrderPackage where
  carrier : Type u
  le : carrier → carrier → Prop
  le_refl : ∀ a : carrier, le a a
  le_trans : ∀ a b c : carrier, le a b → le b c → le a c
  le_antisymm : ∀ a b : carrier, le a b → le b a → a = b

structure PartialOrderEvidence (P : PartialOrderPackage) where
  le_reflClosed : P.le_refl
  le_transClosed : P.le_trans
  le_antisymmClosed : P.le_antisymm

def PartialOrderClosed (P : PartialOrderPackage) : Prop :=
  P.le_refl ∧ P.le_trans ∧ P.le_antisymm

theorem partial_order_closed_from_evidence (P : PartialOrderPackage) (E : PartialOrderEvidence P) : PartialOrderClosed P := by
  exact And.intro E.le_reflClosed (And.intro E.le_transClosed E.le_antisymmClosed)

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse