Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33583546FE
	for <loongarch@lists.linux.dev>; Wed, 22 Jul 2026 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733447; cv=none; b=onfSb2AIW6oVXSs5DBrmAVswiUzhFoxY2X1NlH0LXayMWkEQR/GpNa38w4RqEPXYzekFMNTO7o8/BnO8rmw5inOsWTcUsUSnpJwRsmacfn+/qb49yvsq37ELsVacA2Qq88i3GugWJ5q4W8Bb/mhPiqRK2sd6oXXU9bnIz+KN8Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733447; c=relaxed/simple;
	bh=wPugwrYdz63MXO3I83prBjOWnOOFwc22g/qmZ3IV0aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sn33+FN533GAPyM8e8q6gWe13beITydG5iZmvAkJXauEAHPDHWXbYmxBVtIM+sCJBFrVMWGjgYuJlSpai+HpKzzI/lvi70Qsyk0Dtw/t5HuTS3k1xNHWR+miRmNcYD+fmdZZobWXBUPQ0o6qkjLh+eehsuqNv04PD9MeZNu4f1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rUL73MRh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rUL73MRh"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1740c36c5cso767757666b.2
        for <loongarch@lists.linux.dev>; Wed, 22 Jul 2026 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784733444; x=1785338244; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Upjmrh5JJYyxIf1oGA8lLlYd9DJQLFwgC7+8SiJQqeY=;
        b=rUL73MRhw10LeR9DUHec5MlvAnKYWBfhJzDVTGc2QwPEIqi4XPF3wcAbymvUjR10AT
         6hwD9At4p09rdmTO2jSLkLGiVoP10Ad3+P1Sy9I+dfDlHcdJxan7eAte9rh6moEXCZzw
         WXG+62OBctEQDpc293TXDMcCp8wEL3lIVoLZzyIa5QzSLTPcWhH1qGUadkx5Bn5ZWwnd
         g14Oo5J53BFJDiJ91UJwnX2bJMi1euAOsHcfeuFV+LMoAizQO8DnzxU3XJ2vd4Ij7wW4
         /SoOr52E+wDL8q5Y/eFbDtgVYlblfNYRc1jH1zQGhDWVQdSEPHwJNF3mtwYqzbFXGrC2
         De2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733444; x=1785338244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Upjmrh5JJYyxIf1oGA8lLlYd9DJQLFwgC7+8SiJQqeY=;
        b=qBqH4nMIAnmncxOPddpWXGoGSLhnEl8VbUbAUMI+QQJE6A6xVX7l/fNQRTm4UN6jqc
         n+PyynnJ1OHS8Zw+DV+44UFQn+swQ2H4MmqoFTNGnVVAALoCw6a8I61khtlApxEe0Glt
         InJA8b39ZwgVku6Yq4ReRcDAkXKTOGp18QIsZCfXDpngGuBckRcxZhrRA2f3RY9zxi9O
         bGZwSgzVre4tdmcrUc0b3PiTSHeKw/KLCdmzNcfJIQMbZIt8iHojbq+nZCxkTBvVczvK
         0xnVedFLlCFrleTiPkYxOieBIP5hv5Aj/8uhLzCF7vdtEG45VlTMQlgdu4Oksk2pbnT/
         uR5A==
X-Forwarded-Encrypted: i=1; AHgh+Rrvco0yXUwDXlhnfA7gDyfWELF3TbFli64+ipnhIBltyztCBc17WUTRQkAbZpZJZ6ZJy2TKiz24gTg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw7ZlB6WRN+dgrS/2pSzArlk1KeVIz7/ky7PfRDnDCkOa832sa
	WxTT3IbFT4QQz0M4F0y4iP5qazMocqX4Z95fG4wAiBSY2EaVRIxiozjpRXPgL46IyA==
X-Gm-Gg: AR+sD13C6iwQfvXidVx77TkZ+sc3cjSmpxiK6nnhjGaz+Nl07wt4kbvcTshFeHmejtE
	UM1Y1F7H5D+uPJ6V2Vfw2drrGvGiMtFL/osk9kIo1RdDp/UfIZb+r56cFGYzLjdiSB4pAAxXyNM
	GdfJ7IrNtHMowd2rYEcLXu6HBzG9Xf4cl//1SqNhO1iAws5w0XAlgHjBysN43VruTSqHRFnkGcf
	CK0CyakUN9h410GIs9epX52JYEVNycJixmQiYk+rvQuVQqgKcK+4j/lyp8MilEG1OJAe7iKxhKc
	joxgJoEpu/l3d39me3T8iaQjp7WzFK9wGMfkhnzmAEwZJqbJ3npVnGRhnLIAgALQFWjhIz0B5Qf
	7rRdLCTbYa5TmfUWg+GvfjP+E49NeqtvkQ4EsbC9ZDeOWbabIPCxQL7sBWsilF8Gsf0mU9ah2Gz
	pfRcSrCXjbBGO6mnT3W/IJBshkbtRAhDJAbs/kNYoMytQD
X-Received: by 2002:a17:907:d5a4:b0:c16:a484:90df with SMTP id a640c23a62f3a-c16b485513emr815970066b.35.1784733443140;
        Wed, 22 Jul 2026 08:17:23 -0700 (PDT)
Received: from google.com (152.118.155.104.bc.googleusercontent.com. [104.155.118.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a78229sm131383566b.1.2026.07.22.08.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:17:22 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:17:19 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
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
Message-ID: <amDe_3KFBc9CcIbo@google.com>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>

On Tue, Jul 21, 2026 at 07:23:23PM +0300, Mike Rapoport (Microsoft) wrote:

Hi Mike,

>Once this settles, the next step I'm planning is to convert arm64. This
>would be much more involved than loongarch and riscv together, so I
>didn't even aspire to include arm64 in the first RFC. That said, I have
>a very ugly arm64 prototype that rewrites arch/arm64/pageattr.c to use
>the generic CPA infrastructure and replaces the existing implementation
>of page table splits for systems that support bbml2. But there's a lot
>of yak shaving there to get from a PoC to actual patches.

Could you share your PoC for ARM64. I can help you with that and align my 
execmem rox cache for ARM64  changes to the desired shape of this API.    

Best regards,
Adrian
