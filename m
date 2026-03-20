Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D26346E5A
	for <loongarch@lists.linux.dev>; Fri, 20 Mar 2026 19:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774035271; cv=none; b=uZ9ZHBoXghPjCbumKki4tpwpow+tzlJbOpjzx7bk6IJYOU9OyRK00DCfZabX82KK325r0GnSsJa9r+tK150ltcbBwWpInpH9bKaBMjop7yV//SM6Li8oqT0BqMugqxMhZS2abpDnfXi5SbmOPQQzI+0znzxLlbbIGwc1q79b6Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774035271; c=relaxed/simple;
	bh=5m2bYwrN2eGLC7rSfPRVQSTyLSSO2+I1HIaISDimxF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TublH75Z0cQfQVwnNbJLUrEX+i6P4hM16rC7GndIrDsBx5sX6bpuRB4XqQDnNIpRh8BGyJmNSoJt9rfL4TUnDgvkHwdqanupfc/CKvZiH4z48sm1nX+Lbk70FB2N39af/YVpRJfGn00FWLBUNid3OU6kfB2ssvf6vkb3LKMaRpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=oNWklr3U; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="oNWklr3U"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-506a747448dso8059011cf.0
        for <loongarch@lists.linux.dev>; Fri, 20 Mar 2026 12:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1774035267; x=1774640067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPJ27qWkI5c96vhdp37WS6c9O6xFfPoS9NHL0cnjclQ=;
        b=oNWklr3UeQqlYRJsZzshNSWPz6jGBCrKf+4pcG76pjAwCYVgOlxfKPgB8NxlBpO40L
         F3cQyoYltsmDwkRY8XlZMXtYKyAf/1+ERaWwJWSqnCN68MtXSkBFMuGehJZFfCx0nxXo
         4E674iAEqZwRVqeWRoyenAg0BoyivUxrEJ0R7xc1cXVBh9+AFCKt5x921CxQV8ZzqmZ6
         hhMUG++/8a1jgST59IhPHURaqWpC/ggCgQo5VdDezJ91V7HneqLGAzpDO/vwdmBegasd
         V43MJYiuAuEAtBNaFi9TyNaaiRPXcYnnqmbL9NCTSz5Kky15J55S+/RYfGavhNjP7LVg
         ipPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774035267; x=1774640067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPJ27qWkI5c96vhdp37WS6c9O6xFfPoS9NHL0cnjclQ=;
        b=PTpBk2ZGqGYLKPLidSzWxF25bKneA0M3okl6+bSDJ2pGHzBRDaWgTpNCAi7FqDrJCm
         5+PaV2iwODmPZy+a0iHeQao9vvDhL0Jehl0TJgELslmV7tfHPdxJ5NWgyO8BKbGKFTtD
         2AVFU9uP9hsMZzqgPxJ0BYHqbxq/2w4W98a74Hu4Q3PHYQpluU+oUF0p6eDThFKmfF73
         B6DN5s/loDuD0vMPqA6nwooG5iCpG34LwjKoUsScke3f3BpmFj6BesDZJWajL5TBqXxY
         rm3SiNDADPoTqVs6g0+MogjRR2/ZAo5E1jW5D30S6PN/P30qitbIWKJTVaxaSjsq8fdx
         47nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjgMlXJN9NV2ezT6f7c08/zK5OS9uIgm1cCwFDAK1NhRjLlmyX2mWocxw0MZfyDkmJUu9sVOnriC0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuV0ouJ1/gfSpEFIWIAbl3RfSL8d/Cvis14OSmPSwrDNp/9Uef
	mMps8uXZYrYR1yF36hOLrWIcMYt8f1K3AY8f+7XRcP8Y2N/VMRby9OkCNfPNUDqM5vo=
X-Gm-Gg: ATEYQzxcUHCxmEV0eJRLGezqCbA1e+HZZOPybEbVYqqNI8jt8V4NHPzgkdAXr3WuFkd
	xntm1vqPn266C9UEoptD06Z/s2eiJ8eZQhgBvYDptfo8VooWClxsn3rvRGxxEDjQAzafoy1+9OM
	6prCM9a+MIlmZjxfL3HvkkNxbR17dpp8bmdyx6wn3TpmOdg6cHDXVV3yLOBkyv+WRlntCpg56pC
	T1Y1r4JKMQNNukKtIqIuiDpxqkcid0uNks8+tPJ03z44SEffCP3h5gbJ+pAZVOsRX044htwqhBr
	9klCHdNEryeFD8+R7rYak5DlEZHdl/Ix2dewPMVgvDptYMHZCYHhrgY63bkEdU3Xbgf/QpSAel8
	a2tijDkyq4MtLjMF+afJndP5eQ0eqmk6qzLSDWzbV2cZA/vKwXhFZ8eA4sMlIH5hEBQpJf9ZNtA
	UnjBYW10d6tTaHK0z+laqhhB0+t2RO8sMldy4pB/oYoeGqtAdHEB2rhlJuNuZx+MoUvL7atmZBO
	vUk/SfkVDhKvojKxuLC
X-Received: by 2002:a05:622a:4512:b0:50b:36e4:a614 with SMTP id d75a77b69052e-50b373ea96dmr54489661cf.6.1774035267172;
        Fri, 20 Mar 2026 12:34:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d23237sm33063701cf.13.2026.03.20.12.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:34:26 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:34:24 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Message-ID: <ab2hQHsCs2MwZqj2@gourry-fedora-PF4VCD3F>
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
 <20260319-config_migration-v1-1-42270124966f@kernel.org>
 <abwVK8nLpSLVcT5G@gourry-fedora-PF4VCD3F>
 <8ebdbdba-d0b5-4887-98e5-bc45f4565d51@lucifer.local>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ebdbdba-d0b5-4887-98e5-bc45f4565d51@lucifer.local>

On Thu, Mar 19, 2026 at 04:34:04PM +0000, Lorenzo Stoakes (Oracle) wrote:
> On Thu, Mar 19, 2026 at 11:24:27AM -0400, Gregory Price wrote:
> > On Thu, Mar 19, 2026 at 09:19:40AM +0100, David Hildenbrand (Arm) wrote:
> > > All architectures that select CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE also
> > > select CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG. So we can just remove
> > > CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE.
> > >
> > > For CONFIG_MIGRATION, make it depend on CONFIG_MEMORY_HOTREMOVE instead,
> > > and make CONFIG_MEMORY_HOTREMOVE select CONFIG_MIGRATION (just like
> > > CONFIG_CMA and CONFIG_COMPACTION already do).
> > >
> > > We'll clean up CONFIG_MIGRATION next.
> > >
> > > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >
> > HOTREMOVE has long been a thorn in my side, I appreciate you cleaning
> > this up.
> 
> That is quite the HOTTAKE young Gregory!
> 
> (It seems my pun crimes are continuing)
> 

:P - it's just more config cruft that always catches me cross-platform
when i poke around in dax and hotplug.  It'll be nice to get less
automated reports from CI lol

~Gregory
