import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure WidthHeightRelationsPackage where
  poset : Type u
  partialOrder : PartialOrder poset
  width : Prop
  height : Prop
  inequality : Prop

structure WidthHeightRelationsEvidence (W : WidthHeightRelationsPackage) where
  widthClosed : W.width
  heightClosed : W.height
  inequalityClosed : W.inequality

def WidthHeightRelationsClosed (W : WidthHeightRelationsPackage) : Prop :=
  W.width ∧ W.height ∧ W.inequality

theorem width_height_relations_closed_from_evidence (W : WidthHeightRelationsPackage)
    (E : WidthHeightRelationsEvidence W) : WidthHeightRelationsClosed W := by
  exact And.intro E.widthClosed (And.intro E.heightClosed E.inequalityClosed)

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
