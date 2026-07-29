import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure DilworthChainDecompositionPackage where
  chainPartition : Type u
  chainCoverNumber : Nat
  antichainSize : Nat
  decompositionExists : Prop
  chainCoverNumberMinimal : Prop

structure DilworthChainDecompositionEvidence (D : DilworthChainDecompositionPackage) where
  decompositionExistsClosed : D.decompositionExists
  chainCoverNumberMinimalClosed : D.chainCoverNumberMinimal

def DilworthChainDecompositionClosed (D : DilworthChainDecompositionPackage) : Prop :=
  D.decompositionExists ∧ D.chainCoverNumberMinimal

theorem dilworth_chain_decomposition_closed_from_evidence
    (D : DilworthChainDecompositionPackage) (E : DilworthChainDecompositionEvidence D) :
    DilworthChainDecompositionClosed D := by
  exact And.intro E.decompositionExistsClosed E.chainCoverNumberMinimalClosed

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse