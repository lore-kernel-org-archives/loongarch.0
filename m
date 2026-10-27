Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109865;
	b=WBTNhXrKsIIRkomonICB8TAHtLPCnH/lbj9feY8rGFAywkyQxNf+BvhJDTSTxqSxcDb6
	 fpTd69500lunNeQg8apwNUXtKlkKZQiViateiCyflbqKRBLcJ4JqaRraM7TKQThYrZVff
	 +Nx/nEvc8TNGHkbmwHBPDEqvu68KZWgbxKKo3UabuoHU29xgK3nwDYo55kQmuS7rK6NqJ
	 QMJw9Ae60/Fv+F+dqnd3StJX6f/D/NG5+v0r/+I4O7rq7+QbuzyaaMiGGolBMmFcE6HS4
	 iYtwbi1TJdTIBhc4HNKjZD1b8wNOTgYSELUGd4JWaJMgyv/fE53tddkSQJ9N0h/QfdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109865;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=6EV0y0rZNOrxKdLbmUoelWmdjOtw2TON5MFmaUpTBGs=;
	b=NGBqfa5TC1SfGynJIRbpEqznDptc8qHZQeipUrAMDn/F938vfG4XpyZkvohB0xxATPrL
	 pcYigLSL3TLYmlV8jz/EdB4FHzgcQNEyZA5fIIJSazGA+IowmFXb3EKkPWTlmWg/SkpiU
	 QRVwYIXNHh/zhtbdsf4Bu0tv5NR1e52xTX5aGOQlh97GHFoVSr5Ny+0mgK8JcRxVoP+zB
	 ZZbgHvUayQL8b8XL88ubbobCSCcaj3zZ4cwpT1vR1HcgSR2/rSSLgVvgm0BdDnn5gdn/z
	 pFqJyoRWLr0eHw2j6CaLNvXlOctU9Z/Vkwji6AtR+gukSPwbkc7AghECuys1R8L62Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JVpSAE7s;
	arc=none smtp.remote-ip=91.218.175.142
Received: from mta0.migadu.com (out-142.mta0.migadu.com [91.218.175.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6423606A32D
	for <loongarch@lists.linux.dev>; Tue, 27 Oct 2026 14:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6423606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JVpSAE7s
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=6EV0y0rZNOrxKdLbmUoelWmdjOtw2TON5MFmaUpTBGs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793109862; v=1; x=1793714662;
 b=JVpSAE7sa/CBBarlh3S+abLMqE64/O5GkAFR6jFVMMd1YPsboVvsspq0Iqqumk4aGOJjzy4D
 DUjBLrBmcg6VGTf9Tq2EpIcDEdEcR1JKYSpIBDwOiHlcDvyWfVdL9y1Gj58CxhQH7rdh2K7LNdk
 PYf9iCvGMGj2cOyqnqyV7n2E=
X-Envelope-To: loongarch@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 094579383d15bde2;
	Tue, 27 Oct 2026 14:04:21 +0000
X-Mizu-Trace-ID: 094579383d15bde2
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
Date: Tue, 27 Oct 2026 22:03:54 +0800
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4A32F5E6-977D-4720-8723-B19AFBC08FCF@linux.dev>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
 <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 27, 2026, at 21:35, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 10/27/26 14:13, Muchun Song wrote:
>>=20
>>=20
>>> On Oct 27, 2026, at 20:31, Kiryl Shutsemau <kas@kernel.org> wrote:
>>>=20
>>> On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) =
wrote:
>>>>=20
>>>> Right. Without HVO we would just corrupt pages in the single folio =
(which is
>>>> also not nice).
>>>>=20
>>>> I'm also questioning whether we need this RO protection all the =
time active.
>>>=20
>>> What do you have in mind? RO only under a debug option, or switching =
the
>>> tail page to RO some time after the remap?
>>=20
>> I don't think enabling RO only on debug kernels is a good choice.
>>=20
>> Within ByteDance, we once successfully caught memory failures using =
RO (because
>> we backported HVO, but some missing commits in memory failure caused =
write
>> operations on tail pages to persist). These operations triggered =
invalid writes
>> to shared tail pages.
>=20
> But would you have caught it with debug setting on in initial rollout =
/ experiments?

Possibly, but we indeed didn't catch it during the testing phase.

The likely reason is that we hadn't anticipated issues in a corner
case like a memory failure. Also, it's worth noting that during our
test and verification phases, actual memory failures simply didn't
occur.

>=20
>>=20
>> Under the old HVO schema, this invalid write only corrupted one =
folio, but under
>> the new schema, it corrupts all HVOed folios. Therefore, I personally =
believe
>> that for the new schema, the value of RO is even greater.
> But doesn't that mean that you would find serious bugs faster one way =
or the other?
>=20

Good question.

> Silent corruption of any folio state is not good.
>=20

Under the new schema, an invalid write causes massive corruption,
which would likely result in an immediate and noticeable failure
(like a crash or oops). =46rom a developer's perspective, this
definitely helps us "fail fast" and find the bug quickly.

So, let me think about what we actually lose without RO.

I believe the main difference is the debuggability of the crash context.
With RO, the hardware intercepts the write immediately and throws
a clear page fault with a call trace. Without RO, an invalid write
silently corrupts memory, and we might only find out later with no
clue where it happened.

Of course, losing this debuggability doesn't seem like a critical
issue after all. Thinking about it this way, restoring RW permissions
to fix this race condition seems like an acceptable trade-off.

Therefore, I am kind of leaning towards removing the RO protection
and restoring RW permissions to solve the race.

Thanks,
Muchun

> --=20
> Cheers,
>=20
> David

