Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703466;
	b=hjYeRyApjR8KGmXB3Ok4x6E83uYRu5uC4UYz5k0enGQWjEJQMa1HFq1UHG394J6iVIlJ
	 zMtxA75dFgIZIraCUaT+0YZ9KenZpRh/oLYzFswdY9NboP6THiU3BemW3hr1jFctvPVrf
	 eKHpZASw6qMy0X9TjcjKBwVplOwPtJorA0bjdF375+Il5lQcjI/M+17OZEOqVUUL0v4P6
	 SfRB9aI5nEYEZKmhPwYHRivBWxRSd7QVRDSvtiVsMICuIwwDb1yZKFkqFkWY04R7C04ye
	 +0YMqzfaOWvhw7EtnP7rbeDq2jCCo7s61kbgM37lmOOpf2LsNCZQYcmHeEf8Begu/LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703466;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=S5r3XjtXFsLjzzhMzj390HKNPBHceWrZJqEAhyaam0k=;
	b=Aj1GV63d15jG2NbH4/SsSfBccC/HgVwcvBR0taqKClwRS5xsUFoQTqKjtQiTdhH5WuFv
	 irBmzUpCEMXrispNvw3xBKXBe9JsSk6M+LGDbEZ7hu5JPyMAKzLhCA4WHNyzDSj8IwfFP
	 ecSu6tQcSr1UjP0Ujrs4l3F5bOm29SrDY5/6dwX/gHhxx63c5OgHRTlUqFT8aMEBiNMsE
	 vksJqUo4oiALZ3DbWt0Y+Q+8NGzCOPEHblB74Jf+9/sMtN6Y9FLvBsOy26aA7ofcrUhi6
	 pcHPe/v8PhFj0FQxTxWWULU9zktvt/RlcVES7Kw4odWfQ+ZeFoTAQaTIc3kpCto4bJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LVEeRbRa;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51F9606A69A
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 14:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51F9606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LVEeRbRa
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE2881BA8;
	Thu, 26 Nov 2026 06:31:00 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E9F83F86F;
	Thu, 26 Nov 2026 06:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795703463; bh=Gh8fyK7BLAji0Po7ndrDo9Z/I+fzSOToLbTFsVx3zZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVEeRbRacat2kmxF2QkCxag4t6jAyhtj4S+xDo+pF7fMr1Tz/HhujzVMY5tHehXMU
	 qCzCPO6R0EVjS9S8Iu8MQu60xg6xWeReC2v+YlZNpk+tZF0qOlBkj1aO4wtTScfy+Z
	 21pgcGpco2AGab9fHjE3qak7bp9yODvWbgfJ3hW4=
Date: Thu, 26 Nov 2026 14:30:54 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Mike Rapoport <rppt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-openrisc@vger.kernel.org
Subject: Re: [PATCH RESEND v2 12/21] mm/pgtable: redefine PGTABLE_LEVEL enum
 with ascend order from PGD
Message-ID: <awhCnpiUc1R_BLx4@e129823.arm.com>
References: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
 <20261102-dummy_ptxp3-v2-12-78840b2ec73c@arm.com>
 <awXD4i47F-VAG1tD@kernel.org>
 <awXc0MSZl9t9VW8e@e129823.arm.com>
 <682c765f-332f-4ac2-b448-4201c8fae6fc@kernel.org>
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
In-Reply-To: <682c765f-332f-4ac2-b448-4201c8fae6fc@kernel.org>

On Thu, Nov 26, 2026 at 03:19:13PM +0100, David Hildenbrand (Arm) wrote:
> On 11/24/26 19:52, Yeoreum Yun wrote:
> > On Tue, Nov 24, 2026 at 07:05:38PM +0200, Mike Rapoport wrote:
> >> On Mon, Nov 02, 2026 at 11:21:25AM +0000, Yeoreum Yun wrote:
> >>> The PGTABLE_LEVEL enum values appear to be ordered in the opposite direction
> >>> from their intended usage.
> >>>
> >>> Intuitively, higher page table levels should have smaller enum values,
> >>> but PTE is currently assigned 0.
> >>
> >> That's not what x86 thinks :)
> >> They even expose it in /proc/vmstat with smaller numbers meaning lower levels
> >>
> >> $ grep direct_map /proc/vmstat 
> >> direct_map_level2_splits 152
> >> direct_map_level3_splits 4
> >> direct_map_level2_collapses 0
> >> direct_map_level3_collapses 0
> >>
> >> Just an observation, I don't mind either order.
> > 
> > Right. I made this change because a depth-based scheme seems more intuitive.
> > 
> > As you pointed out, though, the x86 specification uses smaller
> > numbers (0) for lower levels (pte), so I think we can leave the
> > x86-specific direct_map_* entries as they are.
> 
> patch #14 depends on this, no?

Interestingly, x86 documentation numbers the PGD level as 4 or 5,
whereas helpers such as effective_prot_pgd() use 0 for PGD.

Anyway, this follows the usage and semantics of effective_prot_pXd(),
rather than architecture-specific level numbering, which varies across
architectures.

And yes, patch #14 depends on this, although changing the condition to
level != PGD_LEVEL would remove that dependency.

-- 
Sincerely,
Yeoreum Yun
