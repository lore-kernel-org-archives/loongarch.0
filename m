Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B24335B13E;
	Fri,  9 Jan 2026 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960573; cv=none; b=OjteA7tU2HhcLii6u+p2A/aSD1V8lI2Sgog+jMc1uUXhcakn1UI89GCn2NXTKEJvmfpXTaTiDumP2n3PrSSGJooIBrMzopBpwkkrRcRuMS9hXlwyCFeeePABNskeg1zlbzpKtiVp+IRCcnO8xzSiFptnm1FpiP+d3ikKaJ+D5q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960573; c=relaxed/simple;
	bh=KRKZju+IaQaP6u/CbzL2n9ZD8AKowg2r61leFb+qKOU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GbiR/ZuVRz5k5+49PKX+hPPn5n2mqPGmEj8q8d3QCGimn9SUc/eUYcMpcTX8dXLBBhnEHBpJM3Cqof12uMq9svSU/47BrhpSqJjEtjVv39M7dOms2SouML8qBrWtCEdKPMv5GL5VGwtOessNB2YqcSvhJUHaiwbIGClsO56TndY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLYNCCte; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLYNCCte"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A2EC4CEF1;
	Fri,  9 Jan 2026 12:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767960573;
	bh=KRKZju+IaQaP6u/CbzL2n9ZD8AKowg2r61leFb+qKOU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gLYNCCteUYaFM29q8UhfF94jbsY71FecPpBkd95oFIU+6s+tFwVuZCJIo0x+85QSS
	 6WWhxfwpy5MwVttL5Kvlu+kWWHPnW0TjZtvWtStO7Vgq5PDFOMVUrs5FeflBlRanIh
	 QPp2ydqFEJf9+kBAIxrCHb2fy/PQMPENjngMINvcwr2lOz9ZB238CFGuOPVlyc3pMh
	 ZUBWtw5yL+o1WG0qJD1FVh9igmN4TnjQlSMquell90GSndyU2XJGBuLeHvDwAFPDq9
	 lQZm5tVBHHB5Pe7hOzs8twbjMvrF2pJv/g3qawYp8BZ4QUVMX+TDf19xRvxjacO1Zt
	 Vorte3NfyWLdQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Xuefeng Li
 <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/7] irqchip/loongarch-avec: Adjust irqchip driver for
 32BIT/64BIT
In-Reply-To: <20251223080437.3367240-2-chenhuacai@loongson.cn>
References: <20251223080437.3367240-1-chenhuacai@loongson.cn>
 <20251223080437.3367240-2-chenhuacai@loongson.cn>
Date: Fri, 09 Jan 2026 13:09:29 +0100
Message-ID: <87bjj3rnra.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Dec 23 2025 at 16:04, Huacai Chen wrote:

> csr_read64() is only available on 64BIT LoongArch platform, so use
> recently added adaptive csr_read() instead, so as to make the driver
> work on both 32BIT and 64BIT platform.
>
> BTW, make avecintc_enable() be a no-op since it is only needed by 64BIT
> platform.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

I assume Jiaxun is the author, which means that this lacks a

  From: Jiaxun

line in the mail body before the change log starts. Please try again.

>  static inline void avecintc_enable(void)
>  {
> +#ifdef CONFIG_MACH_LOONGSON64
>  	u64 value;
>  
>  	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
>  	value |= IOCSR_MISC_FUNC_AVEC_EN;
>  	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> +#endif

Can't this be:

      if (IS_ENABLED(CONFIG_MACH_LOONGSON64))

which is preferred over ifdeffery?

Thanks,

        tglx
