import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure EmbeddedSubmanifoldPackage (M : Type*) [TopologicalSpace M] [ChartedSpace ℝ M] where
  carrier : Set M
  topology : TopologicalSpace carrier
  smoothStructure : ChartedSpace ℝ carrier
  embedding : SmoothEmbedding carrier M

structure EmbeddedSubmanifoldEvidence {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    (E : EmbeddedSubmanifoldPackage M) where
  carrierClosed : IsClosed E.carrier
  embeddingClosed : E.embedding.IsEmbedding

def EmbeddedSubmanifoldClosed {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    (E : EmbeddedSubmanifoldPackage M) : Prop :=
  IsClosed E.carrier ∧ E.embedding.IsEmbedding

theorem embedded_submanifold_closed_from_evidence
    {M : Type*} [TopologicalSpace M] [ChartedSpace ℝ M]
    (E : EmbeddedSubmanifoldPackage M) (Ev : EmbeddedSubmanifoldEvidence E) :
    EmbeddedSubmanifoldClosed E := by
  exact And.intro Ev.carrierClosed Ev.embeddingClosed

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse