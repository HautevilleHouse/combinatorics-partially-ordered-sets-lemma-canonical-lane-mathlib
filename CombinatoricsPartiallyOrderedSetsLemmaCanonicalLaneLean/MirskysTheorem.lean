import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean.PartialOrderBasics
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean.ChainAntichain

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure MirskyTheoremPackage {P : PartialOrderPackage} (C : ChainAntichainPackage P) where
  height : Nat
  minAntichainCover : Nat
  equality : height = minAntichainCover
  chainMax : ∃ (c : Set P.carrier), (∀ a b ∈ c, P.le a b ∨ P.le b a) ∧ c.encard = height
  antichainCover : ∃ (antichains : Set (Set P.carrier)), (∀ a ∈ antichains, ∀ x y ∈ a, x ≠ y → ¬(P.le x y) ∧ ¬(P.le y x)) ∧ (∀ x : P.carrier, ∃ a ∈ antichains, x ∈ a) ∧ (antichains.encard = minAntichainCover)

structure MirskyTheoremEvidence {P : PartialOrderPackage} {C : ChainAntichainPackage P} (M : MirskyTheoremPackage C) where
  equalityClosed : M.equality
  chainMaxClosed : M.chainMax
  antichainCoverClosed : M.antichainCover

def MirskyTheoremClosed {P : PartialOrderPackage} {C : ChainAntichainPackage P} (M : MirskyTheoremPackage C) : Prop :=
  M.equality ∧ M.chainMax ∧ M.antichainCover

theorem mirsky_theorem_closed_from_evidence {P : PartialOrderPackage} {C : ChainAntichainPackage P} (M : MirskyTheoremPackage C) (E : MirskyTheoremEvidence M) : MirskyTheoremClosed M := by
  exact And.intro E.equalityClosed (And.intro E.chainMaxClosed E.antichainCoverClosed)

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse