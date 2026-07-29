import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean.PartialOrderBasics
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean.ChainAntichain

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure SpernerTheoremPackage {P : PartialOrderPackage} (C : ChainAntichainPackage P) where
  boolLattice : PartialOrderPackage
  largestAntichainSize : Nat
  binomialCoefficient : Nat
  largestAntichainIsCentral : largestAntichainSize = binomialCoefficient
  centralBinom : binomialCoefficient = Nat.choose (boolLattice.carrier.encard) (boolLattice.carrier.encard / 2)

structure SpernerTheoremEvidence {P : PartialOrderPackage} {C : ChainAntichainPackage P} (S : SpernerTheoremPackage C) where
  largestAntichainIsCentralClosed : S.largestAntichainIsCentral
  centralBinomClosed : S.centralBinom

def SpernerTheoremClosed {P : PartialOrderPackage} {C : ChainAntichainPackage P} (S : SpernerTheoremPackage C) : Prop :=
  S.largestAntichainIsCentral ∧ S.centralBinom

theorem sperner_theorem_closed_from_evidence {P : PartialOrderPackage} {C : ChainAntichainPackage P} (S : SpernerTheoremPackage C) (E : SpernerTheoremEvidence S) : SpernerTheoremClosed S := by
  exact And.intro E.largestAntichainIsCentralClosed E.centralBinomClosed

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse