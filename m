Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CD84F606
	for <loongarch@lists.linux.dev>; Thu,  8 Aug 2024 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723133783; cv=none; b=lfeNUBh+NvCFEtsFH5BUvXyF/3sBm7pBI2gDZZ+RtpFuW48N6fKFdOmrDWH1izOWHw3bRExv8uN+Tb2IIl3QnTJVGuRi7IzR3Bm1OAzdnQPZO86OxE6JYCYSuDlbklz5IQvzcSIayGqEo69NadxbXlA2bSSbk+ICu3dQVq5CxgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723133783; c=relaxed/simple;
	bh=R8R/7XxJiD8SbGw4qFqr3w25VlObii1GrVvmAIP4ewA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dvR/QKjJ/jxWQh8sdCNR+qBOGTddGxZ8IMyI1k2L84MQItg/cK51szf5i7IsxOIFe8TV3uFwmdqe9o17RjYsCq8SXVkgLbcoDFvqL+tYrYsB1cCw5mq7Uluks2rU4wnNtgLGxjbk4XNHsJ07HNsJSJbbkgugdwgkqLzVdLCWzKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qChh0zUY; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qChh0zUY"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so12062361fa.1
        for <loongarch@lists.linux.dev>; Thu, 08 Aug 2024 09:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723133779; x=1723738579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLPa+w6AdBa1cUfelytt4eYDYgnS/jumqOLX9cOCUyA=;
        b=qChh0zUYvzXxiznZq0ZEqBxMu3HwAVDYkpLfbsNNEOdXDe2v/NJez6CVTbmN3nMcpZ
         eeTqvtHHiavVTshEIXBruFvqa09ydn8W/PK7MTZsQnDdXU82gi8vfS15E67xbW0DWt7+
         TRhcUrI/uK33uvCPaAal6opqrJaAfvmv8SPokIHYz2LVAGrphWElaazehkQYf7ypkZgl
         oiqPDcstSbolmgBkgv1qYy20uTtEvr/oIvMKBHbsyfdwTFU3G+SfpaQlQN/UhCHKLtDj
         hPR1NEx+oVQOC70kYc2qKixLS+boonj49OhC0ZZBxePMxv+PIDQS08i0K06hPi4t8qcM
         NKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723133779; x=1723738579;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLPa+w6AdBa1cUfelytt4eYDYgnS/jumqOLX9cOCUyA=;
        b=wrAfNBmwEJfpHjvw5+ralBMyrJiZzusetrmyFjYR9JX3pojmwcKxwZ+5/8PoiljEab
         orJ5REh6F3a1PGE8Any1rSrDS80xJV2Rq1614tQ2oP1rRDP6w37Gs8nPfqGIgMP7lVTh
         I8c3fcrY1BCNo6E7nJ5DytyTCvqolXi/1b9rqvftaY+I+N+ApFOfTeO1r6TwL6bLhvRO
         +pWwMrgGPxsWErJ78NzDvp9MeFkWk7ahqNVgns17OJLeQ/Up12TQdk3blgFT51vPy/9X
         laxg5fNyiab7H5JzNTsuy77I5GgiOvYvP0Fn4fiyU5BEijTQwfKLvtp0qlYtxcZ6LmuX
         CcbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFk6t1ORVcpP3LF+qIpyw/FTmkreTE95lVdr1vs0flnYjB8yRI1NXPJmL8PrOgZdSecTv+0VQJDMMG26yR9jNprL7s+oDbJ6MY
X-Gm-Message-State: AOJu0Yy6c4Zi7xvooCgUcGa5fN6JKrcyl4H0PeCZDdI1+FBu+aBm7qyg
	ChzRlj+lwgSJrYuPZkvE9lSzNOjMKp0jOnl9l7x7DiewMDy9v2rCZOn9G8voUhI=
X-Google-Smtp-Source: AGHT+IFeg1aw2R2jdtW33+RTmD0GoFD4AbJwR/eufpV8IO4HacBEUsTerwG6znblRji34uNx3VzDqg==
X-Received: by 2002:a2e:331a:0:b0:2f0:2d85:2238 with SMTP id 38308e7fff4ca-2f19de75d02mr16453671fa.44.1723133777752;
        Thu, 08 Aug 2024 09:16:17 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27229eaasm2377515f8f.103.2024.08.08.09.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:16:16 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 824915F769;
	Thu,  8 Aug 2024 17:16:15 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
In-Reply-To: <ZrTk4sQS8k1-GBb3@google.com> (Sean Christopherson's message of
	"Thu, 8 Aug 2024 08:31:46 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
	<87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com>
	<877ccrqc06.fsf@draig.linaro.org> <ZrTk4sQS8k1-GBb3@google.com>
Date: Thu, 08 Aug 2024 17:16:15 +0100
Message-ID: <8734nfq9bk.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>=20
>> > On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
>> >> Sean Christopherson <seanjc@google.com> writes:
>> >>=20
>> >> > Now that hva_to_pfn() no longer supports being called in atomic con=
text,
>> >> > move the might_sleep() annotation from hva_to_pfn_slow() to
>> >> > hva_to_pfn().
>> >>=20
>> >> The commentary for hva_to_pfn_fast disagrees.
>> >>=20
>> >>   /*
>> >>    * The fast path to get the writable pfn which will be stored in @p=
fn,
>> >>    * true indicates success, otherwise false is returned.  It's also =
the
>> >>    * only part that runs if we can in atomic context.
>> >>    */
>> >>   static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *=
pfn)
>> >>=20
>> >> At which point did it loose the ability to run in the atomic context?=
 I
>> >> couldn't work it out from the commits.
>> >
>> > It didn't lose the ability per se (calling hva_to_pfn_fast() in atomic=
 context
>> > would still be functionally ok), rather the previous patch
>> >
>> >   KVM: Drop @atomic param from gfn=3D>pfn and hva=3D>pfn APIs
>> >
>> > removed support for doing so in order to simplify hva_to_pfn() as a wh=
ole.
>>=20
>> It still sticks out given the only caller no longer enforces this.=20
>
> Oh, sorry, I should have been more explicit.  I'll fix the comment, I sim=
ply
> missed it.

No worries, with the fixed comment:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
