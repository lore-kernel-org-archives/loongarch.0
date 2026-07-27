Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6F03C1412;
	Mon, 27 Jul 2026 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147376; cv=none; b=M1pLUty4kWcjpXbT7rEtuT2rboDTlPEXcqV6LmPVLBDkohaPEg2nfFXn78U6WsA9kIFxCNU5Ne0ywPEWj+FRb2QPuDYuFsSQwrNCeOIzIyQVkZpjzGEMi4wO8fJukoyEpri/k3PAC45Y+hAONZ+JmrgyPAQ1OygH8BvsoD4o+lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147376; c=relaxed/simple;
	bh=XDd9sD3kB3qr/D6VjaQq8a2zEi+DCyljxrHDR/C5+xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haQh6U6KpBo6JhMBfi/jM0RcL27WPr9Uy7LdlCj7oo1ww/ruDSTC9tCUoFJfHmQpOagjxMKg3zIT6G8hR/do96AbGwBzQra/C5bH0QOTH2JvRYtlsS+48/h7qyRnXiPf6bEFNqYf8yFkq+Vno6pRUihIAsMXphJZi5T5LP+jvPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeXLGKxn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeXLGKxn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0021F000E9;
	Mon, 27 Jul 2026 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147375;
	bh=aPvuz+aL88c21S8YC4GLGVYZg37SgTBgz+cPgSwl5YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aeXLGKxn+RhuEpjDFbt/ECV2BxYK5diVi7xVn6tULU7vDF7IK7Nil1nVqd/uTLs0a
	 j54JY+fifjoQHmXB9CR+jCM4rvP6pUcAJpAIgW91yTz1VWA8cFXD1DZoURmpEUqlBo
	 Tq8KvwKyQ4fOEXf51Jdb/5lt35sWrjNBv7X3ON5nEjg++ndjFL8fdwh7RQt7DAiufK
	 NEu++wGQ+modaUWU4wmPBGb6eEqXBiiWFcOGq4t079CkA4z0301GVt3RVtw+hHhHy4
	 jlT37q6tmmybvVR0a4m6cIFpSFH0potJvfTJYgzoIW0uyrUmfcVfT1diLwjHu9fMt5
	 gbvr2kjjgFHYQ==
Date: Mon, 27 Jul 2026 13:16:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
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
Message-ID: <amcv4Q_jxriraFzU@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <amDe_3KFBc9CcIbo@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amDe_3KFBc9CcIbo@google.com>

Hi Adrian,

On Wed, Jul 22, 2026 at 03:17:19PM +0000, Adrian Barnaś wrote:
> On Tue, Jul 21, 2026 at 07:23:23PM +0300, Mike Rapoport (Microsoft) wrote:
> 
> Hi Mike,
> 
> > Once this settles, the next step I'm planning is to convert arm64. This
> > would be much more involved than loongarch and riscv together, so I
> > didn't even aspire to include arm64 in the first RFC. That said, I have
> > a very ugly arm64 prototype that rewrites arch/arm64/pageattr.c to use
> > the generic CPA infrastructure and replaces the existing implementation
> > of page table splits for systems that support bbml2. But there's a lot
> > of yak shaving there to get from a PoC to actual patches.
> 
> Could you share your PoC for ARM64. I can help you with that and align my
> execmem rox cache for ARM64  changes to the desired shape of this API.

It's too ugly and more importantly it cuts too many edges. 
I'll try to bring it into a better shape and will share then Really Soon :)
 
> Best regards,
> Adrian

-- 
Sincerely yours,
Mike.
