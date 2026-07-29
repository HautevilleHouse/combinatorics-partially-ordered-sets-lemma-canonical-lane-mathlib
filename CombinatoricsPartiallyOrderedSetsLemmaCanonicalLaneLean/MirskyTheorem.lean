import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure MirskyTheoremPackage where
  poset : Type u
  partialOrder : PartialOrder poset
  chainDecompositionNumber : Prop
  antichainCoverNumber : Prop
  equalityHolds : Prop

structure MirskyTheoremEvidence (M : MirskyTheoremPackage) where
  chainDecompositionNumberClosed : M.chainDecompositionNumber
  antichainCoverNumberClosed : M.antichainCoverNumber
  equalityHoldsClosed : M.equalityHolds

def MirskyTheoremClosed (M : MirskyTheoremPackage) : Prop :=
  M.chainDecompositionNumber ∧ M.antichainCoverNumber ∧ M.equalityHolds

theorem mirsky_theorem_closed_from_evidence (M : MirskyTheoremPackage)
    (E : MirskyTheoremEvidence M) : MirskyTheoremClosed M := by
  exact And.intro E.chainDecompositionNumberClosed
    (And.intro E.antichainCoverNumberClosed E.equalityHoldsClosed)

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
