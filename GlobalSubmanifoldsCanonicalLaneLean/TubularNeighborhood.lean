import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure TubularNeighborhoodPackage {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M] [SmoothManifold ℝ M]
    {N : Type*} [TopologicalSpace N] [ChartedSpace ℝ N] [SmoothManifold ℝ N]
    (f : SmoothEmbedding N M) where
  openNeighborhood : Set M
  retraction : SmoothMap M N
  homotopy : SmoothMap (I × M) M
  retractionClosedOnImage : ∀ x : N, retraction (f x) = x
  openNeighborhoodContainsImage : Set.range f ⊆ openNeighborhood

structure TubularNeighborhoodEvidence {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M] [SmoothManifold ℝ M]
    {N : Type*} [TopologicalSpace N] [ChartedSpace ℝ N] [SmoothManifold ℝ N]
    {f : SmoothEmbedding N M} (TNP : TubularNeighborhoodPackage f) where
  retractionClosed : TNP.retraction.IsRetraction
  homotopyClosed : TNP.homotopy.IsHomotopyToRetraction

def TubularNeighborhoodClosed {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M] [SmoothManifold ℝ M]
    {N : Type*} [TopologicalSpace N] [ChartedSpace ℝ N] [SmoothManifold ℝ N]
    {f : SmoothEmbedding N M} (TNP : TubularNeighborhoodPackage f) : Prop :=
  TNP.retraction.IsRetraction ∧ TNP.homotopy.IsHomotopyToRetraction

theorem tubular_neighborhood_closed_from_evidence
    {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M] [SmoothManifold ℝ M]
    {N : Type*} [TopologicalSpace N] [ChartedSpace ℝ N] [SmoothManifold ℝ N]
    {f : SmoothEmbedding N M} (TNP : TubularNeighborhoodPackage f) (Ev : TubularNeighborhoodEvidence TNP) :
    TubularNeighborhoodClosed TNP := by
  exact And.intro Ev.retractionClosed Ev.homotopyClosed

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse