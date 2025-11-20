Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA2332ED5D
	for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.28.160.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635525; cv=none; b=WOq4y93uhy3jgBt2turhDAifw7H1Q5XLDjPFPFD2BiuL4W6ZthsifK39+lUICtO+BoWrNN5WMia5eg7SmZksal3JP59jf93O0a3wj+mKUC+eGy+JulZ8tGiTc9kfjirWISPmfkba/YHAIOSdH2TqW7RUSb0QOqL9ys9Q+edhd6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635525; c=relaxed/simple;
	bh=WGPeY949NNvBhqJ23Ddi4o5OdVC061NQkd8rjC4vvlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=St+QKq0Ey4rQ80v9TjVRhQzdJDs9zWnVgdK4LrjEjoIYdVYgWCo0k7qlWb80pVTPGvGBN5ny4auu1DGbihMKwII6Bi6EqMA0gaWI/XCw+6j99NMGlDuFUP7JtRS/NMEvH+Rif6W6kE7YFLbT7kDGg7Yey17hNlk/Qkzu7EQv+SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name; spf=pass smtp.mailfrom=xen0n.name; dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b=HgVbA+wd; arc=none smtp.client-ip=115.28.160.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="HgVbA+wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1763635518; bh=WGPeY949NNvBhqJ23Ddi4o5OdVC061NQkd8rjC4vvlk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HgVbA+wd6yksxqOoiLSpOj9to1RqlYNJ4OjXSnJ97ymVNJZ1CBI8cSQZmapnnYRCO
	 PvVTotmA2+ONCsauAI+w6/EvW5VXoSEPa7axi++zyaMqHzFpnYXTRSBZL7FWtqdNFf
	 CoKK4cY1rw/PaGEzu3QZPVXXLS3VWvKsOVThOEtk=
Received: from [28.0.0.1] (unknown [182.200.17.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5019A60154;
	Thu, 20 Nov 2025 18:45:18 +0800 (CST)
Message-ID: <8dd8334b-388b-4681-a62e-11e10b6d6466@xen0n.name>
Date: Thu, 20 Nov 2025 18:45:17 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 11/14] LoongArch: Adjust misc routines for 32BIT/64BIT
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
References: <20251118112728.571869-1-chenhuacai@loongson.cn>
 <20251118112728.571869-12-chenhuacai@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20251118112728.571869-12-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 19:27, Huacai Chen wrote:
> Adjust misc routines for both 32BIT and 64BIT, including: checksum,
> jump label, unaligned access emulator, PCI init routines, sleep/wakeup
> routines, etc.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/include/asm/checksum.h   |  4 ++
>   arch/loongarch/include/asm/jump_label.h | 12 ++++-
>   arch/loongarch/include/asm/string.h     |  2 +
>   arch/loongarch/kernel/unaligned.c       | 30 ++++++++---
>   arch/loongarch/lib/unaligned.S          | 72 ++++++++++++-------------
>   arch/loongarch/pci/pci.c                |  8 +--
>   arch/loongarch/power/suspend_asm.S      | 72 ++++++++++++-------------
>   7 files changed, 116 insertions(+), 84 deletions(-)
> 
> [snip]
> diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
> index 5bc9627a6cf9..d9fc5d520b37 100644
> --- a/arch/loongarch/pci/pci.c
> +++ b/arch/loongarch/pci/pci.c
> @@ -50,11 +50,11 @@ static int __init pcibios_init(void)
>   	 */
>   	lsize = cpu_last_level_cache_line_size();
>   
> -	BUG_ON(!lsize);
> +	if (lsize) {
> +		pci_dfl_cache_line_size = lsize >> 2;
>   
> -	pci_dfl_cache_line_size = lsize >> 2;
> -
> -	pr_debug("PCI: pci_cache_line_size set to %d bytes\n", lsize);
> +		pr_debug("PCI: pci_cache_line_size set to %d bytes\n", lsize);
> +	}
>   
>   	return 0;
>   }
Mind adding a few words about why this is no longer considered a BUG and 
why functionality isn't adversely affected by the change?

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
