import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure MirskyAntichainDecompositionPackage where
  antichainPartition : Type u
  antichainCoverNumber : Nat
  chainSize : Nat
  decompositionExists : Prop
  antichainCoverNumberMinimal : Prop

structure MirskyAntichainDecompositionEvidence (M : MirskyAntichainDecompositionPackage) where
  decompositionExistsClosed : M.decompositionExists
  antichainCoverNumberMinimalClosed : M.antichainCoverNumberMinimal

def MirskyAntichainDecompositionClosed (M : MirskyAntichainDecompositionPackage) : Prop :=
  M.decompositionExists ∧ M.antichainCoverNumberMinimal

theorem mirsky_antichain_decomposition_closed_from_evidence
    (M : MirskyAntichainDecompositionPackage) (E : MirskyAntichainDecompositionEvidence M) :
    MirskyAntichainDecompositionClosed M := by
  exact And.intro E.decompositionExistsClosed E.antichainCoverNumberMinimalClosed

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse