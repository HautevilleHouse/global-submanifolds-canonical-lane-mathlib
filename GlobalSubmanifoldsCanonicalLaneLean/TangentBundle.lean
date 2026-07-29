import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure TangentBundlePackage (M : Type*) [TopologicalSpace M] [ChartedSpace ℝ M] [SmoothManifold ℝ M] where
  fiber : M → Type*
  bundle : (Σ x : M, fiber x) → Type*
  projection : (Σ x : M, fiber x) → M
  vectorBundleStructure : VectorBundle ℝ bundle

structure TangentBundleEvidence {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M] [SmoothManifold ℝ M]
    (T : TangentBundlePackage M) where
  projectionClosed : Smooth Surjective T.projection
  vectorBundleClosed : T.vectorBundleStructure.IsVectorBundle

def TangentBundleClosed {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M] [SmoothManifold ℝ M]
    (T : TangentBundlePackage M) : Prop :=
  Smooth Surjective T.projection ∧ T.vectorBundleStructure.IsVectorBundle

theorem tangent_bundle_closed_from_evidence
    {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M] [SmoothManifold ℝ M]
    (T : TangentBundlePackage M) (Ev : TangentBundleEvidence T) :
    TangentBundleClosed T := by
  exact And.intro Ev.projectionClosed Ev.vectorBundleClosed

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse