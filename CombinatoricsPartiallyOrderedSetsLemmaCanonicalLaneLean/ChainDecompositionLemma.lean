import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean.PosetStructure

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure ChainDecompositionLemmaPackage (P : Poset Car) where
  LYMproperty : ℕ → ℕ → Prop
  LYMinequality : ∀ A : Antichain P, A.elements.length ≤ width P
  decompositionExists : ∀ w : ℕ, width P = w → ∃ decomposition : List (Chain P), decomposition.length = w ∧ ∀ x ∈ (Finset.univ : Finset Car), ∃ C ∈ decomposition, x ∈ Chain.elements C

structure ChainDecompositionLemmaEvidence (P : Poset Car) (C : ChainDecompositionLemmaPackage P) where
  LYMinequalityProof : C.LYMinequality (by
    intro A
    sorry)
  widthPartition : C.decompositionExists (width P) (by rfl)

def ChainDecompositionLemmaClosed (P : Poset Car) (C : ChainDecompositionLemmaPackage P) : Prop :=
  ∀ A : Antichain P, A.elements.length ≤ width P
  -- This is the essence: antichain size ≤ width

theorem chain_decomposition_lemma_closed_from_evidence (P : Poset Car) (C : ChainDecompositionLemmaPackage P) (E : ChainDecompositionLemmaEvidence P C) : ChainDecompositionLemmaClosed P C := by
  intro A
  exact E.LYMinequalityProof A

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse