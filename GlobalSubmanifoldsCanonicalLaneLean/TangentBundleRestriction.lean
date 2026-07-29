import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure TangentRestrictionPackage (M : Type*) [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] (N : Set M) where
  tangentBundleProjection : VectorBundle ℝ (TangentSpace (M := M)) M
  restrictedSet : Set M := N
  restrictionSmooth : ContDiffOn ⊤ (fun x : M => (TangentSpace x).basis) N
  fiberwiseLinear : ∀ x ∈ N, LinearEquiv ℝ (TangentSpace x) (TangentSpace (Subtype N) ⟨x, hx⟩)

structure TangentRestrictionEvidence {M : Type*} [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] {N : Set M} (R : TangentRestrictionPackage M N) where
  restrictionSmoothClosed : R.restrictionSmooth
  fiberwiseLinearClosed : ∀ x : M, x ∈ N → ∃ (h : x ∈ N), LinearEquiv ℝ (TangentSpace x) (TangentSpace (Subtype N) ⟨x, h⟩)

def TangentRestrictionClosed {M : Type*} [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] {N : Set M} (R : TangentRestrictionPackage M N) : Prop :=
  R.restrictionSmooth ∧ ∀ x ∈ N, ∃ (h : x ∈ N), LinearEquiv ℝ (TangentSpace x) (TangentSpace (Subtype N) ⟨x, h⟩)

theorem tangent_restriction_closed_from_evidence {M : Type*} [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] {N : Set M} (R : TangentRestrictionPackage M N) (E : TangentRestrictionEvidence R) : TangentRestrictionClosed R := by
  refine And.intro E.restrictionSmoothClosed ?_
  intro x hx
  exact E.fiberwiseLinearClosed x hx

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse