import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure TransverseIntersectionPackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] where
  submanifoldF : M → N
  submanifoldG : M → N
  transverseCondition : Prop
  intersectionSmooth : Prop
  dimensionAdditivity : Prop

structure TransverseIntersectionEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (T : TransverseIntersectionPackage M N) where
  transverseConditionClosed : T.transverseCondition
  intersectionSmoothClosed : T.intersectionSmooth
  dimensionAdditivityClosed : T.dimensionAdditivity

def TransverseIntersectionClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (T : TransverseIntersectionPackage M N) : Prop :=
  T.transverseCondition ∧ T.intersectionSmooth ∧ T.dimensionAdditivity

theorem transverse_intersection_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (T : TransverseIntersectionPackage M N) (E : TransverseIntersectionEvidence T) : TransverseIntersectionClosed T := by
  exact And.intro E.transverseConditionClosed (And.intro E.intersectionSmoothClosed E.dimensionAdditivityClosed)

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse