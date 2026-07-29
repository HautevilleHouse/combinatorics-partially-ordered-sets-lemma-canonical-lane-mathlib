import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean.PosetChainDecomposition

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure DilworthTheoremPackage where
  chainDecomp : PosetChainDecompositionPackage
  antichainData : AntichainSpernerPackage
  equalityHolds : Prop
  proofObligation : Prop

structure DilworthTheoremEvidence (D : DilworthTheoremPackage) where
  equalityHoldsClosed : D.equalityHolds
  proofObligationClosed : D.proofObligation

def DilworthTheoremClosed (D : DilworthTheoremPackage) : Prop :=
  D.equalityHolds ∧ D.proofObligation

theorem dilworth_theorem_closed_from_evidence (D : DilworthTheoremPackage)
    (E : DilworthTheoremEvidence D) : DilworthTheoremClosed D := by
  exact And.intro E.equalityHoldsClosed E.proofObligationClosed

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
