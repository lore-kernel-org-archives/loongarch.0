Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E84E7B
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 13:23:55 +0000 (UTC)
X-UUID: 7056131776a0492982790a2830c20899-20230425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:0de37dc3-bb38-48c1-8010-df38de601c5b,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:7
X-CID-INFO: VERSION:1.1.22,REQID:0de37dc3-bb38-48c1-8010-df38de601c5b,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:7
X-CID-META: VersionHash:120426c,CLOUDID:c41878a2-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:2304252123508TS27JTE,BulkQuantity:0,Recheck:0,SF:17|19|42|101|38|25|
	100|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 7056131776a0492982790a2830c20899-20230425
X-User: lienze@kylinos.cn
Received: from [192.168.3.105] [(61.48.209.226)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1739900611; Tue, 25 Apr 2023 21:23:50 +0800
Message-ID: <c05713ccac578c811928b12b3003f5f84af14ad3.camel@kylinos.cn>
Subject: Re: [PATCH v7 06/12] LoongArch: Humanize the CRMD line when showing
 registers
From: Enze Li <lienze@kylinos.cn>
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Date: Tue, 25 Apr 2023 21:23:48 +0800
In-Reply-To: <20230425081023.3809434-7-kernel@xen0n.name>
References: <20230425081023.3809434-1-kernel@xen0n.name>
	 <20230425081023.3809434-7-kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-04-25 at 16:10 +0800, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
>=20
> Example output looks like:
>=20
> [=C2=A0=C2=A0 xx.xxxxxx]=C2=A0 CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC=
 DACM=3DCC -WE)
>=20
> Some initial machinery for this pretty-printing format has been
> included
> in this patch as well.
>=20
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
> =C2=A0arch/loongarch/kernel/traps.c | 46
> ++++++++++++++++++++++++++++++++++-
> =C2=A01 file changed, 45 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/loongarch/kernel/traps.c
> b/arch/loongarch/kernel/traps.c
> index f7bb15a52ccf..b93d3b44a5f9 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -3,6 +3,7 @@
> =C2=A0 * Author: Huacai Chen <chenhuacai@loongson.cn>
> =C2=A0 * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> =C2=A0 */
> +#include <linux/bitfield.h>
> =C2=A0#include <linux/bitops.h>
> =C2=A0#include <linux/bug.h>
> =C2=A0#include <linux/compiler.h>
> @@ -153,6 +154,49 @@ static void show_code(unsigned int *pc, bool
> user)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("\n");
> =C2=A0}
> =C2=A0
> +static void print_bool_fragment(const char *key, unsigned long val,
> bool first)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* e.g. "+PG", "-DA" */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("%s%c%s", first ? "" :=
 " ", val ? '+' : '-', key);
> +}
> +
> +static void print_plv_fragment(const char *key, int val)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* e.g. "PLV0", "PPLV3" */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("%s%d", key, val);
> +}
> +
> +static void print_memory_type_fragment(const char *key, unsigned
> long val)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* e.g. "DATM=3DWUC" */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *humanized_type =3D=
 NULL;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0switch (val) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 0: humanized_type =3D "SU=
C"; break;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 1: humanized_type =3D "CC=
"; break;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 2: humanized_type =3D "WU=
C"; break;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (humanized_type) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pr_cont(" %s=3D%s", key, humanized_type);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pr_cont(" %s=3DReserved(%lu)", key, val);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +}

Hi Xuerui,

A small nit, the checkpatch.pl throws up the following three errors and
one new warning.

-------------------------------------------------
ERROR: trailing statements should be on next line
#52: FILE: arch/loongarch/kernel/traps.c:175:
+	case 0: humanized_type =3D "SUC"; break;

ERROR: trailing statements should be on next line
#53: FILE: arch/loongarch/kernel/traps.c:176:
+	case 1: humanized_type =3D "CC"; break;

ERROR: trailing statements should be on next line
#54: FILE: arch/loongarch/kernel/traps.c:177:
+	case 2: humanized_type =3D "WUC"; break;

WARNING: braces {} are not necessary for any arm of this statement
#57: FILE: arch/loongarch/kernel/traps.c:180:
+	if (humanized_type) {
[...]
+	} else {
[...]
-------------------------------------------------

How about modifications like this?  It would be good if we eliminate
these errors or warnings before merging to loongarch-next.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -172,16 +172,18 @@ static void print_memory_type_fragment(const char
*key, unsigned long val)
        const char *humanized_type =3D NULL;
=20
        switch (val) {
-       case 0: humanized_type =3D "SUC"; break;
-       case 1: humanized_type =3D "CC"; break;
-       case 2: humanized_type =3D "WUC"; break;
+       case 0:
+               humanized_type =3D "SUC"; break;
+       case 1:
+               humanized_type =3D "CC"; break;
+       case 2:
+               humanized_type =3D "WUC"; break;
        }
=20
-       if (humanized_type) {
+       if (humanized_type)
                pr_cont(" %s=3D%s", key, humanized_type);
-       } else {
+       else
                pr_cont(" %s=3DReserved(%lu)", key, val);
-       }
 }
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Best Regards,
Enze

> +
> +static void print_crmd(unsigned long x)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont(" CRMD: %08lx (", x);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0print_plv_fragment("PLV", (int=
) FIELD_GET(CSR_CRMD_PLV, x));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0print_bool_fragment("IE", FIEL=
D_GET(CSR_CRMD_IE, x), false);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0print_bool_fragment("DA", FIEL=
D_GET(CSR_CRMD_DA, x), false);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0print_bool_fragment("PG", FIEL=
D_GET(CSR_CRMD_PG, x), false);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0print_memory_type_fragment("DA=
CF", FIELD_GET(CSR_CRMD_DACF,
> x));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0print_memory_type_fragment("DA=
CM", FIELD_GET(CSR_CRMD_DACM,
> x));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0print_bool_fragment("WE", FIEL=
D_GET(CSR_CRMD_WE, x), false);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont(")\n");
> +}
> +
> =C2=A0static void __show_regs(const struct pt_regs *regs)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const int field =3D 2 * s=
izeof(unsigned long);
> @@ -194,7 +238,7 @@ static void __show_regs(const struct pt_regs
> *regs)
> =C2=A0#undef GPR_FIELD
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Print important CSRs *=
/
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont(" CRMD: %08lx\n", regs=
->csr_crmd);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0print_crmd(regs->csr_crmd);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont(" PRMD: %08lx\n",=
 regs->csr_prmd);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont(" EUEN: %08lx\n",=
 regs->csr_euen);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont(" ECFG: %08lx\n",=
 regs->csr_ecfg);

