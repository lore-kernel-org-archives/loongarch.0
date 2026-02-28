Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF152430B9A;
	Sat, 28 Feb 2026 23:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772319694; cv=none; b=nOHJt8Z8DmeLF6jHpgwdwwU9CMYOfCanMM5i8ZavyfHEAhZfsazGsgOHdIa+O9eTn7fec/suWTH5E5ftlAtesUKpFaJiE4Z7pLLBQpP7wmPAkcCVjINABT56ejBVSHHoxN42wVel1/WuZho6tf5cxvA61ICW1CozQMG4tEJL70o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772319694; c=relaxed/simple;
	bh=O9uOBnZ/lKOtmWpG8ozM2E0DAaC9mNV1xzrSoLZmrkY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aKI9VGd5x7MQJEsKFH14Jqz0N6Ps9PZXqHNrUdt+mWEpNb3kS2uXbqhcCr4eolhJUMatfbKfI3X+Yf+rdn6YfmuQNXlvYcedPJfEIT9e3pJstcPHfYfNEAtFThOUxLUrvlLK6BX/N5cO0nGs4UIssarae3ol4iXK7i381/wOuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y9QqY/Um; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y9QqY/Um"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AF2C116D0;
	Sat, 28 Feb 2026 23:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1772319694;
	bh=O9uOBnZ/lKOtmWpG8ozM2E0DAaC9mNV1xzrSoLZmrkY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y9QqY/Umx9XtOjZ16O164ix2TSzEP3hGmrykgRAgox/0ibPBIvA9ydXrC9Yy2qv4z
	 fKFd8R6RWFSRWyHuDm3dSHPW9dpgJWbVvCl1frTIjiVjTxSPr+Bzy1R5C17i0zZJOw
	 iv1lhi9GBCZuxsNYUaFFulSdDc+61t9gjdWA+NuA=
Date: Sat, 28 Feb 2026 15:01:33 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Gladyshev Ilya
 <gladyshev.ilya1@h-partners.com>
Cc: Muchun Song <muchun.song@linux.dev>, David Hildenbrand
 <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, Usama Arif
 <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, Oscar
 Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi
 Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko
 <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet
 <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv7 RESEND 00/17] mm: Eliminate fake head pages from
 vmemmap optimization
Message-Id: <20260228150133.67fd58ef1ae9e50ea3f32476@linux-foundation.org>
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Feb 2026 19:42:38 +0000 "Kiryl Shutsemau (Meta)" <kas@kernel.org> wrote:

> This series removes "fake head pages" from the HugeTLB vmemmap
> optimization (HVO) by changing how tail pages encode their relationship
> to the head page.
> 
> It simplifies compound_head() and page_ref_add_unless(). Both are in the
> hot path.

This series is unaware of (and incompatible with) Gladyshev's "mm: make
ref_unless functions unless_zero only" cleanup
(https://lkml.kernel.org/r/20260206133328.426921-1-gladyshev.ilya1@h-partners.com).

Gladyshev, I'll drop that patch.  If you believe that similar changes
after Kiryl's series are desirable, please send them along, thanks.

