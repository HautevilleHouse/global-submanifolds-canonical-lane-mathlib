import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure ConstantRankTheoremPackage (M N : Type*) [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] (f : M → N) where
  smooth : ContDiff ⊤ f
  constantRank : ∃ (r : ℕ), ∀ x : M, FiniteDimensional.finrank ℝ (TangentSpace (M := M) x) = r ∧
    FiniteDimensional.finrank ℝ (TangentSpace (M := N) (f x)) = r
  rankPreserved : ∀ x : M, LinearMap.rank (mfderiv f x) = r

structure ConstantRankTheoremEvidence {M N : Type*} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] {f : M → N} (C : ConstantRankTheoremPackage M N f) where
  smoothClosed : C.smooth
  constantRankClosed : C.constantRank
  rankPreservedClosed : C.rankPreserved

def ConstantRankTheoremClosed {M N : Type*} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] {f : M → N} (C : ConstantRankTheoremPackage M N f) : Prop :=
  C.smooth ∧ C.constantRank ∧ C.rankPreserved

theorem constant_rank_theorem_closed_from_evidence {M N : Type*} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] {f : M → N} (C : ConstantRankTheoremPackage M N f) (E : ConstantRankTheoremEvidence C) : ConstantRankTheoremClosed C := by
  exact And.intro E.smoothClosed (And.intro E.constantRankClosed E.rankPreservedClosed)

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse