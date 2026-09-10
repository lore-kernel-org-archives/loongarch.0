Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD6376481
	for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038215; cv=none; b=qhmvXemo1hSiSwLnizSgujDDJHi07Og84RpOKW06k5YquBd6LXXGA69QDK2fD8XOZIBmkbC20UVG7E/QZSed04ohyx1+up/+r6rzWvXtAmXwDJQMW9HNpfVsYpB48Fj7cFcenuQLcn4obfFFD1MB1/RPgV18DcV4mlu9v/PzEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038215; c=relaxed/simple;
	bh=3gHoeS5DETEBmd8V63FOswxYH+BlwM2UupwRK7ysm3U=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=BuDudZtyFWxPbeJs9h9H3NGb6TZd9oF/CdCIXy9ulD7Sd/0xOiiOGnAYJ+aVIv5ZC83qxq6afItGQtMWG8hKhbaH9hJP2IYIlpaoppbbZOMAsdmhuUlq7u+AsqcXinBbV7LxwbjBrfGcZvSGjF2Z+ombuQ37d4NJpjmHUGSbDGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sT2mTDEg; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sT2mTDEg"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso1058328a91.1
        for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038214; x=1789643014; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=;
        b=sT2mTDEgrSuiB4qxDzCB62UnAdekQe80I977cHvfcOyRISVIfI1pauuH1GT6RyqWpF
         7fA2ZenRXoGMg8Tlqu9nFGoemPKyrXm1Ps7+6kd+sy+GkIq/yCUEOcVoKQ4Y6xPOtxmt
         kgxBHJrFsOBFD0TKq1v+vB3GrKcQ2NXEjkBl6sEu3hO229OC6zV8sXKd5lylB9w4/xBu
         cFp22q9bweztg0zYsz0ZSswHqi3MMFDDhnUPPN3W8WwDLMlqoPOsU7mABhYkUUjOThQW
         TJzXVos07nZeqsZkeGVjyZemNZ6kyeX9j4MRwKmPDt5RExCedfbYguUodOW+Uj5uljVa
         LfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038214; x=1789643014;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=;
        b=Aw8BCsJ0qt3dfNOzlphmrwasBlXAFTDUvbaFnfPm2E/Uavo2CjsqE3DsqvU6uxwaMP
         /ojfy17qw9gbUezCM4+8Qz+6lo6zeMWVvoaMZjnaIAvayXHgg1ys+Pu6o/aybT2IiBua
         c792m2dCi5GoLODtZBtSmJaDuwqF9/PSA/EN84TNAfHRtKNBrvrYgDLzMnyIx2D7ADgc
         +WHOdufNQztXuN4cO6RpebSXGpmNTQXrfFTrOnPXeGMTYnN8u1pzDgIYTyymrzpJTHrt
         K4/DKTFy+38MSciAji3eT9HIkYDCU2y5fCL+UFpXXxnYoJ6pXzvgjgjnc7H1pTb5qjsR
         Fu1Q==
X-Forwarded-Encrypted: i=1; AKwUvBytigIQhhjKV+rSM33PvtK5x4Yrje3Fp921CVLZz+UEbLTarKH4vq8HYZtzS4h1iFJ29Ooj1Gpmwh0=@lists.linux.dev
X-Gm-Message-State: AFuF++mrsbc9VYxBdIFsFkFiIx7l3YPfENFvJ0Y38MISKxbVzSL+htPq
	Tcf5cj2zJQzYdvgPSLIwdeuwecEiCRQ5tRUopNcd77cnfYcafaRVP0qJ
X-Gm-Gg: AYBFou0260OLmDimdYDh2ETeqcz94wfGsiDwvF0R2pVMfsCVbWzXjVRER+ah2bpTDVq
	T0x6eV2fs2smx3CkRKMlHUOGsF1kS5cwKn4nTl8rKyVHNEgRvsQE6a0/RJB3qR8Exd1TaKOXLOV
	MV0M5yyX5f4I6TvP8CzZrx4De2wNXDjoL44fUGkUDdFmBBjtsREMFlojyc+nhE2qPwkRg2b1Jzj
	my5DKed44vC/cVJ1qEz0OTmIK3DLwRFadxuPGzDPxtfpTozE3LZtrESvozqPsfPviKsYn1JxXkz
	0BAJKAkJxWEP/bHBzwYFQDjE6w/4Rb3MwMhLT1ogstvokFKfFepSpVecNfjTrwfGre1xBWVyUJW
	Hx2q6FnnFbXBXPtB6lks62mPJtaAb/g+0ZoovxkQuues8wcZd4HRrU1hE2H+gWbGnhm8kAfcUuc
	E/VeyzYzfN/0OhxaESyXqbSsYsdM411BPrFQSMILBoAHIhosH6le3nix5PtLmhM97NwmIowbVym
	s1aGYQePJsesj+DVmCN1mKb3xa+xj28Y/5fVShcy1VThK/G7tnp56g=
X-Received: by 2002:a17:90b:3e46:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39d70a5931bmr11901184a91.10.1789038213696;
        Thu, 10 Sep 2026 04:03:33 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm50133517eec.10.2026.09.10.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:03:33 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
In-Reply-To: <20260902164123.2546762-9-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:30:42 +0530
Message-ID: <a4pp1icl.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-9-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Sean Christopherson <seanjc@google.com> writes:

> Use the quad-underscores physical page allocator API in the memslot perf
> test in anticipation of converting the outer versions to take the memory
> region type instead of the raw memslot.  Stating the obvious, the memslot
> perf test creates and allocates from multiple memslots, and so can't use
> MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.
>
> No functional change intended.
>

yup. Indeed the later APIs will drop the memslot argument from the
main/outer page allocator APIs, so we need to use the
____vm_phy_pages_alloc() variant here. The change looks good to me.

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
