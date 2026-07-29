import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure PosetChainDecompositionPackage where
  poset : Type u
  partialOrder : PartialOrder poset
  chainPartition : Prop
  dilworthWidth : Prop
  chainCoverNumber : Prop
  chainDecompositionExists : Prop

structure PosetChainDecompositionEvidence (P : PosetChainDecompositionPackage) where
  chainPartitionClosed : P.chainPartition
  dilworthWidthClosed : P.dilworthWidth
  chainCoverNumberClosed : P.chainCoverNumber
  chainDecompositionExistsClosed : P.chainDecompositionExists

def PosetChainDecompositionClosed (P : PosetChainDecompositionPackage) : Prop :=
  P.chainPartition ∧ P.dilworthWidth ∧ P.chainCoverNumber ∧ P.chainDecompositionExists

theorem poset_chain_decomposition_closed_from_evidence (P : PosetChainDecompositionPackage)
    (E : PosetChainDecompositionEvidence P) : PosetChainDecompositionClosed P := by
  exact And.intro E.chainPartitionClosed (And.intro E.dilworthWidthClosed
    (And.intro E.chainCoverNumberClosed E.chainDecompositionExistsClosed))

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
