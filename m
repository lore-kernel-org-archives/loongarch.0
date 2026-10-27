Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104280;
	b=y9aqmODau/t+gA7i8fQKrcgaFQ/bREvepWdMC0MUgKx4dz0S1ZnJSJ77hBZi+7mHU6bg
	 UyfvePa8uR5T+MH1nluCdbLf3waoQmNJh9mlF7XarzosWJbAkaeBM2luZDpDhYRcB2MZ8
	 4gqc8/cdlKdsEPn1gjoas0IsAgmKmMgBFdBa9lqBTNuuqCDFvaSViVBjTWAuOywc+LsPb
	 B9i+HlUw+C5McpbJwoCSC+VT3Q5TPQFk2ujFmJR+kr/v4ICKrCl4fLCpBFRcflXu4qzdz
	 ns3TK+AduhvsbyGjXM8yfOuQPo6seVKsDEdhziCiu42lKiHo+lgSXLDiTupHtxHyr0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104280;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JA8h9KUew4bMbADI2oUInBzixioja4qGJWsGZbSCJpI=;
	b=mGcxGbD9CmkFImehSvZMvVseUaLOSfjgR+41KU4t188I6T6N8yGTThO/9W6G0f2NVzR0
	 0EKL+bkiw/ynNED/afyeIeonay1wwLevsiqpZ3FcDpNgpENo+6nrDmwVAiFiYZc6msD+9
	 ya/5kixC6uzW54ql3yRpI3ES661wTsu6W9eNiDGx/Ho1+/LP+usxqbQfFWEETK5ORJNO+
	 OHYH9jP/Fsa9+xCxcFx2yTritaYJw6HWfoPmg21VuhxCk0EK1fEYC9GTg4sPs81Hh3YZ+
	 uVLA2Xdt/68cDc3P09hQaQaAiebIkibUivI8so2grIkVoTZ2ZNK5L2cRKW4/AIr+lUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+e0Bvce;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D308606AA2E;
	Tue, 27 Oct 2026 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+e0Bvce
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C791F031E8;
	Tue, 27 Oct 2026 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793104280;
	bh=JA8h9KUew4bMbADI2oUInBzixioja4qGJWsGZbSCJpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X+e0BvcexZwh/4AUnHQPe+d1YBwAqRcptdi8/Y360+KTdQMvrRBMo8bCd3Rg7pkjr
	 jfR9skKJCbBQUMZqJGiBNCLBi5gH6BVcLZ0GgQ3+2X/G3t9EryZbMxC+LsCqAiP1qw
	 DfEfACQz/D/ZpUqjz9dgH0VUCxkYU771b7/ph67qzFsU4AEno08ZvoXbxxTgWcmYvl
	 6zo7JiiNXHjlpfjJMU7RfZombHjSCq75bqaQ7fC8OhmztiCuY+9yfCmCk61JR6zHhB
	 OUKFXOmOR9BBW7Mp3w0zw9jNgjYqIEIRzdi5aBqJboCWtprx9MDOF1UIK0XZDyB36R
	 YX+eBtDE94n1g==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id C4148198003A;
	Tue, 27 Oct 2026 08:31:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 27 Oct 2026 08:31:16 -0400
X-ME-Sender: <xms:j5ngal-y604h5FHG0gXKO0JmoDwIL5zzPGd4jO3XJuWRuM9_zDhsEQ>
    <xme:j5ngaqLEQk3URLOEPxRY4eI0AJ_6xo_CoZNe0tDshbQ3sAFKU8ZeVq4MgnN_XMqiK
    _ua5k2oo1SM3kSqZI-xgTWMdqdbn9L6Er4vnooBn6Kz-JqBLvYqvaY>
X-ME-Received: <xmr:j5ngakfb0U-6wSKAMAAuXWa1RyM2CZOiZ_Wxt5QsSHbi7YIDHA2V047hFnU>
X-ME-Proxy-Cause: dmFkZTFr3RumHCfbQTlQHvPlXFybAsM2kuRamaLK+DcsHGJnUk2aCjGXXyr6NKWi0kroSr
    Oe85i3AcnkoxYUwKMUsCnYv3ol8I9M8cSn01GHV9AOTm5NfBjd+kCIjHiud1PAPzD5uXXl
    fN+b6rTVdtgXXvR1Z8eNRwhKI9yHxfQGGUEg7jRZegVt2fzj4kjjkHnB7T87ApQJ/YAHeu
    jWBHnlmzJHluxF9tAeEQxnoK263SXj0iYueuHFhGeOpOuCn6b2DvTIZwBEgN/+EwunXjB8
    CwEWM/ocJ/P7R/h2BXkq5SQ2kHartw+7bNjA0Gxa9vs0WmUsZFcGkZnIAoPCICn1WzThUZ
    qOz0AVGhp67x0YgaM1Ydxlnbw0N39OED89qvX5lcwiSM/HqWSxoVFWvTjUWcewSd7SviP7
    dQ04WcBrJE49hc8irsEuh6Xa8qmKhTv5+27sFoWEYs8ENR5FLW6D7hiRnsGUpkMI5MQceB
    UY8D9iJZ2kbY+0kfGnpFDbFzlSAgxEsNQH68IGiYsMcu566/hZL7hfXo0u3QYxpuXTE7Lf
    O/lVEviaducfFiifqy28iVecFxFVMJPrtttgxyJ2XsNCKh4pSCNIqqAiDWXSVimljJQasr
    nahIdUaatb5eDNRDlsczlK7MH5d2+R1Yg4ux3pWMJw8eTuDTZQQKwN8030Jg
X-ME-Proxy: <xmx:j5ngapdOe2vVgT2grTZ7td90xi5lIyt5aieIkbjFwmg3Etw7YEqT1g>
    <xmx:j5ngapmM3_rgC-TQdk-_fUW-n1fySSsx-acomwLSyc5CSAwThQykbQ>
    <xmx:j5ngaj-OF73Yr5lXoFTaJVTKBEidGV6F9smn42IfhmEA7VgztmdNDQ>
    <xmx:j5ngako9ZmvbpYbK1nNMAg6ZB9VOY2L_aR-L52n-Vgzbty7vHU_EIg>
    <xmx:j5ngapKn1Nv8aWmgJR2WTfb1wwuHd2q0Y6X_2YiP6_nGWPlBzweQOT1p>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Oct 2026 08:31:10 -0400 (EDT)
Date: Tue, 27 Oct 2026 12:31:09 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
Message-ID: <auCZFckDfBMrlfxV@thinkstation>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
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
In-Reply-To: <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>

On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) wrote:
> > Writing this, I just realized that we have another option -- map the
> > shared tail page writable. A failing LOCK CMPXCHG writes back the value
> > it read, and the get never changes a zero refcount, so the race becomes
> > harmless. The cost is the protection: the page is shared by every
> > hugetlb folio of that order in the zone, so a stray write to any tail
> > silently corrupts all of them instead of oopsing.
> 
> Right. Without HVO we would just corrupt pages in the single folio (which is
> also not nice).
> 
> I'm also questioning whether we need this RO protection all the time active.

What do you have in mind? RO only under a debug option, or switching the
tail page to RO some time after the remap?

If it is the delay, a grace period alone does not close the race. We
would need rcu_read_lock() back around the get, and then it is the old
scheme with the wait taken off the allocation path.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
