import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure EmbeddingStructurePackage where
  sourceManifold : Type u
  targetManifold : Type v
  embeddingMap : Type w
  injective : Prop
  immersion : Prop
  homeomorphicImage : Prop
  properMap : Prop
  injectivityTerm : injective
  immersionTerm : immersion
  homeomorphicImageTerm : homeomorphicImage
  properMapTerm : properMap

structure EmbeddingStructureEvidence (E : EmbeddingStructurePackage) where
  injectiveClosed : E.injective
  immersionClosed : E.immersion
  homeomorphicImageClosed : E.homeomorphicImage
  properMapClosed : E.properMap

def EmbeddingStructureClosed (E : EmbeddingStructurePackage) : Prop :=
  E.injective ∧ E.immersion ∧ E.homeomorphicImage ∧ E.properMap

theorem embedding_structure_closed_from_evidence (E : EmbeddingStructurePackage)
    (Ev : EmbeddingStructureEvidence E) : EmbeddingStructureClosed E := by
  exact And.intro Ev.injectiveClosed
    (And.intro Ev.immersionClosed
      (And.intro Ev.homeomorphicImageClosed Ev.properMapClosed))

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse