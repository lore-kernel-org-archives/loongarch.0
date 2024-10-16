Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0777187350
	for <loongarch@lists.linux.dev>; Wed, 16 Oct 2024 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729099273; cv=none; b=q6cCnCsHyKtXJ41YytBmKCtoax+MOddKRX9FWnlJtpKYuuqNOk3r/2FoXpDDq1wHe+55YGRfp79RFr9ivg4YocxZkZBRYL351dgz8/vNdALZ2OFuCiKob6qBl6sfcj9pGwORsAUFlxXfS2hKXYRbqMGf2Qb08rdl3oAm6AZDsRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729099273; c=relaxed/simple;
	bh=pE67RiyjvIOKtyfw/S0Zs4qanipSNG01XM8veQFduUg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDjDrdIx8Bks8MpUtOrfAMBooQob8TwyxV3zJ6IHZbc+u/zOoE3E7iMActdQJ2FgpSbJ3/n3LkZoLmk9cUg06scjSZXZThh8j5OcZH19Rqj7uKMftNndlN0gQJxQMbGq6TDOjxnMcEf+DqDK8VAZXaNid82AARJ16Eb7DGkowMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDk+Cdu3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDk+Cdu3"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e6c754bdso49140e87.2
        for <loongarch@lists.linux.dev>; Wed, 16 Oct 2024 10:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729099269; x=1729704069; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1GP0B75uZXvlMdPMs8sxWFWqOcAn6bbZYSntM7zvNeg=;
        b=HDk+Cdu3UE6F/YdhuHnKecBUQ+U2aX1Mpm7yShAZv31OBkhzqxl94E7kuVnvn+fam+
         4obYDKSCQ+jys6+p8dQNzDMHzn+xDedyXBkG6988a/Pt7/DcEyfnzX08eR39Cf85K0BF
         Gq9mwSFh1ocZM0wdl8yhfPoEQv+x/nOesaZ4cL9ukLaehgMN+NIPwByeAAMWIO7qbUBe
         2Itd/4vfooD75QJlLjeUwAz+ZMoD55Gif+f2Exzsl7NO3oMyWI6V9M3joo70kdIqgokb
         8WkwY7EA802JaVYLcJEgcFH3d7zI/al8LEc8+Se0orejSwwI36O0mbeJCXBFVwjnBkCh
         7IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729099269; x=1729704069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GP0B75uZXvlMdPMs8sxWFWqOcAn6bbZYSntM7zvNeg=;
        b=WoZO4cH4LqjKQnyua6wJtTJZq66nQHuyebHlYlzaga0z5/ZBy+xxXxwwMltsPKWlJ9
         XSbsZ+oPl2YEsa+Kz8kkB0B6ZppKRkxWQD9PFP/xhkn4HtatqyIi8nhOz1/sufmHUHgO
         xGDaLpdUFRgpUdS2bD+0iQTbzTWolCJcMsPtRdTZXwHo5cjMCINo5IZ8PK/fKSCDkut9
         CRTH5UiHbx6bPb+6Z3GQo3GpZu2OwFh8XZduS7fDCGiFg71XP2RKFnhKtEHAKfz8nTc4
         Lse6ZI2vdUu/qxfdG+9T4vZZ4EpExGiZMMtCj/Ib2uuGw2xdRlFl2Z9lNjLv+VrWcSys
         CgqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq/iwz1nrrWkLCZBXxmQguDq6+INXqJKiIYLLjJpTVmG0Be9gUH2gGpVi6wctFwF1i1byllyvXNUs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj/RSWTOP+H6TRtGx33dZEW/b67yLl32mniW7NQTsjOR1QQcRD
	wlRDsTVOWzf0jFA0eMDvsd0SWU30T1MDgu/YI+tDlUXvTe0+Y22w
X-Google-Smtp-Source: AGHT+IE3BOIzolDg/ircoXlrXALD+U8X6mjirKNd/VoSdJ8ZQKv3Aj0k5T5yFcByNzOByKxATFiOdw==
X-Received: by 2002:a05:6512:402a:b0:539:f619:b458 with SMTP id 2adb3069b0e04-539f619b4cbmr6540423e87.22.1729099268652;
        Wed, 16 Oct 2024 10:21:08 -0700 (PDT)
Received: from pc636 (host-95-203-1-67.mobileonline.telia.com. [95.203.1.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8a5fsm512819e87.26.2024.10.16.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 10:21:08 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 16 Oct 2024 19:21:02 +0200
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 2/8] mm: vmalloc: don't account for number of nodes
 for HUGE_VMAP allocations
Message-ID: <Zw_1_ln440eHTjGt@pc636>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-3-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016122424.1655560-3-rppt@kernel.org>

On Wed, Oct 16, 2024 at 03:24:18PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> vmalloc allocations with VM_ALLOW_HUGE_VMAP that do not explicitly
> specify node ID will use huge pages only if size_per_node is larger than
> a huge page.
> Still the actual allocated memory is not distributed between nodes and
> there is no advantage in such approach.
> On the contrary, BPF allocates SZ_2M * num_possible_nodes() for each
> new bpf_prog_pack, while it could do with a single huge page per pack.
> 
> Don't account for number of nodes for VM_ALLOW_HUGE_VMAP with
> NUMA_NO_NODE and use huge pages whenever the requested allocation size
> is larger than a huge page.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/vmalloc.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 634162271c00..86b2344d7461 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3763,8 +3763,6 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  	}
>  
>  	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
> -		unsigned long size_per_node;
> -
>  		/*
>  		 * Try huge pages. Only try for PAGE_KERNEL allocations,
>  		 * others like modules don't yet expect huge pages in
> @@ -3772,13 +3770,10 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  		 * supporting them.
>  		 */
>  
> -		size_per_node = size;
> -		if (node == NUMA_NO_NODE)
> -			size_per_node /= num_online_nodes();
> -		if (arch_vmap_pmd_supported(prot) && size_per_node >= PMD_SIZE)
> +		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
>  			shift = PMD_SHIFT;
>  		else
> -			shift = arch_vmap_pte_supported_shift(size_per_node);
> +			shift = arch_vmap_pte_supported_shift(size);
>  
>  		align = max(real_align, 1UL << shift);
>  		size = ALIGN(real_size, 1UL << shift);
>
Looking at this place, i see that an overwriting a "size" approach seems as
something that is a bit hard to follow. Below we have following code:

<snip>
...
again:
	area = __get_vm_area_node(real_size, align, shift, VM_ALLOC |
	  VM_UNINITIALIZED | vm_flags, start, end, node,
	  gfp_mask, caller);
...
<snip>

where we pass a "real_size", whereas there is only one place in the
__vmalloc_node_range_noprof() function where a "size" is used. It is
in the end of function:

<snip>
...
	size = PAGE_ALIGN(size);
	if (!(vm_flags & VM_DEFER_KMEMLEAK))
		kmemleak_vmalloc(area, size, gfp_mask);

	return area->addr;
<snip>

As fro this patch:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
