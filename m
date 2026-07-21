Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B13EE1DB;
	Tue, 21 Jul 2026 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654216; cv=none; b=NWrAdSp14LqLQkvK7hkevETpsa3Qu3frq8tAH0a4X5k4CnuPpjxZ4ncv8CB0b4Z3TkIqGDGghYhy6ALcO+qOhyuHk+4Y+PbI/u9vR/2Nem1wIfZz+jBxv5nIuUAM/ZH8ci6Sc8t0igF6Lr/k1HTMljC9fuPLY5rPcW3wq30iQ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654216; c=relaxed/simple;
	bh=n+OMmtbCKjz5fhZh0UqVSH4vbMvj0X4ksP+Ty65kNuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLQ/fmGY+MlKcBaOEtNYKaPFkLFMfU9LTKk7bSnBYqWn1v1fIyzqI1SWL+LorMcZYDQVrMldeK4TOnbhErT/7BF6xHSQX2fpC/AKdkxZykaL+ppX0FtUVyLjCXdVcyREh4OEP85S5AXaiZ2LerXCxe+RUmQwFwyqVmNvDwimX5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INSdq0Jh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INSdq0Jh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275181F000E9;
	Tue, 21 Jul 2026 17:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784654214;
	bh=4p0jLk0hWrusAXNcO2QsKnQrXyxqVvMPo+V5GGUXDvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=INSdq0JhbWOwLqdV8BEGL9GB/JoFkWjXSauwNsyuu0/ZvV0n69zWiQHOVcKvEIq3t
	 7o3StUAGsExB9s1uDIwsX+4k5bLRf/3+XpuEzsbAn2h63XzAx3JvRQO9cRNFLxpKut
	 AlvHpfivgYBnJBB60Vf6Pi3CYj6puhivnrOTdrOFLaOA8uuVuHBu4rN+sl3nkkrUaN
	 LixGSj8SYkp9pgjvM6bB8H+VuM0YEVaY9qzvl9O5TORwUUTuAFFYqQbbnz/pAs9A51
	 cyTYtfpI8afsVrs8guyGUInKpw5Hy2EohG3rmFbIebgmkXzLKH20xBRH7X/ZnW/tj+
	 foio8xWfb5fig==
Date: Tue, 21 Jul 2026 18:16:33 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Brendan Jackman <jackmanb@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Michal Hocko <mhocko@suse.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH RFC 01/18] x86/mm/pat: Don't gate cpa_lock on
 debug_pagealloc_enabled()
Message-ID: <al-oTOKY7vkdPHr5@lucifer>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721-generic-set-memory-v0-1-v1-1-2c1fc62306b3@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-1-2c1fc62306b3@kernel.org>

On Tue, Jul 21, 2026 at 07:23:24PM +0300, Mike Rapoport (Microsoft) wrote:
> The splitting and merging of kernel page table mappings between small and
> large is protected by cpa_lock. The merging is relatively new but the
> splitting is ancient.
>
> The splitting has a locking optimization: since DEBUG_PAGEALLOC forces all
> mappings to 4k, there are no large pages to split. So the code that *might*
> cause a split can just skip the locking (and a few other things).
>
> This is entertaining, but it adds complexity and makes for weird locking
> rules. Plus it's all for a debugging feature which makes the kernel super
> slow in the first place. Optimizing something which is already super slow
> and not used in production is not the best way to spend our complexity
> budget.
>
> Stop gating cpa_lock on debug_pagealloc_enabled() to simplify the code
> and the locking rules.
>
> [ dhansen: flesh out changelog ]
>
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Link: https://patch.msgid.link/20260715144519.934289-1-rppt@kernel.org
> Link: https://lore.kernel.org/all/aab44f08-89f8-47fe-bee4-0ab6b25968c6@intel.com/

Hmm this patch is already taken separately though? ([0]) (obv. commented there
already with review feedback).

Intended to be with this series as some kind of background or? Probably better
to separate out given it's a live patch

Thanks, Lorenzo

[0]:https://lore.kernel.org/all/20260715144519.934289-1-rppt@kernel.org/


> ---
>  arch/x86/mm/pat/set_memory.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index d023a40a1e03..e8316f5ffa8a 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -62,10 +62,9 @@ enum cpa_warn {
>  static const int cpa_warn_level = CPA_PROTECT;
>
>  /*
> - * Serialize cpa() (for !DEBUG_PAGEALLOC which uses large identity mappings)
> - * using cpa_lock. So that we don't allow any other cpu, with stale large tlb
> - * entries change the page attribute in parallel to some other cpu
> - * splitting a large page entry along with changing the attribute.
> + * Serialize cpa() using cpa_lock so that we don't allow any other cpu, with
> + * stale large tlb entries, to change the page attribute in parallel to some
> + * other cpu splitting a large page entry along with changing the attribute.
>   */
>  static DEFINE_SPINLOCK(cpa_lock);
>
> @@ -1235,11 +1234,9 @@ static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
>  {
>  	struct ptdesc *ptdesc;
>
> -	if (!debug_pagealloc_enabled())
> -		spin_unlock(&cpa_lock);
> +	spin_unlock(&cpa_lock);
>  	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
> -	if (!debug_pagealloc_enabled())
> -		spin_lock(&cpa_lock);
> +	spin_lock(&cpa_lock);
>  	if (!ptdesc)
>  		return -ENOMEM;
>
> @@ -2023,11 +2020,9 @@ static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary)
>  		if (cpa->flags & (CPA_ARRAY | CPA_PAGES_ARRAY))
>  			cpa->numpages = 1;
>
> -		if (!debug_pagealloc_enabled())
> -			spin_lock(&cpa_lock);
> +		spin_lock(&cpa_lock);
>  		ret = __change_page_attr(cpa, primary);
> -		if (!debug_pagealloc_enabled())
> -			spin_unlock(&cpa_lock);
> +		spin_unlock(&cpa_lock);
>  		if (ret)
>  			goto out;
>
>
> --
> 2.53.0
>
