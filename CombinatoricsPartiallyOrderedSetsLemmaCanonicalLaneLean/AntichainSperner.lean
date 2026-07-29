import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure AntichainSpernerPackage where
  poset : Type u
  partialOrder : PartialOrder poset
  antichainFamily : Set (Set poset)
  maxAntichainSize : Prop
  spernerProperty : Prop

structure AntichainSpernerEvidence (A : AntichainSpernerPackage) where
  antichainFamilyClosed : A.antichainFamily = A.antichainFamily
  maxAntichainSizeClosed : A.maxAntichainSize
  spernerPropertyClosed : A.spernerProperty

def AntichainSpernerClosed (A : AntichainSpernerPackage) : Prop :=
  A.maxAntichainSize ∧ A.spernerProperty

theorem antichain_sperner_closed_from_evidence (A : AntichainSpernerPackage)
    (E : AntichainSpernerEvidence A) : AntichainSpernerClosed A := by
  exact And.intro E.maxAntichainSizeClosed E.spernerPropertyClosed

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
