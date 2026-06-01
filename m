Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4E1157A5A
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316857; cv=none; b=V/f/UTgu1MdYM46jrCRwqeEomjIisQ+OYJBp5dpbT/dO//r91Rm+OXYLR+Kg3bkVsmMLuWaS5txGkuy4f+v8BbqtkdyhdDEuO53GRMjdeKBwvZDhaUuimGR8dugMJNh88S9D8rTt31OCWHZ31dQDim5hnYC5EydraQIIllOPX7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316857; c=relaxed/simple;
	bh=i4FBLnKuzW+Ym0q3gycX6R6X/0IDqB6uKgDDGcfJaQ4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NJZKzxZkesx9I64h+J5FXRBZo2TQr6YicDrlL41il4uYq02tq+Li2el2fGliBdo32D/t+4xHDjGfYRVWbF8i8skQIfh3C8U3izpXi+qq9qwRqhwm0NbrvdFzgd9Y3h8uWJu24ZZwlFSEwjKVKX7xmRE7DjkCtBc4TCNlHg0FW8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=taJxZziK; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="taJxZziK"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780316852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SZo5S/dgDqG8hXBhyprQZKAwoZuXhbxuoMvMnMzdUE=;
	b=taJxZziKn4woYglDXIvNCebPtG3Ett1MjiIFDKupB8/vwlbR/030Sh3VZlm77BCTnpmoG/
	rKoPBIkFdC9v9EftiInYZUlXr+q/jFF/8okro3ZtUpL84t5w/njL0YRB0TN1eiiMzWl6HF
	ljUQhnWpMMyGxM8ydCYaS7vcjT7YQjI=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v3 4/5] loongarch/mm: drop vmemmap_check_pmd helper and
 use generic code
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <8c60f9bb-7a4a-4340-b414-9f7fbef4150c@kernel.org>
Date: Mon, 1 Jun 2026 20:26:47 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Andreas Larsson <andreas@gaisler.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>,
 Albert Ou <aou@eecs.berkeley.edu>,
 WANG Xuerui <kernel@xen0n.name>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
Content-Transfer-Encoding: 7bit
Message-Id: <0C8C9C2B-2EDA-47DB-AC54-237F2127A6A8@linux.dev>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
 <20260601084845.3792171-5-songmuchun@bytedance.com>
 <8c60f9bb-7a4a-4340-b414-9f7fbef4150c@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Jun 1, 2026, at 20:24, David Hildenbrand (Arm) <david@kernel.org> wrote:
> 
> On 6/1/26 10:48, Muchun Song wrote:
>> The generic implementations now suffice; remove the loongarch copies.
> 
> You are only removing a single function? So "copy"

Yes. I copied the commit message from other commit and forgot to update
accordingly.

> 
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks.

> 
> -- 
> Cheers,
> 
> David

