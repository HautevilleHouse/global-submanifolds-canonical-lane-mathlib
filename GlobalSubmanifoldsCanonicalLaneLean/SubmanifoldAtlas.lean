import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure SubmanifoldAtlasPackage (M : Type*) [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] where
  carrier : Set M
  charts : Set (LocalHomeomorph M M)
  compatibility : ∀ c1 c2 ∈ charts, c1.source ∩ c2.source = ∅ ∨ c1.target ∩ c2.target = ∅
  covering : carrier ⊆ ⋃ c ∈ charts, c.source

structure SubmanifoldAtlasEvidence {M : Type*} [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] (A : SubmanifoldAtlasPackage M) where
  compatibilityClosed : A.compatibility
  coveringClosed : A.covering

def SubmanifoldAtlasClosed {M : Type*} [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] (A : SubmanifoldAtlasPackage M) : Prop :=
  A.compatibility ∧ A.covering

theorem submanifold_atlas_closed_from_evidence {M : Type*} [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] (A : SubmanifoldAtlasPackage M) (E : SubmanifoldAtlasEvidence A) : SubmanifoldAtlasClosed A := by
  exact And.intro E.compatibilityClosed E.coveringClosed

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse