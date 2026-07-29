import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure MinimalSubmanifoldPackage where
  submanifold : Type u
  ambientMetric : Type v
  meanCurvatureZero : Prop
  stabilityOperator : Prop
  MorseIndex : Prop
  areaMinimizingProperty : Prop
  meanCurvatureZeroTerm : meanCurvatureZero
  stabilityOperatorTerm : stabilityOperator
  morseIndexTerm : MorseIndex
  areaMinimizingPropertyTerm : areaMinimizingProperty

structure MinimalSubmanifoldEvidence (M : MinimalSubmanifoldPackage) where
  meanCurvatureZeroClosed : M.meanCurvatureZero
  stabilityOperatorClosed : M.stabilityOperator
  morseIndexClosed : M.MorseIndex
  areaMinimizingPropertyClosed : M.areaMinimizingProperty

def MinimalSubmanifoldClosed (M : MinimalSubmanifoldPackage) : Prop :=
  M.meanCurvatureZero ∧ M.stabilityOperator ∧ M.MorseIndex ∧ M.areaMinimizingProperty

theorem minimal_submanifold_closed_from_evidence (M : MinimalSubmanifoldPackage)
    (Ev : MinimalSubmanifoldEvidence M) : MinimalSubmanifoldClosed M := by
  exact And.intro Ev.meanCurvatureZeroClosed
    (And.intro Ev.stabilityOperatorClosed
      (And.intro Ev.morseIndexClosed Ev.areaMinimizingPropertyClosed))

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse