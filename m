Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DD0212548;
	Sun, 19 Jul 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784451720; cv=none; b=llYVd3eInZlXE5Tyimg6JdMO06UGMy0ro95ln7XuPxVGRZ2sve205ZS5Hw+3lx+8n2RTunPLLX6PwqM3Vp/vO4MB4tEsBl9LTrlXirDQ9z1vpoDgxB8jU8Gg66q5X/ftlUWHcAiNcwUHv4QebZkI7KzKXB5f7OlKkhHKGwd6I+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784451720; c=relaxed/simple;
	bh=dKxN9//+PLnDGS4AovWDSYKV0Fn3LYfpbwL9N+5gisw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMibotieCxxDrxR0zLvGjE72C4cvOzo9P8InEa0+mL6pHo0DetAcM0jUUiJkVuxIgSXPckE1WL3WZgud0bpmw4SUp4xHnUJm8Et3tjcnd9yZOnusqsxczrhmv51fP7zfnTulRZJDwVXmWGdKBIYkIIM7GAhY3OUEIQr/Oc8rYq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxYrqDE3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxYrqDE3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232671F000E9;
	Sun, 19 Jul 2026 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784451719;
	bh=GE4nZxrWNILr4LFFRjNo6DdTk/Sh1KEFBm564eW9JxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RxYrqDE37oWsZLMfniRw2CAsWoYmOTNiL0RXsV18c8RcXGAzpdI+ErM4J5RUVWkqD
	 JSymOjJOB+Hzx93sAkLLIsAgD3fHlZMLdclIHL3gnRh7mxZ4H+TKGizwC4Qz2W2eL7
	 fSurb44UXOSGSxdhWFIPu+iYcsiHD4F+v6VBhWVoKTEdorMS5F11FuC2feCgYx8VrZ
	 DY5gsGOwtzRi7UZZr+qwj776f4RE1sp05dFNqYngsJ/67jRpF/rdAyo2CIlG7bmE17
	 caFEFeR4uJM7mHzdZ8d8unE9EtpvW4ts/VljZzgC6JgbIiewxk7y/pSr1Sc9edmEfQ
	 h00A/dh2KsbRQ==
Date: Sun, 19 Jul 2026 12:01:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-mm@kvack.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] LoongArch: mm: Expand modules virtual address
 space to 2GB
Message-ID: <alySgaaQen6ZtwSo@kernel.org>
References: <20260717075715.25513-1-yangtiezhu@loongson.cn>
 <20260717075715.25513-3-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717075715.25513-3-yangtiezhu@loongson.cn>

Hi,

On Fri, Jul 17, 2026 at 03:57:15PM +0800, Tiezhu Yang wrote:
> Frequent "execmem: unable to allocate memory" warnings are observed
> during kernel module loading when updating the latest kernel.
> 
> This is because the modules virtual address region on LoongArch is
> tightly constrained to 256MB, while ARM64 and RISC-V are natively
> configured with a spacious 2GB region.

The constraint follows architecture ability to address kernel instructions
and data from modules code.

I don't know what are loongarch requirements, but I remember that arm64
added a layer of relocation support to allow 2G module address space.

> Expand the modules virtual address space to 2GB for LoongArch to
> eliminate these allocation bottlenecks.
> 
> This change only applies to 64-bit kernels (CONFIG_64BIT), 32-bit
> kernels (CONFIG_32BIT) are entirely unaffected since they do not
> define separate module address regions.
> 
> With this patch, there are no "execmem: unable to allocate memory"
> warnings anymore for 64-bit kernels.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> index 223528c04d73..e5952ecd6a73 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -96,7 +96,7 @@ struct vm_area_struct;
>  #ifdef CONFIG_64BIT
>  
>  #define MODULES_VADDR	(vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
> -#define MODULES_END	(MODULES_VADDR + SZ_256M)
> +#define MODULES_END	(MODULES_VADDR + SZ_2G)
>  
>  #ifdef CONFIG_KFENCE
>  #define KFENCE_AREA_SIZE	(((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2) * PAGE_SIZE)
> -- 
> 2.42.0
> 

-- 
Sincerely yours,
Mike.
