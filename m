Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56423F822B;
	Mon, 27 Jul 2026 10:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147744; cv=none; b=e9sRrJ8YrLLrc+0poIfdUEzN1tW4sDQ7giyE4LcW7d+nsccOGeyDa3H+WGcpa2HRl4msPHgEcczNRxC0eLwl7xnA+vO1hIIIWWU4dBUZ4n65J2nlmE5zwUeZpscuN5u3QytK77i1Cn3R47sdSFpx/osAe373n5H/infRsTD1jK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147744; c=relaxed/simple;
	bh=iiLJNHU6xEHzqqi/KV52NPqARYyozF5uapPv9GfdchM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOtykk259eHmRbST2/ka8cRfqA83OKne3PB8tEZsDeBS8LGSEreaho+z0uqUVRp1A9KhUAtfPRRSJMs0U36zM5zFjgLb99VqNa7wgf9mu1M0yY4MugO9lZDOZvqji+sAdG3OxSlzzOmX/0HMZ1RARbMoDa6xkINhLJqoLWmeFms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsYY3yMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsYY3yMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E151F000E9;
	Mon, 27 Jul 2026 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147743;
	bh=/JnmBgXxFDtCMN2wDB2IoufqkaTKn0f8mfPW/klL5BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gsYY3yMsnWmKGvnXvXG4cAJ9uYD/g70GCEZQyJYYALUaBP30DL0mK8UiL1pB/EbhK
	 nc+d8D//BvpV+fsOKUHm9FDZGks+LTCZNNnpygfauGfGDeviZ7a4Gqo4kdtWxeck/h
	 N5qCMmAK1Dz1wbvXTixVEc38OGcBuCgNrMt0sN0dX9WpHNIOzTARNfgEcid/hOxfeT
	 3z4xkHMzT2u5IB1Guj2HJz8xjNhJ7A/m+YluYaX2fPMRcTaMbRpym80eUIvDHQmf4G
	 ID4MUbBHhJPHP/6PWnOj7KYtY4zzJo2RU/OQ8P+F7MVjo8Q1DldhHmb47Hgfz1kxZd
	 WoAIbmR4uVBoA==
Date: Mon, 27 Jul 2026 13:22:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-mm@kvack.org,
	Albert Ou <aou@eecs.berkeley.edu>,
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
	x86@kernel.org, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <amcxUS95HBsQhvWn@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>
 <fa75382e-878a-4064-a9b1-43bd2c9dedce@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa75382e-878a-4064-a9b1-43bd2c9dedce@intel.com>

On Wed, Jul 22, 2026 at 10:03:03AM -0700, Dave Hansen wrote:
> On 7/21/26 10:19, Borislav Petkov wrote:
> > On Tue, Jul 21, 2026 at 07:23:23PM +0300, Mike Rapoport (Microsoft) wrote:
> >> Currently there are 6 independent implementations for set_memory and
> >> set_direct_map APIs.
> > So with all mm/x86/CPA patches flying around, can we first agree on which tree
> > is going to collect everything?
> > 
> > And if I want to review patches in that area, what am I applying it ontop?
> > linux-next perhaps...
> > 
> > Let's sort out the workflow first so that we don't get lost on fruitless bug
> > chases and fingerpointing.
> 
> Just practically, I think this series needs to be ignored for a bit. Bug
> fixes first, features and cleanups second.

Ignored is a bit strong, I'd still love to get feedback on the concept.
 
> When the time is right, it probably needs to get get acks from all the
> affected architectures and go through mm. Folks can ack it now, but I
> don't think anyone should even consider merging it until ~7.3-rc1.

FWIF, I didn't plan to send non-RFC version before 7.3-rc1.

-- 
Sincerely yours,
Mike.
