import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure LatticeStructureClosurePackage where
  latticeType : Type u
  meetOperation : latticeType → latticeType → latticeType
  joinOperation : latticeType → latticeType → latticeType
  meetAssociative : Prop
  joinAssociative : Prop
  absorptionLaws : Prop
  closureUnderOperations : Prop

structure LatticeStructureClosureEvidence (L : LatticeStructureClosurePackage) where
  meetAssociativeClosed : L.meetAssociative
  joinAssociativeClosed : L.joinAssociative
  absorptionLawsClosed : L.absorptionLaws
  closureUnderOperationsClosed : L.closureUnderOperations

def LatticeStructureClosureClosed (L : LatticeStructureClosurePackage) : Prop :=
  L.meetAssociative ∧ L.joinAssociative ∧ L.absorptionLaws ∧ L.closureUnderOperations

theorem lattice_structure_closure_closed_from_evidence
    (L : LatticeStructureClosurePackage) (E : LatticeStructureClosureEvidence L) :
    LatticeStructureClosureClosed L := by
  exact And.intro E.meetAssociativeClosed
    (And.intro E.joinAssociativeClosed
      (And.intro E.absorptionLawsClosed E.closureUnderOperationsClosed))

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse