import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure ImmersionSubmersionPackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] where
  immersionCondition : Prop
  submersionCondition : Prop
  rankConstant : Prop

structure ImmersionSubmersionEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (P : ImmersionSubmersionPackage M N) where
  immersionConditionClosed : P.immersionCondition
  submersionConditionClosed : P.submersionCondition
  rankConstantClosed : P.rankConstant

def ImmersionSubmersionClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (P : ImmersionSubmersionPackage M N) : Prop :=
  P.immersionCondition ∧ P.submersionCondition ∧ P.rankConstant

theorem immersion_submersion_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (P : ImmersionSubmersionPackage M N) (E : ImmersionSubmersionEvidence P) : ImmersionSubmersionClosed P := by
  exact And.intro E.immersionConditionClosed (And.intro E.submersionConditionClosed E.rankConstantClosed)

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse