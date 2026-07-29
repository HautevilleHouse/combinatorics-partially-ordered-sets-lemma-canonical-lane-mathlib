import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure PosetAdmittedObject where
  poset : Type u
  partialOrder : PartialOrder poset
  chainCondition : Prop
  antichainCondition : Prop
  conclusion : chainCondition ∧ antichainCondition

def PosetWitnessClosed (O : PosetAdmittedObject) : Prop :=
  O.chainCondition ∧ O.antichainCondition

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
