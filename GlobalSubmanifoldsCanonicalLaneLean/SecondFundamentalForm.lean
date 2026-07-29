import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure SecondFundamentalFormPackage (M : Type*) [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] [RiemannianManifold M] (N : Submanifold ℝ M) where
  shapeOperator : Π (x : N), TangentSpace (M := M) (x.val) → TangentSpace (M := M) (x.val)
  shapeSymmetric : ∀ x : N, ∀ v w : TangentSpace (M := M) (x.val), 
    inner (M := M) (x.val) (shapeOperator x v) w = inner (M := M) (x.val) (shapeOperator x w) v
  normalBundleSmooth : VectorBundle ℝ (NormalSpace (M := M) (submanifold := N)) N
  secondFundamentalForm : Π (x : N), TangentSpace (M := M) (x.val) → TangentSpace (M := M) (x.val) → NormalSpace (M := M) (submanifold := N) x
  bilinear : ∀ (x : N), BilinearMap ℝ (TangentSpace (M := M) (x.val)) (TangentSpace (M := M) (x.val)) (NormalSpace (M := M) (submanifold := N) x)

structure SecondFundamentalFormEvidence {M : Type*} [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] [RiemannianManifold M] {N : Submanifold ℝ M} (S : SecondFundamentalFormPackage M N) where
  shapeSymmetricClosed : S.shapeSymmetric
  normalBundleSmoothClosed : S.normalBundleSmooth
  bilinearClosed : S.bilinear

def SecondFundamentalFormClosed {M : Type*} [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] [RiemannianManifold M] {N : Submanifold ℝ M} (S : SecondFundamentalFormPackage M N) : Prop :=
  S.shapeSymmetric ∧ S.normalBundleSmooth ∧ S.bilinear

theorem second_fundamental_form_closed_from_evidence {M : Type*} [TopologicalSpace M] [ChartedSpace (ModelSpace ℝ) M] [RiemannianManifold M] {N : Submanifold ℝ M} (S : SecondFundamentalFormPackage M N) (E : SecondFundamentalFormEvidence S) : SecondFundamentalFormClosed S := by
  exact And.intro E.shapeSymmetricClosed (And.intro E.normalBundleSmoothClosed E.bilinearClosed)

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse