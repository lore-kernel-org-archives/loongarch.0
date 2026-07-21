Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4633403E9B;
	Tue, 21 Jul 2026 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658551; cv=none; b=c6S9+OOcoVyo0JaimS6u6BrC/Ru6I5JW5buvvAwteLPuUOvLQNhE+yuLGYegBceL8tEn+s3IPoE4a1ftLeSkgJS3EfOdH/pfBYWht0tmdpYVe+XID92K071091kw3V2ROIWuZdYvmXFHBqTKM3ZdY3wYWQ3HDxDfMVQkgurP4sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658551; c=relaxed/simple;
	bh=aVhsCYQslSDYSKLuL4ZgOvG4PCrl5GLhg1ti9BLhlrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9XbH4QLoxxdsgcHHt0UfaIDMtoMAve77p2+43/9x/G2F/qo7dYR1DUaBO2F+Gsl+6+8JaqRDb1dLpcE+dJbKTfzBFsTNXiK5TTYOaLgKisK9VRmJ4NcdzshE7wxHJXCVYdqNsEJ7lpVoxnV8pnC1mWy805PBe7UvNax0EnoVc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gp6XbFXo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp6XbFXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF4B1F00A3A;
	Tue, 21 Jul 2026 18:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658550;
	bh=UBrZiyJnberI9b7VUjJupq60gfZ6LzSJ4B4JH6KDxtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gp6XbFXomuiNUL8/5g0E38L1hLDlFPRFvPMTTyCgWQBNTqqQLQuUB+s6pzz7agr14
	 N9pISFj7Aqysz4dxYykxm6/PcBMqwymPVydn8l5doP7dGw63rtDgY3J3w7+iCd2dwn
	 raQb1OGdk1t5E2yX8S2g00aPuPp2+6dZqqd0g44YDiwH+wxLAthEItWNbjsFl8dBHx
	 8BI1icWsPCV3f/3kezXi7WgT58OOGLnXYtGTnzmvJRW4iXX8nBTXgUYu30RCoNS6wF
	 fH2kWBuFqMBANpbmNVc+7cLE+ZwcY66ZqhCCT8XuyFNX3ZeC96jda4LJGcOYbRliLw
	 lxENtlBS6t0dQ==
Date: Tue, 21 Jul 2026 21:28:56 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <al-6aLMJONOMfW2v@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>

On Tue, Jul 21, 2026 at 10:19:43AM -0700, Borislav Petkov wrote:
> On Tue, Jul 21, 2026 at 07:23:23PM +0300, Mike Rapoport (Microsoft) wrote:
> > Currently there are 6 independent implementations for set_memory and
> > set_direct_map APIs.
> 
> So with all mm/x86/CPA patches flying around, can we first agree on which tree
> is going to collect everything?

I hope all the fixes flying around will be merged before I even get to v1 :)

In any case, I'm going to wait for the fixes to settle before posting this
not as RFC. Obviously, the code movement will include all the merged fixes
then.
 
> And if I want to review patches in that area, what am I applying it ontop?
> linux-next perhaps...

This set is on top of v7.2-rc1. It includes a patch Dave took to tip and one
fix from those flying around.
 
> Let's sort out the workflow first so that we don't get lost on fruitless bug
> chases and fingerpointing.

I'll take it via the memblock tree? ;-)

> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

-- 
Sincerely yours,
Mike.
