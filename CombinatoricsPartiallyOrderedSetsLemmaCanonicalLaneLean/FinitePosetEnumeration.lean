import canonicalLaneMathlib.AdmissibleClass
import CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean.PosetFoundations

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure FinitePosetEnumerationPackage where
  poset : PosetAdmittedObject
  finiteSet : Prop
  linearExtensionsCount : Nat
  maxChainLength : Nat
  enumerationAlgorithm : String

structure FinitePosetEnumerationEvidence (F : FinitePosetEnumerationPackage) where
  finiteSetClosed : F.finiteSet
  linearExtensionsCountClosed : F.linearExtensionsCount = 0 ∨ F.linearExtensionsCount > 0
  maxChainLengthClosed : F.maxChainLength ≥ 0

def FinitePosetEnumerationClosed (F : FinitePosetEnumerationPackage) : Prop :=
  F.finiteSet ∧ (F.linearExtensionsCount = 0 ∨ F.linearExtensionsCount > 0) ∧ F.maxChainLength ≥ 0

theorem finite_poset_enumeration_closed_from_evidence (F : FinitePosetEnumerationPackage) (E : FinitePosetEnumerationEvidence F) :
    FinitePosetEnumerationClosed F := by
  exact And.intro E.finiteSetClosed
    (And.intro E.linearExtensionsCountClosed E.maxChainLengthClosed)

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
