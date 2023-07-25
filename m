Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2B415AD0
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 11:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dBfOJF6wcyEPKiOzCRlb+/ZINYObsi7uGBUstRjgH30=; b=DtG2frtEcur0dl4kw7KmlXLL/V
	Y32gvAmJDdksIdSKqKhsLYZGclgrNx4kwQ87OjklPNs5C/AcOn3sP2QL8hGt9fVRNieDxbJI4lRNb
	1UsgqHv95//JaPdS9DtuS/LYXcxFdkjQGGZEKt8+G3EU7zf1oXiwvU6wQkar0YsfRzx/uLxhUqheT
	I7Nf5tM51Ei0nrDpEXhujzfP7fjN602/khhGUDLPaGwal/12wATkXfXVtbBBJUGL63IyCFySLl5ab
	VffY2sB8tVNupxRRqoPDeNuDjYd2cVLm3/vxCK4RafzYoXOx+nUOoGJjnf+ymiu492qvMtqNMndyZ
	mREs4DYQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qOGeA-005RAh-54; Tue, 25 Jul 2023 11:56:10 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2C37B3001FD;
	Tue, 25 Jul 2023 13:56:10 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 114C12612ABE5; Tue, 25 Jul 2023 13:56:10 +0200 (CEST)
Date: Tue, 25 Jul 2023 13:56:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v1 4/6] objtool/LoongArch: Enable orc to be built
Message-ID: <20230725115609.GD3765278@hirez.programming.kicks-ass.net>
References: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>
 <1690272910-11869-5-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1690272910-11869-5-git-send-email-yangtiezhu@loongson.cn>

On Tue, Jul 25, 2023 at 04:15:08PM +0800, Tiezhu Yang wrote:

> +void arch_write_orc(struct elf *elf, struct orc_entry *orc)
> +{
> +	orc->ra_offset = bswap_if_needed(elf, orc->ra_offset);
> +}

This hardly 'writes' anything, all it does is a bswap.

> diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
> index 1eff7e0a..6975056 100644
> --- a/tools/objtool/orc_gen.c
> +++ b/tools/objtool/orc_gen.c
> @@ -14,6 +14,8 @@
>  #include <objtool/warn.h>
>  #include <objtool/endianness.h>
>  
> +void __weak arch_write_orc(struct elf *elf, struct orc_entry *orc) {}

And for that you need a weak function? What's wrong with an inline if
anything?

>  static int write_orc_entry(struct elf *elf, struct section *orc_sec,
>  			   struct section *ip_sec, unsigned int idx,
>  			   struct section *insn_sec, unsigned long insn_off,
> @@ -26,6 +28,7 @@ static int write_orc_entry(struct elf *elf, struct section *orc_sec,
>  	memcpy(orc, o, sizeof(*orc));
>  	orc->sp_offset = bswap_if_needed(elf, orc->sp_offset);
>  	orc->bp_offset = bswap_if_needed(elf, orc->bp_offset);
> +	arch_write_orc(elf, orc);

Why can't this simply be:

	orc->ra_offset = bswap_if_needed(elf, orc->ra_offset);

AFAICT this won't actually do anything for x86 and I don't think Power
got around to doing ORC yet.

>  
>  	/* populate reloc for ip */
>  	if (!elf_init_reloc_text_sym(elf, ip_sec, idx * sizeof(int), idx,

Again, not much explaination for why you did things
