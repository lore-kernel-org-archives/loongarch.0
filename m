Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763F6397E64;
	Wed, 22 Jul 2026 06:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703028; cv=none; b=ZdPd4hyLERSU0M3W+hvNlOmaKCbwlEuBu+NVpc2LPSYbiqDxvpljbq+4g9CfxAq/svemRhqFHWOwjFiPQsvXPdPcABDFJnmqJlPyzwCmWoDe3o9l5Bf13L9CIoSrshfEZ/e2RLT1D8Q1pvD/pxbpjVtpV6eXt40V5ypOR6cxeI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703028; c=relaxed/simple;
	bh=zkldXLot4m+g6xXi5WFT1RBtnkQbjUe1/NusMXGAX1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAQh0x40t8MTqabgaJiUwLXTJK6BiyeIGxpGOZeM3kPAQzrNL5/4PkSfnbKF0zRtBy49QdWXKNZM25IrRYdsvRzFXp8Fp/iaYMJGWPNwHkfiAVw5XqqNCFczxpCmSPN7e83dGTdf9zo2DWwKNEZLkyZ6abLby19/n2bchqCc20k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6R84Ps3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6R84Ps3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69921F00A3F;
	Wed, 22 Jul 2026 06:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703026;
	bh=XnxogIQS7eoD999V7HLL1Y7l5CDp4hmKICTpMm/zYng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U6R84Ps3/o94s4otuUkA+xNRsB5SBqBibOFkn3ZUnHYqT68BNhN4Q6nc4CuniP19I
	 zYEnJ1fmed/32oOwBB71rH0FjI5bExSFo+zlkkxYGw3sCWwij82ZJ8uclZpZQlVyo8
	 ebrxOKEISusfcf7TJmWKFvFZOfZqSmurjyLJks8m+sX/YHFgL7k4zBlJwb1k5wn24E
	 1fk9q3Vcd4xS/QdQVthkdevDIv5Suvv0pRY9ose9471KFU3cykS+x/qOOCj5ZB0GIO
	 /+an0VbZVI55lPLsc1ki6evJDFzMwpChtRqQkvtAM7j5el32I4dCakfifpWOZP5Wpi
	 LVRtdVoJ6XJEA==
Date: Wed, 22 Jul 2026 09:50:09 +0300
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
Message-ID: <amBoIXBYKAhToIgy@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>
 <al-6aLMJONOMfW2v@kernel.org>
 <20260721195446.GHal_OhkuBCWQjmLQW@fat_crate.local>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721195446.GHal_OhkuBCWQjmLQW@fat_crate.local>

On Tue, Jul 21, 2026 at 12:54:46PM -0700, Borislav Petkov wrote:
> On Tue, Jul 21, 2026 at 09:28:56PM +0300, Mike Rapoport wrote:
> > I'll take it via the memblock tree? ;-)
> 
> Definitely not.
> 
> Unless you folks want to carve out the bits of set_memory.c which interact
> with core mm and mark it as maintained by someone else. I personally don't
> mind too much.

Well, in essence that's what this set is doing:

 arch/x86/mm/pat/set_memory.c            | 611 ++++----------------------------
 {arch/x86/mm/pat => mm}/cpa-test.c      |  66 ++--
 mm/set_memory.c                         | 396 +++++++++++++++++++++

I just decided to postpone MAINTAINERS update that would add
mm/set_memory.c mm/cpa-test.c to MM CORE section until non-rfc version.
 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

-- 
Sincerely yours,
Mike.
