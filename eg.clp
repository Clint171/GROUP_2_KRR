161    (printout t"If you notice the above signs Enter 1 If not Enter 2"crlf)$
162    (printout t"Choice:"crlf)$
163    (bind ?stems(read))$
164    (assert (stems ?stems))$
165 )$
166 (defrule Menu3$
167     =>$
168     (printout t"Does the disease affect the roots?"crlf)$
169     (printout t"If yes Enter 1 if No Enter 0"crlf)$
170     (printout t"Choice : "crlf)$
171     (bind ?roots(read))$
172     (assert (roots ?roots))$
173 )$
174 (defrule Rhizoctonia-Root-Rot$
175     (roots 1)$
176     =>$
177     (printout t"---rhizoctionia root rots---$
178         1.Brown to black lesions on the roots, often near the tips.$
179         2.Affected roots may be constricted and have a wrinkled appearance.$
180         3.Reduced root development and nutrient uptake."crlf))$

