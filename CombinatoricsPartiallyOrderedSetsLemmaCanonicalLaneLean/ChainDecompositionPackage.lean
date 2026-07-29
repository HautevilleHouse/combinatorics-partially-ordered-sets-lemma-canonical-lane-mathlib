import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean

structure ChainDecompositionPackage {α : Type u} [PartialOrder α] (P : PosetAntichainPackage α) where
  chainFamilies : List (List α)
  chainCover : ∀ x : α, ∃ (c : List α), c ∈ chainFamilies ∧ x ∈ c
  chainIsChain : ∀ (c : List α), c ∈ chainFamilies → IsChain (· ≤ ·) (c : Set α)
  chainMinimalLength : ℕ

def ChainDecompositionClosed {α : Type u} [PartialOrder α] {P : PosetAntichainPackage α} (C : ChainDecompositionPackage P) : Prop :=
  C.chainCover ∧ (∀ (c : List α), c ∈ C.chainFamilies → C.chainMinimalLength ≤ c.length) ∧ IsChain (· ≤ ·) (Finset.toSet (Finset.image (λ (c : List α) => c.length) (Finset.toFinset (Set.univ : Set (List α)))))

end CombinatoricsPartiallyOrderedSetsLemmaCanonicalLaneLean
end HautevilleHouse
