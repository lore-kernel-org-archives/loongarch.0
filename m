Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815946EC82;
	Tue, 21 Jul 2026 18:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658640; cv=none; b=tcIpGWOj/6HNQ0NtkUK+A+g7NTzwa2dRmFBOY+mVRH1Ul8E8/I1+DZxAZj03rUF7/dRA+bqgzx2EJuFfS7kNfvy+7EWHb7dffQiMDcaSafvfhG66yToRSS3n44L6oe5yfBidaP/BPn/bxnCQfd1i24jVrrW+12UOXyAu9x7327w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658640; c=relaxed/simple;
	bh=/aFc89nixD+QIjmNHoz3F8OmF6BNsVwmqXuVp7Jw548=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhuS1h6yn52Y2pH3n5Ecfq7mDLbedDu+iQNbV04NjmPWJXIeZHwf85/XvRGbZGdaxTB+glFHXg+DnZ24ro7SwnpFdYKYHwaDhTwRHSmHf79YOhDSCiLAc6c2EPWfVX+HkgJtgYucr3+my1En1itXPE/xxdfpRr4CUKJl5+IcKF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByYK4o3C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByYK4o3C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0DE1F00A3A;
	Tue, 21 Jul 2026 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658638;
	bh=9zO9yiMTAazx5bwGvEvIyBcvPS46sW+B44wcbxVnE5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ByYK4o3Cka+hTsFRrAZAJRNYhFGvW7e38UptX/Hs7lUB1boZoKI/JB79A96h/sJlt
	 YKqi6ru/0HEtyn5K1g1fKFvrrOvAs55HrxyU1PfQKIYMBQpvNRutYSbErst/xzLFT2
	 5geUT2eCxPXWhMAI7fAevDyJeTIGeFMK22SP/rV56hOgG5rIOPcfSZnBK8/yramW/9
	 5j646seiC6BJN7K+hbtAwOp0ZDuR1NSGUi+9LNhopPTljgCIcz8FIMem/5jmuNKlHz
	 M1MQRG8RBAEZdihKmF6FW6rAvGtDzXs9xOhBrO2BggxJWR7HuxG3+1Sm2YW2C5sGbx
	 a0g4ar95F9w/A==
Date: Tue, 21 Jul 2026 21:30:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH RFC 01/18] x86/mm/pat: Don't gate cpa_lock on
 debug_pagealloc_enabled()
Message-ID: <al-6woCPBH5d-lwP@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721-generic-set-memory-v0-1-v1-1-2c1fc62306b3@kernel.org>
 <al-oTOKY7vkdPHr5@lucifer>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al-oTOKY7vkdPHr5@lucifer>

On Tue, Jul 21, 2026 at 06:16:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Jul 21, 2026 at 07:23:24PM +0300, Mike Rapoport (Microsoft) wrote:
> > The splitting and merging of kernel page table mappings between small and
> > large is protected by cpa_lock. The merging is relatively new but the
> > splitting is ancient.
> >
> > The splitting has a locking optimization: since DEBUG_PAGEALLOC forces all
> > mappings to 4k, there are no large pages to split. So the code that *might*
> > cause a split can just skip the locking (and a few other things).
> >
> > This is entertaining, but it adds complexity and makes for weird locking
> > rules. Plus it's all for a debugging feature which makes the kernel super
> > slow in the first place. Optimizing something which is already super slow
> > and not used in production is not the best way to spend our complexity
> > budget.
> >
> > Stop gating cpa_lock on debug_pagealloc_enabled() to simplify the code
> > and the locking rules.
> >
> > [ dhansen: flesh out changelog ]
> >
> > Suggested-by: Dave Hansen <dave.hansen@intel.com>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> > Link: https://patch.msgid.link/20260715144519.934289-1-rppt@kernel.org
> > Link: https://lore.kernel.org/all/aab44f08-89f8-47fe-bee4-0ab6b25968c6@intel.com/
> 
> Hmm this patch is already taken separately though? ([0]) (obv. commented there
> already with review feedback).
> 
> Intended to be with this series as some kind of background or? Probably better
> to separate out given it's a live patch

From the cover letter:

  Patch 1 is already applied to the tip tree and I posted patch 2
  separately [4], but I included them both here for the completeness.
 
> Thanks, Lorenzo

-- 
Sincerely yours,
Mike.
