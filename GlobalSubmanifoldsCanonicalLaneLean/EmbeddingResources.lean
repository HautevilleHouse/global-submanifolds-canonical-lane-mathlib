import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure EmbeddingResources (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] where
  embeddingMap : M → N
  homeoOntoImage : Prop
  closedImage : Prop
  properMap : Prop

structure EmbeddingEvidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (E : EmbeddingResources M N) where
  homeoOntoImageClosed : E.homeoOntoImage
  closedImageClosed : E.closedImage
  properMapClosed : E.properMap

def EmbeddingClosed {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (E : EmbeddingResources M N) : Prop :=
  E.homeoOntoImage ∧ E.closedImage ∧ E.properMap

theorem embedding_closed_from_evidence {M N : Type} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace M] [ChartedSpace N] (E : EmbeddingResources M N) (Ev : EmbeddingEvidence E) : EmbeddingClosed E := by
  exact And.intro Ev.homeoOntoImageClosed (And.intro Ev.closedImageClosed Ev.properMapClosed)

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse