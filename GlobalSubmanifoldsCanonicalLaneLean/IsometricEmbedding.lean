import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure IsometricEmbeddingPackage where
  sourceManifold : Type u
  targetManifold : Type v
  embeddingMap : Type w
  isometryCondition : Prop
  extrinsicCurvatureRelation : Prop
  secondFundamentalFormCompatible : Prop
  nashEmbeddingReady : Prop
  isometryConditionTerm : isometryCondition
  extrinsicCurvatureRelationTerm : extrinsicCurvatureRelation
  secondFundamentalFormCompatibleTerm : secondFundamentalFormCompatible
  nashEmbeddingReadyTerm : nashEmbeddingReady

structure IsometricEmbeddingEvidence (I : IsometricEmbeddingPackage) where
  isometryConditionClosed : I.isometryCondition
  extrinsicCurvatureRelationClosed : I.extrinsicCurvatureRelation
  secondFundamentalFormCompatibleClosed : I.secondFundamentalFormCompatible
  nashEmbeddingReadyClosed : I.nashEmbeddingReady

def IsometricEmbeddingClosed (I : IsometricEmbeddingPackage) : Prop :=
  I.isometryCondition ∧ I.extrinsicCurvatureRelation ∧ I.secondFundamentalFormCompatible ∧ I.nashEmbeddingReady

theorem isometric_embedding_closed_from_evidence (I : IsometricEmbeddingPackage)
    (Ev : IsometricEmbeddingEvidence I) : IsometricEmbeddingClosed I := by
  exact And.intro Ev.isometryConditionClosed
    (And.intro Ev.extrinsicCurvatureRelationClosed
      (And.intro Ev.secondFundamentalFormCompatibleClosed Ev.nashEmbeddingReadyClosed))

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse