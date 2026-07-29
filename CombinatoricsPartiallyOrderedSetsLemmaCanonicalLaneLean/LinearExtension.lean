import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure LinearExtensionPackage where
  poset : Type u
  partialOrder : PartialOrder poset
  totalOrders : Set (PartialOrder poset)
  linearExtensionExists : Prop
  realizerBound : Prop

structure LinearExtensionEvidence (L : LinearExtensionPackage) where
  linearExtensionExistsClosed : L.linearExtensionExists
  realizerBoundClosed : L.realizerBound

def LinearExtensionClosed (L : LinearExtensionPackage) : Prop :=
  L.linearExtensionExists ∧ L.realizerBound

theorem linear_extension_closed_from_evidence (L : LinearExtensionPackage)
    (E : LinearExtensionEvidence L) : LinearExtensionClosed L := by
  exact And.intro E.linearExtensionExistsClosed E.realizerBoundClosed

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
