Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697659;
	b=fgArpj6RTyPy0czUn9wPrT5hRu17fq8H8t4AzCnOlPeoTghlRSdwgoQEzcYg7PveqNCd
	 mGkPTmEDbr4MVoXXXn/dibLZflXlie7cWxs/Xp1O2ZU3lLhJCaX1W6R4kkm9rWFJ89VDf
	 4sNnvwWow7saB4Hc90g4mi17XvT/B/0SgdwwduZSpcZgFPmjakLmYmvgRRX1s1qidTg1W
	 sMWYZnhnPc+HFyPE3tEJsJm8FTpn4ub/QhX9KwxLThAN7nq/nVMuU384WC9fmfoEcv94A
	 AB4RdV6ZaoMN/BfNVTNEB7sW8oW8bB/SMdYnxefCwl3yYNVLh+9lb1opmM6doWh5Vhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697659;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=FxNnFypmQodB5jf3trdtEkzarufuoaXPyhp09jSaaYQ=;
	b=MVAzn00pQbI3UaphMPUps7/RifIRncvGIvHTOfmMUYjG1umWFBdn5rhvF+/2MQm7WNGW
	 5EmmDLhvcOPu4sl5UVadTgCZa3IQYbg3WjE8W1r9LihK5NwRGyV8aT7OODtmNJ9kvWGe5
	 fPDhvYy1XLzIDeOrsDiBOQeDfV5dYxtKqyx7T208FksGGDmx5w5sZ8ANXcxxpRsJQYVzQ
	 /zlhxcouwdkjBUv/Cd4eEvXx7rIcFMuKxglHPSFZ3XCMLA0l0crBvmTHfzulWFeqnDnva
	 yqxGVwTGOin76r0MWBo0R94earQ7eS1Ot1o0bCn5+fS/NKeml1jaB6140SWpigmQtCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PaQEmqDQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F311606A31E
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PaQEmqDQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0F91F000C0;
	Thu, 26 Nov 2026 12:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697659;
	bh=FxNnFypmQodB5jf3trdtEkzarufuoaXPyhp09jSaaYQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=PaQEmqDQKHMUmLytyTolHbg8lf4qY3V3CECLZPx58atHc6Qo4pFWGG03VFmO0uaJA
	 ureEPF5HZwoQoSRz5u+wXjh/7AecqztSaFDw185is8wfaU8tRzjKuJeyOo4EcQtoeE
	 gxHkdr9ZTYqgXrTd9jZxby5nzxVaysKyDe3vEnK73wozw71COR5tPJ5fGBZieAZn2c
	 G0P6bc3FDkjZaeA2p3niSxQ+4Vc24zaNa0J5ylONRXK8120kZCyDUs60oHofy6dlbI
	 vcj1D+IeaQVZXwAuO3EHUBMktXDZOWm6aY+62MPZ2XZM82dXVhzGL+a4w2whY6QU3l
	 rFh4/h3m1x6fQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id E8C661980047;
	Thu, 26 Nov 2026 07:54:16 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 26 Nov 2026 07:54:16 -0500
X-ME-Sender: <xms:9isIa1mQkW_omfFu8Ogw7sDmj9dLq-m2Sh9r8JtgVwQ89MF4Rm95Kw>
    <xme:9isIa7o_RWTG1yiwzCDpe9AyUKxvlCIjYCd9w-jJsXxuOXUQAaJHWhA0OZPVrtUKP
    -4ePE-NrSWTJc08eN5KIZ4M4zrgXwgTNju0dHzaw2-f2u_UbsrJUKT_>
X-ME-Proxy-Cause: dmFkZTE8fWJfctqFPvKY7gTircR3cEGnIrqCpM5qgH0RN8ZK+FWYvz+vJLcJO5ZXIZZZQw
    f7i2vvmKhyNHo96GZbT/RFpZ1+ezgvHIvsl7yU0okcXUpJRbEPFm/V6A6frKXVPLGuQY8Z
    OJQy27DYphr3hMwQFggyd6T1oczeNkY4/uUs8j2oSbIJMBKs5nY8D2j9IkGjRn4DOz82T2
    U4o5K11dsVb4bSuNYay/Rz1peQb8X70A8jQOFlsoy4JLPTh65p2KzY/IT5fGxf20unqHkv
    Cx8Py+cODmnZtbDQcx9T7vGaV7Xm39b2v9t4Z7z/xwkqsXw53a3GQwFLVfvC8W7WDNyQWa
    nUNDVVsK4kDP/JcUCigH9pkUljfBNB0AL6ezr03QXF8HkYU0qsKw4EGzc5Hn6aNxh+/G1j
    OiOuF2uOxJIz+PdNpX2+PbY9eS6AXQobh2sZQxgyPk/NPmmcnMunhi074NRrQltTQ01mFF
    XYnfpllVgIeUl2pZuEYhnQZXPppF8hzDipntNwPuogSiI9Bgd/K6JHQD4tKhP8X7Orkwa4
    ld5lhm+UpiCbc51K1TXrJ9vAmPu0XxLQHEggdnHKumcYhQ2oMmOT1jZWXis13qaOE4sL4M
    fOqj6hpJ3aHTHO/XCUddpcMa3gH+6PqZCYE8rLBkH/NMcmf8GNF/XdG5l2DQ
X-ME-Proxy: <xmx:-CsIa4ERdTkQBtyUAoTe60lZfrTCZ8rDSB7u5vQTdbhVeuL5ezop4A>
    <xmx:-CsIa8R4rjQyhNBAopIbVW4uh8MMuu-PkXQTI3Hgt_hkdIr6-LlIkA>
    <xmx:-CsIaxL6gYmhgTZFscZFqGbIFmK_QfaZLZ3lh9vYZck7eIQsnX142g>
    <xmx:-CsIa_apaXbezpDCvM733K9L72WLfizvCrx0lZlNogNlikLrzAuUXQ>
    <xmx:-CsIa789vEdHAz2RT3Qx4AvWv87DXKdJ7nvDNkuGOnebnGVLkL4kRGpT>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DF94CF8009A; Thu, 26 Nov 2026 07:54:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 13:53:54 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Dmitry Antipov" <dmantipov@yandex.ru>,
 "Huacai Chen" <chenhuacai@kernel.org>
Cc: "WANG Xuerui" <kernel@xen0n.name>, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, "kernel test robot" <lkp@intel.com>
Message-Id: <534a9786-8594-4f0b-8ce8-ea1844581c0b@app.fastmail.com>
In-Reply-To: <20261126124145.876953-1-dmantipov@yandex.ru>
References: <20261126124145.876953-1-dmantipov@yandex.ru>
Subject: Re: [PATCH v2] efi/libstub: fix building loongarch32 without zboot enabled
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, 26 Nov 2026, at 13:41, Dmitry Antipov wrote:
> Kernel test robot has reported the following error observed on loongarch:
>
> loongarch64-linux-ld: 
> ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function 
> `__efistub_.L47':
> __efistub_cmdline.c:(.init.text+0x258): undefined reference to 
> `__efistub___ashldi3'
> loongarch64-linux-ld: __efistub_cmdline.c:(.init.text+0x268): undefined 
> reference to `__efistub___lshrdi3'
>
> Following the approach introduced in commit a354b8de9ad6
> ("riscv: add platform-specific double word shifts for riscv32"),
> define EFI stub aliases for __ashldi3() and __lshrdi3() for
> loongarch32 as well, thus making the related EFI stub's Makefile
> quirks redundant.
>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: 
> https://lore.kernel.org/oe-kbuild-all/20261122125352.gAcg5yLx-lkp@intel.com/
> Fixes: 442082297e3d ("riscv: fix building compressed EFI image")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v2: define relevant EFI stubs in image-vars.h (Ard) 
> ---
>  arch/loongarch/kernel/image-vars.h    | 2 ++
>  drivers/firmware/efi/libstub/Makefile | 7 +------
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/loongarch/kernel/image-vars.h 
> b/arch/loongarch/kernel/image-vars.h
> index e557ebd46c2b..19202f4f84c2 100644
> --- a/arch/loongarch/kernel/image-vars.h
> +++ b/arch/loongarch/kernel/image-vars.h
> @@ -8,6 +8,8 @@
>  #ifdef CONFIG_EFI_STUB
> 
>  __efistub_strcmp		= strcmp;
> +__efistub___lshrdi3		= __lshrdi3;
> +__efistub___ashldi3		= __ashldi3;
>  __efistub_kernel_entry		= kernel_entry;
>  __efistub_kernel_asize		= kernel_asize;
>  __efistub_kernel_fsize		= kernel_fsize;

For the part above ^^^:

Acked-by: Ard Biesheuvel <ardb@kernel.org>

NAK to the changes below, they break zboot and need to be dropped.

Huacai, I'd prefer to take this via the efi tree - otherwise,
it will conflict with other changes that are queued up for
the next cycle.




> diff --git a/drivers/firmware/efi/libstub/Makefile 
> b/drivers/firmware/efi/libstub/Makefile
> index bbab12b8eb4b..bcf2a5981678 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -96,12 +96,7 @@ zboot-obj-y			:= zboot-decompress-gzip.o
>  CFLAGS_zboot-decompress-gzip.o	+= -I$(srctree)/lib/zlib_inflate
>  zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o
>  CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
> -
> -zboot-riscv-obj-$(CONFIG_32BIT)	:= lib-ashldi3.o lib-lshrdi3.o
> -zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)
> -zboot-loongarch-obj-$(CONFIG_32BIT) := lib-ashldi3.o lib-lshrdi3.o
> -zboot-obj-$(CONFIG_LOONGARCH)	+= lib-clz_ctz.o $(zboot-loongarch-obj-y)
> -lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
> +lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o
> 
>  lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
> 
> -- 
> 2.56.1
