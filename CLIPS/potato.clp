(deftemplate symptom
  (slot symptom-number)
  (slot symptom-name))

(defrule symptom-1
  (assert (symptom (symptom-number 1) (symptom-name "Brown Spots on leaves")))

(defrule symptom-2
  (assert (symptom (symptom-number 2) (symptom-name "White fungal growth on underside of leaves")))

(defrule symptom-3
  (assert (symptom (symptom-number 3) (symptom-name "Sunken brown lesions on tubers")))

(defrule symptom-4
  (assert (symptom (symptom-number 4) (symptom-name "Rough corky patches on tuber skin")))

(defrule symptom-5
  (assert (symptom (symptom-number 5) (symptom-name "Concentric rings on leaves")))

(defrule symptom-6
  (assert (symptom (symptom-number 6) (symptom-name "Brown lesions on stems")))

(defrule symptom-7
  (assert (symptom (symptom-number 7) (symptom-name "Wilting and death of plants")))

(defrule symptom-8
  (assert (symptom (symptom-number 8) (symptom-name "Brown vascular ring visible when stem is cut")))

(defrule symptom-9
  (assert (symptom (symptom-number 9) (symptom-name "Yellow mottling of leaves")))

(defrule symptom-10
  (assert (symptom (symptom-number 10) (symptom-name "Stunting of plants")))

(defrule symptom-11
  (assert (symptom (symptom-number 11) (symptom-name "Necrosis on tubers")))

(defrule symptom-12
  (assert (symptom (symptom-number 12) (symptom-name "Upward rolling of leaves")))

(defrule symptom-13
  (assert (symptom (symptom-number 13) (symptom-name "Leathery leaves")))

(defrule symptom-14
  (assert (symptom (symptom-number 14) (symptom-name "Small and deformed tubers")))

(deftemplate disease
  (slot disease-name)
  (multislot symptom-numbers))

(defrule disease-late-blight
  (assert (disease (disease-name "Late blight") (symptom-numbers 1 2 3)))

(defrule disease-common-scab
  (assert (disease (disease-name "Common scab") (symptom-numbers 4)))

(defrule disease-early-blight
  (assert (disease (disease-name "Early blight") (symptom-numbers 1 5)))

(defrule disease-blackleg
  (assert (disease (disease-name "Blackleg") (symptom-numbers 6 7)))

(defrule disease-bacterial-wilt
  (assert (disease (disease-name "Bacterial wilt") (symptom-numbers 7 8)))

(defrule disease-potato-virus-y
  (assert (disease (disease-name "Potato virus y") (symptom-numbers 9 10 11)))

(defrule disease-potato-leafroll-virus
  (assert (disease (disease-name "Potato leafroll virus") (symptom-numbers 12 13 14)))

(defrule symptoms
  (do-for-all-instances ((?symptom symptom))
    (printw "Symptom: ~s" (symptom-name ?symptom)))

(defrule diseases
  (do-for-all-instances ((?disease disease))
    (printw "Disease: ~s" (disease-name ?disease))
    (printw "Symptoms:")
    (do-for-all-values ((?symptom-number (symptom-numbers ?disease)))
      (printw "  ~d" ?symptom-number)
    )
    (printw))

(defrule check-disease (?symptom-number1 ?symptom-number2)
  (assert (possible-disease (disease-name "Early blight") (symptom-number ?symptom-number1) (symptom-number ?symptom-number2)))
  (assert (possible-disease (disease-name "Blackleg") (symptom-number ?symptom-number1) (symptom-number ?symptom-number2)))

(defrule check-disease (?symptom-number1 ?symptom-number2 ?symptom-number3)
  (assert (possible-disease (disease-name "Bacterial wilt") (symptom-number ?symptom-number1) (symptom-number ?symptom-number2) (symptom-number ?symptom-number3)))
  (assert (possible-disease (disease-name "Potato virus y") (symptom-number ?symptom-number1) (symptom-number ?symptom-number2) (symptom-number ?symptom-number3)))

(defrule check-disease (?symptom-number1 ?symptom-number2 ?symptom-number3 ?symptom-number4)
  (assert (possible-disease (disease-name "Potato leafroll virus") (symptom-number ?symptom-number1) (symptom-number ?symptom-number2) (symptom-number ?symptom-number3) (symptom-number ?symptom-number4)))

(defrule guess-disease (?symptom-number)
  (printw "Possible disease: Late blight or Early blight")

(defrule guess-disease (?symptom-number1 ?symptom-number2)
  (printw "Possible disease: Early blight or Blackleg")

(defrule guess-disease (?symptom-number1 ?symptom-number2 ?symptom-number3)
  (printw "Possible disease: Bacterial wilt or Potato virus y")

(defrule guess-disease (?symptom-number1 ?symptom-number2 ?symptom-number3 ?symptom-number4)
  (printw "Possible disease: Potato leafroll virus")


