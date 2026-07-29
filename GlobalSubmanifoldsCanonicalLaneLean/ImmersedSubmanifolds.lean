import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure ImmersedSubmanifoldPackage (M : Type*) [TopologicalSpace M] [ChartedSpace ℝ M] where
  carrier : Set M
  topology : TopologicalSpace carrier
  smoothStructure : ChartedSpace ℝ carrier
  immersion : SmoothImmersion carrier M

structure ImmersedSubmanifoldEvidence {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    (I : ImmersedSubmanifoldPackage M) where
  carrierClosed : IsClosed I.carrier
  immersionClosed : I.immersion.IsImmersion

def ImmersedSubmanifoldClosed {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    (I : ImmersedSubmanifoldPackage M) : Prop :=
  IsClosed I.carrier ∧ I.immersion.IsImmersion

theorem immersed_submanifold_closed_from_evidence
    {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    (I : ImmersedSubmanifoldPackage M) (E : ImmersedSubmanifoldEvidence I) :
    ImmersedSubmanifoldClosed I := by
  exact And.intro E.carrierClosed E.immersionClosed

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse