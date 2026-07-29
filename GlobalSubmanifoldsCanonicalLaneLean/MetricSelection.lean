import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure MetricSelectionPackage where
  targetManifold : Type u
  ambientMetric : Type v
  inducedMetric : Type w
  metricCompatible : Prop
  secondFundamentalForm : Prop
  gaussEquation : Prop
  codazziEquation : Prop
  metricCompatibilityTerm : metricCompatible
  secondFundamentalFormTerm : secondFundamentalForm
  gaussEquationTerm : gaussEquation
  codazziEquationTerm : codazziEquation

structure MetricSelectionEvidence (M : MetricSelectionPackage) where
  metricCompatibleClosed : M.metricCompatible
  secondFundamentalFormClosed : M.secondFundamentalForm
  gaussEquationClosed : M.gaussEquation
  codazziEquationClosed : M.codazziEquation

def MetricSelectionClosed (M : MetricSelectionPackage) : Prop :=
  M.metricCompatible ∧ M.secondFundamentalForm ∧ M.gaussEquation ∧ M.codazziEquation

theorem metric_selection_closed_from_evidence (M : MetricSelectionPackage)
    (E : MetricSelectionEvidence M) : MetricSelectionClosed M := by
  exact And.intro E.metricCompatibleClosed
    (And.intro E.secondFundamentalFormClosed
      (And.intro E.gaussEquationClosed E.codazziEquationClosed))

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse