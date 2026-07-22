Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7304BC032;
	Wed, 22 Jul 2026 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710568; cv=none; b=MJH5DrrwUGL+034XASflehwDdredYLadYxZEwDEWTz3MXOQu8NyFPopAjJr5p1KsW824x6UEPSjNU08LBM/msRTxaC/KbZUlvsOQq4W+rXMePgBzumRktwueR0YHTLAgnJaK70lZy+lY+T5rQGAaxYMOBK1J0+Hq2RhzOrgikp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710568; c=relaxed/simple;
	bh=+w42vAOIG9qeeanUexnb5qrE06m0v5IDT9RJD/nDDqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmvgvrx+9Kaflt2fzIHVhoMjipze4lcpIk8D1KoI6u613gdbff/WnVWxyR7k5dCA7jqJKaxSdrFZgwQ4hbinsvPGlZYWmtp8xexGNY2bukM5KIXqzHXAnQATai0xeawtu20pI/UKmEY1jZQqg44zQ/7FIbmaZDnwer7dcxl8Uiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDc46chI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDc46chI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7D71F000E9;
	Wed, 22 Jul 2026 08:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784710566;
	bh=aee5s1edqbgsHAo4tjJhHBYFBXZbzIQhAfflgu0Qfl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LDc46chI52fVENs42kG9+KBWM0nMhxZUJWhF2TcA//k7EVRXGYtJIEDCNw2MhaQxf
	 rAF7wicCMnhKVgjkDR5Va+tqdiK93/9KRL0amUDK1fkF/CYvi+4b0yXY0txmWTHBzm
	 FN3BEIyh2bx7nj0aCMQm2RenxGNCsPp3x2xisyF711bY3BDHZJZ9cBgDQ/wkNXvhIf
	 qeOmqal8BqfD6umsvhZ23KsidOUZWvPxo4euKNMG6AxVL0LbwZcNyrf3FjZpQ5BNd/
	 UqsVNpLJjq1PTHsuaT0kzYYLLQVD1E7gJWUegOsyo5+fFSYuWRWanDXNRVLIlnutd/
	 QQ65f9GU69gTg==
Date: Wed, 22 Jul 2026 09:55:46 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <amCFgFTmP1Jy_uRG@lucifer>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721-generic-set-memory-v0-1-v1-1-2c1fc62306b3@kernel.org>
 <al-oTOKY7vkdPHr5@lucifer>
 <al-6woCPBH5d-lwP@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al-6woCPBH5d-lwP@kernel.org>

On Tue, Jul 21, 2026 at 09:30:26PM +0300, Mike Rapoport wrote:
> On Tue, Jul 21, 2026 at 06:16:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Jul 21, 2026 at 07:23:24PM +0300, Mike Rapoport (Microsoft) wrote:
> > > The splitting and merging of kernel page table mappings between small and
> > > large is protected by cpa_lock. The merging is relatively new but the
> > > splitting is ancient.
> > >
> > > The splitting has a locking optimization: since DEBUG_PAGEALLOC forces all
> > > mappings to 4k, there are no large pages to split. So the code that *might*
> > > cause a split can just skip the locking (and a few other things).
> > >
> > > This is entertaining, but it adds complexity and makes for weird locking
> > > rules. Plus it's all for a debugging feature which makes the kernel super
> > > slow in the first place. Optimizing something which is already super slow
> > > and not used in production is not the best way to spend our complexity
> > > budget.
> > >
> > > Stop gating cpa_lock on debug_pagealloc_enabled() to simplify the code
> > > and the locking rules.
> > >
> > > [ dhansen: flesh out changelog ]
> > >
> > > Suggested-by: Dave Hansen <dave.hansen@intel.com>
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> > > Link: https://patch.msgid.link/20260715144519.934289-1-rppt@kernel.org
> > > Link: https://lore.kernel.org/all/aab44f08-89f8-47fe-bee4-0ab6b25968c6@intel.com/
> >
> > Hmm this patch is already taken separately though? ([0]) (obv. commented there
> > already with review feedback).
> >
> > Intended to be with this series as some kind of background or? Probably better
> > to separate out given it's a live patch
>
> From the cover letter:
>
>   Patch 1 is already applied to the tip tree and I posted patch 2
>   separately [4], but I included them both here for the completeness.

Well that'll teach me for skipping the cover letter ;) Fair enough!

>
> > Thanks, Lorenzo
>
> --
> Sincerely yours,
> Mike.

Cheers, Lorenzo
