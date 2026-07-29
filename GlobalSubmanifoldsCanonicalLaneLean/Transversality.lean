import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure TransversalityPackage (M N P : Type) [TopologicalSpace M] [TopologicalSpace N] [TopologicalSpace P] [ChartedSpace M] [ChartedSpace N] [ChartedSpace P] where
  mapF : M → P
  mapG : N → P
  transverseCondition : Prop

structure TransversalityEvidence {M N P : Type} [TopologicalSpace M] [TopologicalSpace N] [TopologicalSpace P] [ChartedSpace M] [ChartedSpace N] [ChartedSpace P] (T : TransversalityPackage M N P) where
  transverseConditionClosed : T.transverseCondition

def TransversalityClosed {M N P : Type} [TopologicalSpace M] [TopologicalSpace N] [TopologicalSpace P] [ChartedSpace M] [ChartedSpace N] [ChartedSpace P] (T : TransversalityPackage M N P) : Prop :=
  T.transverseCondition

theorem transversality_closed_from_evidence {M N P : Type} [TopologicalSpace M] [TopologicalSpace N] [TopologicalSpace P] [ChartedSpace M] [ChartedSpace N] [ChartedSpace P] (T : TransversalityPackage M N P) (E : TransversalityEvidence T) : TransversalityClosed T := by
  exact E.transverseConditionClosed

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse