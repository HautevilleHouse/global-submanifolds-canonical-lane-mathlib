import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure ImmersionPackage (M N : Type*) [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] where
  f : M → N
  smooth : ContDiff ⊤ f
  injective_differential : ∀ x, LinearMap.ker (mfderiv f x) = ⊥
  topologyCompat : Inducing f

structure ImmersionEvidence {M N : Type*} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] (I : ImmersionPackage M N) where
  smoothClosed : I.smooth
  injectiveDifferentialClosed : I.injective_differential
  topologyCompatClosed : I.topologyCompat

def ImmersionClosed {M N : Type*} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] (I : ImmersionPackage M N) : Prop :=
  I.smooth ∧ I.injective_differential ∧ I.topologyCompat

theorem immersion_closed_from_evidence {M N : Type*} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] (I : ImmersionPackage M N) (E : ImmersionEvidence I) : ImmersionClosed I := by
  exact And.intro E.smoothClosed (And.intro E.injectiveDifferentialClosed E.topologyCompatClosed)

structure EmbeddingPackage (M N : Type*) [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] where
  imm : ImmersionPackage M N
  proper_map : Proper (imm.f)
  image_closed : IsClosed (Set.range imm.f)

structure EmbeddingEvidence {M N : Type*} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] (E : EmbeddingPackage M N) where
  immClosed : ImmersionClosed E.imm
  properMapClosed : E.proper_map
  imageClosedClosed : E.image_closed

def EmbeddingClosed {M N : Type*} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] (E : EmbeddingPackage M N) : Prop :=
  ImmersionClosed E.imm ∧ E.proper_map ∧ E.image_closed

theorem embedding_closed_from_evidence {M N : Type*} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace ℝ) M] [ChartedSpace (ModelSpace ℝ) N] (E : EmbeddingPackage M N) (Ev : EmbeddingEvidence E) : EmbeddingClosed E := by
  exact And.intro Ev.immClosed (And.intro Ev.properMapClosed Ev.imageClosedClosed)

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse