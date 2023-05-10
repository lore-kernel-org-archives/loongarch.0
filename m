Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C58A63E
	for <loongarch@lists.linux.dev>; Wed, 10 May 2023 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BObtCJ4EJyZaxZjmZMNxGSQfxnidWfZ74BSgGFC7kEA=; b=YR95V6SLWDl835/OD8lyxUGpMR
	i0mQy3Mo0dDrwXa/DTmjy3J2H1G8JGWKmB8Cf9bxkpBHzjId4jx0wQp8G1czXCEp7cBSsCZrYeJFH
	IdL5x8fBkaR/1+Hx6uo5fYVr+luwyML3Dz+5esf2V0aFzx2WdDCFz3LSS5fMQDlfIbLKYSDAq9Nzy
	TxN7ju2HOaM9DozK+Ft/+tc08vcRwtmtxA9sSMDqzda2CztcxDpRPt+37uvw5E3LHsyX7MWIUv0YU
	jxDYpaUzOy05d5WEzlSgPag8fvyR2cqVae0b4Vr+YYIxFMozn2Upqjdxhg2uU5FLE1f+0iFj/Yx2n
	BBNjoGRQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pwg6Y-00G8zE-Va; Wed, 10 May 2023 09:27:27 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 07DED3000D5;
	Wed, 10 May 2023 11:27:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id D4A6820B04BA9; Wed, 10 May 2023 11:27:23 +0200 (CEST)
Date: Wed, 10 May 2023 11:27:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Youling Tang <tangyouling@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, WANG Xuerui <kernel@xen0n.name>,
	Zhangjin Wu <falcon@tinylab.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v2] LoongArch: Add jump-label implementation
Message-ID: <20230510092723.GK4253@hirez.programming.kicks-ass.net>
References: <1683710206-23905-1-git-send-email-tangyouling@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683710206-23905-1-git-send-email-tangyouling@loongson.cn>

On Wed, May 10, 2023 at 05:16:46PM +0800, Youling Tang wrote:
> Add jump-label implementation based on the ARM64 version.
> 
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>

> diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/include/asm/jump_label.h
> new file mode 100644
> index 000000000000..2f9fdec256c5
> --- /dev/null
> +++ b/arch/loongarch/include/asm/jump_label.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023 Loongson Technology Corporation Limited
> + *
> + * Based on arch/arm64/include/asm/jump_label.h
> + */
> +#ifndef __ASM_JUMP_LABEL_H
> +#define __ASM_JUMP_LABEL_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/types.h>
> +
> +#define JUMP_LABEL_NOP_SIZE	4
> +
> +static __always_inline bool arch_static_branch(struct static_key * const key,
> +					       const bool branch)
> +{
> +	asm_volatile_goto(
> +		"1:	nop					\n\t"
> +		 "	.pushsection	__jump_table, \"aw\"	\n\t"
> +		 "	.align		3			\n\t"
> +		 "	.long		1b - ., %l[l_yes] - .	\n\t"
> +		 "	.quad		%0 - .			\n\t"
> +		 "	.popsection				\n\t"
> +		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +static __always_inline bool arch_static_branch_jump(struct static_key * const key,
> +						    const bool branch)
> +{
> +	asm_volatile_goto(
> +		"1:	b		%l[l_yes]		\n\t"
> +		 "	.pushsection	__jump_table, \"aw\"	\n\t"
> +		 "	.align		3			\n\t"
> +		 "	.long		1b - ., %l[l_yes] - .	\n\t"
> +		 "	.quad		%0 - .			\n\t"
> +		 "	.popsection				\n\t"
> +		 :  :  "i"(&((char *)key)[branch]) :  : l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}

Seems simple enough; one change I did a while ago for the x86 version is
to put the __jump_table entry generation in a macro so it could be
shared between the (3 for x86) variants.

Not saying you have to do that, just saying it's an option.

> +#endif  /* __ASSEMBLY__ */
> +#endif	/* __ASM_JUMP_LABEL_H */

> diff --git a/arch/loongarch/kernel/jump_label.c b/arch/loongarch/kernel/jump_label.c
> new file mode 100644
> index 000000000000..b06245955f7a
> --- /dev/null
> +++ b/arch/loongarch/kernel/jump_label.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Loongson Technology Corporation Limited
> + *
> + * Based on arch/arm64/kernel/jump_label.c
> + */
> +#include <linux/jump_label.h>
> +#include <linux/kernel.h>
> +#include <asm/inst.h>
> +
> +void arch_jump_label_transform(struct jump_entry *entry,
> +			       enum jump_label_type type)
> +{
> +	void *addr = (void *)jump_entry_code(entry);
> +	u32 insn;
> +
> +	if (type == JUMP_LABEL_JMP)
> +		insn = larch_insn_gen_b(jump_entry_code(entry), jump_entry_target(entry));
> +	else
> +		insn = larch_insn_gen_nop();
> +
> +	larch_insn_patch_text(addr, insn);
> +}

This all implies Loongarch is fine with the nop<->b transition (much
like arm64 is), but I found no actual mention of what transitions are
valid for the architecture in your inst.c file -- perhaps you could put
a small comment there to elucidate the occasional reader that doesn't
have your arch manual memorized?


Anyway, as with most RISC implementations it's short and sweet.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
