import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure PosetAntichainPackage where
  carrier : Type u
  partialOrder : PartialOrder carrier
  antichain : Set carrier
  pairwiseIncomparable : ∀ x y ∈ antichain, x ≠ y → ¬(x ≤ y) ∧ ¬(y ≤ x)
  maximalChainCondition : Prop
  dilworthBound : ℕ

def PosetAntichainClosed (P : PosetAntichainPackage) : Prop :=
  P.pairwiseIncomparable ∧ P.maximalChainCondition ∧ (P.dilworthBound = Finset.card (Finset.filter (λ x => True) Finset.univ : Finset P.carrier))

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
