Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEAC7B
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 13:11:43 +0000 (UTC)
X-UUID: 551d95d4efef43d0961a7748cc8d2087-20230425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:fd03dcf5-ffdb-433a-8e7c-047e84a592e2,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:2
X-CID-INFO: VERSION:1.1.22,REQID:fd03dcf5-ffdb-433a-8e7c-047e84a592e2,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:2
X-CID-META: VersionHash:120426c,CLOUDID:99d177a2-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:230425210629DFOBNBX6,BulkQuantity:0,Recheck:0,SF:17|19|42|101|38|25|
	100|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 551d95d4efef43d0961a7748cc8d2087-20230425
X-User: lienze@kylinos.cn
Received: from [192.168.3.105] [(61.48.209.226)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 228941337; Tue, 25 Apr 2023 21:06:27 +0800
Message-ID: <e9bfc2e3f9d90797c032798b7bb762537a56a68e.camel@kylinos.cn>
Subject: Re: [PATCH v7 03/12] LoongArch: Print GPRs with ABI names when
 showing registers
From: Enze Li <lienze@kylinos.cn>
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Date: Tue, 25 Apr 2023 21:06:25 +0800
In-Reply-To: <20230425081023.3809434-4-kernel@xen0n.name>
References: <20230425081023.3809434-1-kernel@xen0n.name>
	 <20230425081023.3809434-4-kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Xuerui,

Thanks for doing this.  Overall, I like this idea, but I think I found
an easily fixable problem in this patch, please see below.

On Tue, 2023-04-25 at 16:10 +0800, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
>=20
> Show PC (CSR.ERA) in place of $zero, and also show the syscall
> restart
> flag (conveniently stuffed in regs[0]) if non-zero.
>=20
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
> =C2=A0arch/loongarch/kernel/traps.c | 36 ++++++++++++++++++++++----------=
-
> --
> =C2=A01 file changed, 23 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/loongarch/kernel/traps.c
> b/arch/loongarch/kernel/traps.c
> index 529165eb6e6b..cdb17d6afc77 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -158,22 +158,32 @@ static void __show_regs(const struct pt_regs
> *regs)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const int field =3D 2 * s=
izeof(unsigned long);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int excsubcode;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int exccode;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0show_regs_print_info(KERN=
_DEFAULT);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Saved main processor regist=
ers
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < 32; ) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if ((i % 4) =3D=3D 0)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printk("$=
%2d=C2=A0=C2=A0 :", i);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pr_cont(" %0*lx", field, regs->regs[i]);
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0i++;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if ((i % 4) =3D=3D 0)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("=
\n");
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Print GPRs except $zero (su=
bstituting with PC/ERA) */
> +#define GPR_FIELD(x) field, regs->regs[x]

The checkpatch.pl throws up the following error,

-------------------------------------------------------------------
ERROR: Macros with complex values should be enclosed in parentheses
#40: FILE: arch/loongarch/kernel/traps.c:165:
+#define GPR_FIELD(x) field, regs->regs[x]
-------------------------------------------------------------------

and I think adding a pair of parentheses is a good way, like this,

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -162,7 +162,7 @@ static void __show_regs(const struct pt_regs *regs)
        show_regs_print_info(KERN_DEFAULT);
=20
        /* Print GPRs except $zero (substituting with PC/ERA) */
-#define GPR_FIELD(x) field, regs->regs[x]
+#define GPR_FIELD(x) (field, regs->regs[x])
        pr_cont("pc %0*lx ra %0*lx tp %0*lx sp %0*lx\n",
                field, regs->csr_era, GPR_FIELD(1), GPR_FIELD(2),
GPR_FIELD(3));
        pr_cont("a0 %0*lx a1 %0*lx a2 %0*lx a3 %0*lx\n",
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

In addition, the checkpatch.pl also throws up some warnings.  Should
these use pr_info() instead?

--------------------------------------------------------
WARNING: Avoid logging continuation uses where feasible
#41: FILE: arch/loongarch/kernel/traps.c:166:
+	pr_cont("pc %0*lx ra %0*lx tp %0*lx sp %0*lx\n",

WARNING: Avoid logging continuation uses where feasible
#43: FILE: arch/loongarch/kernel/traps.c:168:
+	pr_cont("a0 %0*lx a1 %0*lx a2 %0*lx a3 %0*lx\n",

WARNING: Avoid logging continuation uses where feasible
#45: FILE: arch/loongarch/kernel/traps.c:170:
+	pr_cont("a4 %0*lx a5 %0*lx a6 %0*lx a7 %0*lx\n",
--------------------------------------------------------

Best Regards,
Enze

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("pc %0*lx ra %0*lx tp =
%0*lx sp %0*lx\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0field, regs->csr_era, GPR_FIELD(1), GPR_FIELD(2),
> GPR_FIELD(3));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("a0 %0*lx a1 %0*lx a2 =
%0*lx a3 %0*lx\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0GPR_FIELD(4), GPR_FIELD(5), GPR_FIELD(6),
> GPR_FIELD(7));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("a4 %0*lx a5 %0*lx a6 =
%0*lx a7 %0*lx\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0GPR_FIELD(8), GPR_FIELD(9), GPR_FIELD(10),
> GPR_FIELD(11));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("t0 %0*lx t1 %0*lx t2 =
%0*lx t3 %0*lx\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0GPR_FIELD(12), GPR_FIELD(13), GPR_FIELD(14),
> GPR_FIELD(15));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("t4 %0*lx t5 %0*lx t6 =
%0*lx t7 %0*lx\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0GPR_FIELD(16), GPR_FIELD(17), GPR_FIELD(18),
> GPR_FIELD(19));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("t8 %0*lx u0 %0*lx s9 =
%0*lx s0 %0*lx\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0GPR_FIELD(20), GPR_FIELD(21), GPR_FIELD(22),
> GPR_FIELD(23));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("s1 %0*lx s2 %0*lx s3 =
%0*lx s4 %0*lx\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0GPR_FIELD(24), GPR_FIELD(25), GPR_FIELD(26),
> GPR_FIELD(27));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_cont("s5 %0*lx s6 %0*lx s7 =
%0*lx s8 %0*lx\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0GPR_FIELD(28), GPR_FIELD(29), GPR_FIELD(30),
> GPR_FIELD(31));
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* The slot for $zero is reuse=
d as the syscall restart flag
> */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (regs->regs[0])
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pr_cont("syscall restart flag: %0*lx\n",
> GPR_FIELD(0));
> +#undef GPR_FIELD
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Saved csr registers

