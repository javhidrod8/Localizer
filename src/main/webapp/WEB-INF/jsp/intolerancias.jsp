<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>

<petclinic:layout pageName="intolerancias">

	<div class="container col-12 px-4 py-5">
		<h2 class="mb-3 text-center">
			<i class="fa-solid fa-wheat-awn-circle-exclamation"></i> Informaci�n sobre al�rgenos e intolerancias
		</h2>
		<div class="card p-2 h-100 shadow-sm d-flex align-items-center justify-content-center text-break">
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">ALTRAMUCES</p>
					<img src="/resources/images/intolerancias/ALTRAMUCES.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>Adem�s de en las semillas y harinas, se puede encontrar en algunos tipos de pan, pasteles y pasta, etc.</p>
					<p> Las personas al�rgicas a los altramuces pueden serlo tambi�n a la soja y al cacahuete.</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">APIO</p>
					<img src="/resources/images/intolerancias/APIO.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>Incluye los tallos, hojas, semillas y ra�ces. Adem�s se puede encontrar en sal de apio, ensaladas, algunos productos c�rnicos, sopas o salsas, etc. Hay evidencia de que el calor puede reducir su capacidad para producir reacciones al�rgicas, esta reducci�n puede variar seg�n cada individuo.</p>
					<p>Por otra parte, Las personas al�rgicas al apio es probable que lo sea tambi�n a la zanahoria y al pepino por ser de la misma familia. La alergia al apio tambi�n a menudo se asocia a alergia respiratoria (rinitis y/o asma) por alergia a p�lenes.</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">C�SCARA</p>
					<img src="/resources/images/intolerancias/CASCARA.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>Las personas al�rgicas a los frutos secos o de c�scara tambi�n ser a algunas legumbres y a algunos cereales.</p>
					<p>Adem�s de en las semillas, pastas (mantecas), aceites y harinas, se puede encontrar en galletas, chocolates, currys , postres, salsas, etc.</p>
					<p>Dentro de los frutos secos se incluyen: las almendras, avellanas, nueces, anacardos, pacanas, nueces de Brasil, de macadamia, etc. Adem�s se puede encontrar en panes, galletas, postres, helados, mazap�n, salsas o aceites de nueces, etc.</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">CR�TACEO</p>
					<img src="/resources/images/intolerancias/CRUSTACEO.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>En el conjunto de las alergias a crust�ceos se incluye: cangrejos, langostas, gambas, langostinos, carabineros, cigalas, etc. Adem�s se puede encontrar en cremas, salsas, platos preparados, etc.</p>
					<p>Cabe indicar que la reactividad cruzada cl�nica es muy frecuente entre los diferentes crust�ceos, con lo que es muy probable que un paciente al�rgico a la gamba no pueda comer ning�n otro tipo de crust�ceo.</p>
					
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">FRUCTOSA</p>
					<img src="/resources/images/intolerancias/FRUCTOSA.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>En el conjunto de las alergias a la fructosa se incluye: Melocot�n, albaricoque, nectarina,mel�n, sand�a, pl�tano, kiwi, fresa., etc.</p>
					<p>Se puede encontrar en aromas (medicinas, chucher�as, pasta de dientes, etc), yogures y otros postres l�cteos,zumos, potitos, ensaladas, cereales,chocolates, tartas, pan, helados, gelatinas, etc.</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">GLUTEN</p>
					<img src="/resources/images/intolerancias/GLUTEN.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>El gluten es una prote�na que se encuentra en algunas gram�neas. Los cereales que contienen gluten son: el trigo, la cebada, el centeno, la avena, el kamut, la espelta y productos derivados de estos cereales como las harinas, levadura para hornear, masas, pan, pan rallado, tartas, couscous, productos c�rnicos, pasta, pasteler�a, salsas, sopas y alimentos enharinados los almidones, las f�culas o las s�molas.</p>
					<p>Hay que tener en cuenta que los cereales se utilizan como agentes espesantes o de relleno y se pueden encontrar en productos c�rnicos elaborados, bebidas y otros alimentos procesados.</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">HUEVOS</p>
					<img src="/resources/images/intolerancias/HUEVOS.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>Si un persona es al�rgica al huevo de una ave, la probabilidad de ser al�rgica a los huevos de otras aves es muy elevada por la similitud entre sus prote�nas. El huevo se utiliza como aditivo alimentario y esto hace que a menudo se encuentre como al�rgeno oculto.</p>
					<p>Adem�s de en el huevo y derivados (productos a base de huevo), se puede encontrar en tartas, algunos productos c�rnicos, mayonesa, mousses, pasta, quiches, platos preparados, salsas y alimentos decorados con huevo, etc.</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">LACTEOS</p>
					<img src="/resources/images/intolerancias/LACTEOS.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>En el caso de la alergia a la leche, el al�rgeno es alguna prote�na de la leche, por lo que la persona afectada no puede tolerar absolutamente ning�n l�cteo (salvo que sea alguna f�rmula hidrolizada de prote�nas).</p>
					<p>Adem�s de en la leche y sus derivados como la mantequilla, queso, nata, leche en polvo, yogures, etc, se puede encontrar en alimentos glaseados con leche, sopas en polvo y salsas, etc.</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">MIEL</p>
					<img src="/resources/images/intolerancias/MIEL.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>La persona al�rgica al polen, es posible que sea al�rgica a algunos tipos de miel. En muchos casos, esto hace que el polen sea el alergeno, en lugar de la miel en s�.</p>
					<p>Cuando se produce miel, posiblemente puede contaminarse con polen de abeja y el polen de otras plantas y �rboles</p>
					<p>Puede contenerlo los l�cteos azucarados, los chocolates, los productos de boller�a, los cereales,etc.</p>
				</div>
			</div>		
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">MOLUSCO</p>
					<img src="/resources/images/intolerancias/MOLUSCOS.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>En el conjunto de alergias a moluscos se incluyen: los mejillones, almejas, caracoles de tierra, ostras, b�garos, chirlas, berberechos, cremas, salsas, platos preparados o como ingrediente en los guisos de pescado, etc.</p>
					<p>Cuando se produce miel, posiblemente puede contaminarse con polen de abeja y el polen de otras plantas y �rboles</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">MOSTAZA</p>
					<img src="/resources/images/intolerancias/MOSTAZA.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>Las personas al�rgicas a la mostaza frecuentemente tambi�n presentan alergia a alimentos de la misma familia (nabo, r�bano, col, coliflor, col de Bruselas, crecen, br�coli, mostaza, repollo) as� como otras semillas (semilla de lino y la colza) y otros alimentos vegetales (frutos secos, frutas ros�ceas y legumbres).</p>
					<p>Adem�s de en semillas, en polvo o en forma l�quida, se puede encontrar en algunos panes, currys, marinados, productos c�rnicos, ali�os de ensaladas, salsas y sopas, etc.</p>
				</div>
			</div>			
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">PESCADO</p>
					<img src="/resources/images/intolerancias/PESCADO.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>Los al�rgenos principales del pescado son unas prote�nas altamente termoestables, es decir, resistentes al calor y que no se modifican al cocinarlas.</p>
					<p>Adem�s de en el pescado y derivados (productos a base de pescado), se puede encontrar en salsas de pescado, pizzas, ali�os para ensaladas, cubos de sopa, etc.</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">SACAROSA</p>
					<img src="/resources/images/intolerancias/SACAROSA.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>Las personas que la sufren no pueden tomar sacarosa (az�car com�n), ya que les provoca problemas intestinales graves. Es algo muy com�n en los alimentos, como los dulces, frutas como el mango, la pi�a, el melocot�n o el higo.</p>
					<p>Puede contenerlo los l�cteos azucarados, los chocolates, los productos de boller�a, los refrescos, el ma�z y los cereales.</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">S�SAMO</p>
					<img src="/resources/images/intolerancias/SESAMO.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>Adem�s de en las semillas (granos), pastas (tahine o pasta de s�samo), aceites y harinas, se puede encontrar en panes, colines, humus, etc.</p>
					<p>Una persona al�rgica a la semilla de s�samo es probable que lo sea tambi�n a otros frutos secos (nuez, cacahuete y anacardo) y tambi�n legumbres (lenteja y soja).</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 mb-2 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">SOJA</p>
					<img src="/resources/images/intolerancias/SOJA.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>La soja, legumbre de etiquetado obligatorio, pertenece a la familia de las leguminosas, y puede tener reactividad cruzada con otras legumbres.</p>
					<p>La soja est� predestinada para esto debido a su alto valor nutricional. La soja no solo se usa como sustituto de la leche, sino que tambi�n se encuentra a menudo en productos sustitutos sin gluten.</p>
				</div>
			</div>
			<div class="card py-2 h-100 w-100 shadow-sm d-flex flex-wrap flex-row align-items-between justify-content-center">
				<div class="col-md-3 col-12 p-3 d-flex flex-column align-items-center justify-content-center">
					<p class="fw-bold text-center">SULFITOS</p>
					<img src="/resources/images/intolerancias/SULFITOS.png" class="w-50 aler">
				</div>
				<div class="col-12 col-md-9 p-3">
					<p>Se utilizan como conservantes en crust�ceos, frutas desecadas, productos c�rnicos, refrescos, vegetales, vino (que contiene sulfitos producidos durante la fermentaci�n), otras bebidas alcoh�licas o no alcoh�licas envasadas (zumos, mosto, sidra) y cerveza. Podemos encontrarlo con otros nombres como "sulfitos", "SO2", o las famosas E220 a E228.</p>
					<p>A menudo a las carnes manipuladas se le a�aden sulfitos. Los sulfitos y bisulfitos son sustancias derivadas del azufre y utilizadas como antioxidantes o conservantes.</p>
				</div>
			</div>										
		</div>
	</div>
</petclinic:layout>
