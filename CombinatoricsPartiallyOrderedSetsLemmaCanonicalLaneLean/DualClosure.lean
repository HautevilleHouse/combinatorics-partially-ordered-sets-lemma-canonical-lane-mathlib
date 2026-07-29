import canonicalLaneMathlib.AdmissibleClass
import CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean.PosetFoundations

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure DualClosurePackage where
  poset : PosetAdmittedObject
  dualPoset : PosetAdmittedObject
  dualityMap : PosetAdmittedObject → PosetAdmittedObject
  orderReversing : Prop
  involutionProperty : Prop

structure DualClosureEvidence (D : DualClosurePackage) where
  orderReversingClosed : D.orderReversing
  involutionPropertyClosed : D.involutionProperty

def DualClosureClosed (D : DualClosurePackage) : Prop :=
  D.orderReversing ∧ D.involutionProperty

theorem dual_closure_closed_from_evidence (D : DualClosurePackage) (E : DualClosureEvidence D) :
    DualClosureClosed D := by
  exact And.intro E.orderReversingClosed E.involutionPropertyClosed

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
