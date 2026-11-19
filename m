Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086458;
	b=ffvnMpUXwYhcNwwH8yih6DgA4xK6hTJOznnnnykFS4BqtD5xDAcAD/oD10iazh3d+kr+
	 dAZ+O42Z9vQWhlycgJY0Huim8S9w8TDvq6s7YLMUN39ZV7o5PxBgfHeIwYjOy3HUaUUUX
	 27+jGDeITKdyGggsYmvBRAfaWLzvnepY4yHDs93ZL7c5oZsWyEsjvBVG9FF35dSXqKq4a
	 BSr8uOdX+rzM59DNzIJdJElAFgHwmYNCsxg1Dp7oMhuvrqLeFI9vBA8/GhjUMdNugKxll
	 uKgUnOe2yRNbrvuq4+r2yKlQxFhhqjid/TzplSIbuk8Jc7Z4qJ7dJvwYtHid7CmVIPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086458;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ROUL/Vc/05NVBxBY34tWsXgeOJdPCC39DtodeyW5ZQg=;
	b=TNjZgffFeiChJ7ohqI2DFDaXd96826S+aN3+oV0NCuSHsZL0OAm7gS8Tb3dQku8uyv7k
	 7sqmfkkwmJwEV1rtkXxHJV2PyggSIFBQJKDPbLPBQUJL/6B1VS1mPwUaNKCvhm84Ah3Iv
	 tNo+RLQ2MmA4zGZEkdoJEL2syB3vfgGd1qmLZZPaSBo0DosP9VT4nDGdOoL8n0xx9MqeX
	 fvTq38pyD6AQ7juCEKivZGZhNVzesUWYzs1KbtStRFLy0Qny4Pjgywa6KodZFwpichfnS
	 HSjZjf+bjrfTuUGI077zcibHKTLFXJKgfL6EWOBrMho+rfAOFDEBprIioAVomOIAoiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SfPvoyK+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111B0606A324;
	Thu, 19 Nov 2026 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SfPvoyK+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FB51F000C4;
	Thu, 19 Nov 2026 11:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086457;
	bh=ROUL/Vc/05NVBxBY34tWsXgeOJdPCC39DtodeyW5ZQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SfPvoyK+9KlmRpG703U6jl/NLnRdSEjycGz0XJ/6xbWJPMUIWmjVPJAGkRBrB8KaU
	 b/+gGVKmCIFIXoYZvOXm0ljG8iAQUdrW9zDMXb35+msUCr0JIBP0vVzWTcpm/rCpHt
	 L9tSUsDHSSuzeYEaLENZnN8gFbzOysB/MbJHrztkIlY8/c0xJQf1DA9/AnUqBiKEXz
	 X9jJYLcJuma7wp1N5DaWfiZ/0SJx6xotaGh4We2okitxksgBlQQ4CHWeYm51YBPaUp
	 oc9NtOvq8BoktlekVvP80SK6F2UzvgHzskz381t8TFJsG60HPJsaS6ePYwuo/jbBlr
	 8fOQg3IuNNb0g==
Date: Thu, 19 Nov 2026 13:07:32 +0200
From: Mike Rapoport <rppt@kernel.org>
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, liukexin@kylinos.cn,
	guodongtai@kylinos.cn, loongarch@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Allow memblock arrays to resize
Message-ID: <av7YdBobrANyYgqg@kernel.org>
References: <20261119100216.10182-1-dongtai.guo@linux.dev>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119100216.10182-1-dongtai.guo@linux.dev>

On Thu, Nov 19, 2026 at 07:02:16PM +0900, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> LoongArch never calls memblock_allow_resize(), so the memblock region
> arrays cannot grow beyond their static sizes. For the reserved array
> that is INIT_MEMBLOCK_RESERVED_REGIONS (INIT_MEMBLOCK_REGIONS +
> NR_CPUS) entries. Once it is full, the next reservation that needs a
> new region panics:
> 
>   Kernel panic - not syncing: memblock: cannot resize reserved array
> 
> The memory setup code was derived from MIPS, which never enables
> resizing either. Nothing on LoongArch needs the arrays to stay static.
> 
> When an array is full, memblock allocates a bigger one from free
> memory, so resizing is only safe once all memory in use is reserved.
> By the time setup_arch() calls arch_mem_init(), the kernel image, the
> initrd, the firmware memory map, the device tree reserved-memory
> regions and the crash kernel are reserved, so enable resizing there.
> 
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
> This was patch 5/8 of the LoongArch KHO series v6 [1]. Mike suggested
> fixing it independently of KHO, and Huacai preferred arch_mem_init()
> to platform_init() [1].
> 
> KHO for LoongArch needs this: after kexec, kho_memory_init() reserves
> every preserved range, and luo_stress_files with 500 files overflows
> the reserved array without CONFIG_SMP. A bigger array cannot land on
> preserved memory, because KHO limits memblock allocations to its
> bootmem areas by then.
> 
> Changes since v6 5/8:
> - Sent on its own, without the KHO series.
> - Reworded the commit message and the comment so they do not depend
>   on KHO.
> 
> [1] https://lore.kernel.org/all/20261029172956.20791-6-dongtai.guo@linux.dev/
> 
>  arch/loongarch/kernel/setup.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> index 6fa4a22a58fd..8c33346a123a 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -402,6 +402,9 @@ static void __init arch_mem_init(char **cmdline_p)
>  
>  	check_kernel_sections_mem();
>  
> +	/* All memory in use is reserved now, so memblock can grow its arrays. */
> +	memblock_allow_resize();
> +
>  	memblock_set_bottom_up(true);

The placement seems about right to me :)

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
  
>  	swiotlb_init(true, SWIOTLB_VERBOSE);
> 
> base-commit: 422e532809572ba1043192bf6a0c653bc68b3140
> -- 
> 2.53.0
> 

-- 
Sincerely yours,
Mike.
