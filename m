Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7D83D9E
	for <loongarch@lists.linux.dev>; Fri, 29 Jul 2022 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1659084024;
	bh=qVACV7bz4zGf1t3CnRp5Cj62T95tqtofD76Q2nBE43Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jgTZpdWtfW8n1M2Gzlv596ZaIj/rpX9xDH7iHMommbRh2B7TfB5qYYX4VF0N5Y4Z5
	 tHTfU+GfuPjEmjvzJsBuqlKLUOS10rMQg6IBNTqVA8FqSip+SN/z4iAboAG/4EPqee
	 ecsYg78ILpJtV19iUPonCBeYangEqODMZSYbdlKk=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 949C5669EB;
	Fri, 29 Jul 2022 04:40:22 -0400 (EDT)
Message-ID: <88259699f98be6eadf574ad01f2bab32c4818b0d.camel@xry111.site>
Subject: [PATCH v4 2/4] LoongArch: Support R_LARCH_SOP_PUSH_GPREL relocation
 type in kernel module
From: Xi Ruoyao <xry111@xry111.site>
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Huacai
 Chen <chenhuacai@kernel.org>, Youling Tang <tangyouling@loongson.cn>,
 Jinyang He <hejinyang@loongson.cn>
Date: Fri, 29 Jul 2022 16:40:21 +0800
In-Reply-To: <32a74a218c76611f897fd1df1ad0059068621133.camel@xry111.site>
References: <32a74a218c76611f897fd1df1ad0059068621133.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

This relocation type pushes the offset of the GOT entry for a symbol
from the beginning of GOT into the relocation stack.  Our linker script
has initialized an empty GOT, so we need to create a new GOT entry if
there is no exist one for a symbol.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/kernel/module.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/module.=
c
index 638427ff0d51..3ac4fbb5f109 100644
--- a/arch/loongarch/kernel/module.c
+++ b/arch/loongarch/kernel/module.c
@@ -122,6 +122,16 @@ static int apply_r_larch_sop_push_plt_pcrel(struct mod=
ule *mod, u32 *location, E
 	return apply_r_larch_sop_push_pcrel(mod, location, v, rela_stack, rela_st=
ack_top, type);
 }
=20
+static int apply_r_larch_sop_push_gprel(struct module *mod, u32 *location,
+			Elf_Addr v, s64 *rela_stack, size_t *rela_stack_top,
+			unsigned int type)
+{
+	Elf_Addr got =3D module_emit_got_entry(mod, v);
+	ptrdiff_t offset =3D (void *)got - (void *)mod->arch.got.shdr->sh_addr;
+
+	return rela_stack_push(offset, rela_stack, rela_stack_top);
+}
+
 static int apply_r_larch_sop(struct module *mod, u32 *location, Elf_Addr v=
,
 			s64 *rela_stack, size_t *rela_stack_top, unsigned int type)
 {
@@ -306,6 +316,7 @@ static reloc_rela_handler reloc_rela_handlers[] =3D {
 	[R_LARCH_SOP_PUSH_PCREL]			     =3D apply_r_larch_sop_push_pcrel,
 	[R_LARCH_SOP_PUSH_ABSOLUTE]			     =3D apply_r_larch_sop_push_absolute,
 	[R_LARCH_SOP_PUSH_DUP]				     =3D apply_r_larch_sop_push_dup,
+	[R_LARCH_SOP_PUSH_GPREL]			     =3D apply_r_larch_sop_push_gprel,
 	[R_LARCH_SOP_PUSH_PLT_PCREL]			     =3D apply_r_larch_sop_push_plt_pcrel,
 	[R_LARCH_SOP_SUB ... R_LARCH_SOP_IF_ELSE] 	     =3D apply_r_larch_sop,
 	[R_LARCH_SOP_POP_32_S_10_5 ... R_LARCH_SOP_POP_32_U] =3D apply_r_larch_so=
p_imm_field,
--=20
2.37.0


