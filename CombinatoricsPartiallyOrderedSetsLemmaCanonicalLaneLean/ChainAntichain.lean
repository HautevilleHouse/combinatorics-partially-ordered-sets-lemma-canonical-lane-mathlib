import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean.PartialOrderBasics

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure ChainAntichainPackage (P : PartialOrderPackage) where
  chain : Set P.carrier
  antichain : Set P.carrier
  chainIsChain : ∀ a b ∈ chain, P.le a b ∨ P.le b a
  antichainIsAntichain : ∀ a b ∈ antichain, a ≠ b → ¬(P.le a b) ∧ ¬(P.le b a)
  chainNonempty : chain.Nonempty
  antichainNonempty : antichain.Nonempty

structure ChainAntichainEvidence {P : PartialOrderPackage} (C : ChainAntichainPackage P) where
  chainIsChainClosed : C.chainIsChain
  antichainIsAntichainClosed : C.antichainIsAntichain
  chainNonemptyClosed : C.chainNonempty
  antichainNonemptyClosed : C.antichainNonempty

def ChainAntichainClosed {P : PartialOrderPackage} (C : ChainAntichainPackage P) : Prop :=
  C.chainIsChain ∧ C.antichainIsAntichain ∧ C.chainNonempty ∧ C.antichainNonempty

theorem chain_antichain_closed_from_evidence {P : PartialOrderPackage} (C : ChainAntichainPackage P) (E : ChainAntichainEvidence C) : ChainAntichainClosed C := by
  exact And.intro E.chainIsChainClosed (And.intro E.antichainIsAntichainClosed (And.intro E.chainNonemptyClosed E.antichainNonemptyClosed))

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse