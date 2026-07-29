import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure NormalBundlePackage where
  ambientManifold : Type u
  submanifold : Type v
  normalSpace : Type w
  orthogonalDecomposition : Prop
  normalConnection : Prop
  secondFundamentalFormLink : Prop
  ricciEquation : Prop
  orthogonalDecompositionTerm : orthogonalDecomposition
  normalConnectionTerm : normalConnection
  secondFundamentalFormLinkTerm : secondFundamentalFormLink
  ricciEquationTerm : ricciEquation

structure NormalBundleEvidence (N : NormalBundlePackage) where
  orthogonalDecompositionClosed : N.orthogonalDecomposition
  normalConnectionClosed : N.normalConnection
  secondFundamentalFormLinkClosed : N.secondFundamentalFormLink
  ricciEquationClosed : N.ricciEquation

def NormalBundleClosed (N : NormalBundlePackage) : Prop :=
  N.orthogonalDecomposition ∧ N.normalConnection ∧ N.secondFundamentalFormLink ∧ N.ricciEquation

theorem normal_bundle_closed_from_evidence (N : NormalBundlePackage)
    (Ev : NormalBundleEvidence N) : NormalBundleClosed N := by
  exact And.intro Ev.orthogonalDecompositionClosed
    (And.intro Ev.normalConnectionClosed
      (And.intro Ev.secondFundamentalFormLinkClosed Ev.ricciEquationClosed))

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse