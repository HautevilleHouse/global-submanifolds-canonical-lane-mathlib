import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure EmbeddedSubmanifoldPackage (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] where
  embeddingMap : M → N
  topologicalEmbedding : Prop
  smoothEmbedding : Prop
  closedImage : Prop

structure EmbeddedSubmanifoldEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (P : EmbeddedSubmanifoldPackage M N) where
  topologicalEmbeddingClosed : P.topologicalEmbedding
  smoothEmbeddingClosed : P.smoothEmbedding
  closedImageClosed : P.closedImage

def EmbeddedSubmanifoldClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (P : EmbeddedSubmanifoldPackage M N) : Prop :=
  P.topologicalEmbedding ∧ P.smoothEmbedding ∧ P.closedImage

theorem embedded_submanifold_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (P : EmbeddedSubmanifoldPackage M N) (E : EmbeddedSubmanifoldEvidence P) : EmbeddedSubmanifoldClosed P := by
  exact And.intro E.topologicalEmbeddingClosed (And.intro E.smoothEmbeddingClosed E.closedImageClosed)

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse