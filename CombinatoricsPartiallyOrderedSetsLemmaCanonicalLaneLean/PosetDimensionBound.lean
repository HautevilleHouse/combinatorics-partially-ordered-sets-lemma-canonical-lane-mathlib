import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure PosetDimensionBoundPackage where
  poset : Type u
  linearExtensionCount : Nat
  dimension : Nat
  boundProven : Prop
  dimensionUpperBound : Prop

structure PosetDimensionBoundEvidence (P : PosetDimensionBoundPackage) where
  boundProvenClosed : P.boundProven
  dimensionUpperBoundClosed : P.dimensionUpperBound

def PosetDimensionBoundClosed (P : PosetDimensionBoundPackage) : Prop :=
  P.boundProven ∧ P.dimensionUpperBound

theorem poset_dimension_bound_closed_from_evidence
    (P : PosetDimensionBoundPackage) (E : PosetDimensionBoundEvidence P) :
    PosetDimensionBoundClosed P := by
  exact And.intro E.boundProvenClosed E.dimensionUpperBoundClosed

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse